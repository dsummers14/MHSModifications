Report 50093 "Meal Routing Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ReportLayouts/MealRoutingReport.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Sales Line"; "Sales Line")
        {
            DataItemTableView = sorting("Shipment Date", "Sell-to Customer No.", Type, "No.");
            RequestFilterFields = "Shipment Date", "Sell-to Customer No.", Type, "No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(ShipmentDate; "Sales Line"."Shipment Date")
            {
            }
            column(RouteNo; "Sales Line"."Route No.")
            {
            }
            column(DeliveryStop; "Sales Line"."Delivery Stop")
            {
            }
            column(StudentHomeInitials; "Sales Line"."Student Home Initials")
            {
            }
            column(StudnetAllergies; "Sales Line"."Student Allergies")
            {
            }
            column(SellToCustomer; "Sales Line"."Sell-to Customer No.")
            {
            }
            column(UnitofMeasure; "Sales Line"."Unit of Measure")
            {
            }
            column(Quantity; "Sales Line".Quantity)
            {
            }
            column(CustomerName; CustomerName)
            {
            }
            column(ItemNo; "Sales Line"."No.")
            {
            }
            column(ItemDescription; "Sales Line".Description)
            {
            }
            column(Full; Full)
            {
            }
            column(Half; Half)
            {
            }
            column(DocumentNumber; "Sales Line"."Document No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Full := 0;
                Half := 0;

                if not Customer.Get("Sales Line"."Sell-to Customer No.") then
                    Clear(Customer)
                else begin
                    CustomerName := CopyStr(Customer.Name, 1, 30);
                    "Sales Line"."Route No." := Customer."Route No.";
                    "Sales Line"."Delivery Stop" := Customer."Delivery Stop";
                    "Sales Line"."Student Allergies" := Customer."Student Allergies";
                    "Sales Line"."Student Home Initials" := Customer."Student Home Initials";
                end;

                if "Sales Line"."Unit of Measure" = 'Full Pan' then
                    Full := "Sales Line".Quantity
                else
                    if "Sales Line"."Unit of Measure" = 'Half Pan' then
                        Half := "Sales Line".Quantity
                    else
                        if PrepardMealsOnly then
                            CurrReport.Skip()
                        else
                            Half := "Sales Line".Quantity;

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(PreparedMeails; PrepardMealsOnly)
                    {
                        ApplicationArea = All;
                        Caption = 'Prepared Meals Only';
                        ToolTip = 'Tooltip';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Customer: Record Customer;
        CustomerName: Text[30];
        Full: Integer;
        Half: Integer;
        PrepardMealsOnly: Boolean;
}

