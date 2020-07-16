Report 50093 "Meal Routing Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/MealRoutingReport.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Sales Line";"Sales Line")
        {
            DataItemTableView = sorting("Shipment Date","Sell-to Customer No.",Type,"No.");
            RequestFilterFields = "Shipment Date","Sell-to Customer No.",Type,"No.";
            column(ReportForNavId_1000000000; 1000000000)
            {
            }
            column(ShipmentDate;"Sales Line"."Shipment Date")
            {
            }
            column(RouteNo;"Sales Line"."Route No.")
            {
            }
            column(DeliveryStop;"Sales Line"."Delivery Stop")
            {
            }
            column(StudentHomeInitials;"Sales Line"."Student Home Initials")
            {
            }
            column(StudnetAllergies;"Sales Line"."Student Allergies")
            {
            }
            column(SellToCustomer;"Sales Line"."Sell-to Customer No.")
            {
            }
            column(UnitofMeasure;"Sales Line"."Unit of Measure")
            {
            }
            column(Quantity;"Sales Line".Quantity)
            {
            }
            column(CustomerName;CustomerName)
            {
            }
            column(ItemNo;"Sales Line"."No.")
            {
            }
            column(ItemDescription;"Sales Line".Description)
            {
            }
            column(Full;Full)
            {
            }
            column(Half;Half)
            {
            }
            column(DocumentNumber;"Sales Line"."Document No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Full := 0;
                Half := 0;

                if not CustomerRec.Get("Sales Line"."Sell-to Customer No.") then
                  Clear(CustomerRec)
                 else begin
                   CustomerName := CustomerRec.Name;
                   "Sales Line"."Route No." := CustomerRec."Route No.";
                   "Sales Line"."Delivery Stop" := CustomerRec."Delivery Stop";
                   "Sales Line"."Student Allergies" := CustomerRec."Student Allergies";
                   "Sales Line"."Student Home Initials" := CustomerRec."Student Home Initials";
                   end;

                if "Sales Line"."Unit of Measure" = 'Full Pan' then begin
                   Full := "Sales Line".Quantity;
                  end else if "Sales Line"."Unit of Measure" = 'Half Pan' then begin
                    Half := "Sales Line".Quantity;
                    end else if PrepardMealsOnly then CurrReport.Skip
                             else Half := "Sales Line".Quantity;

                SaveCustomer := "Sales Line"."Sell-to Customer No.";
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
                    field(PreparedMeails;PrepardMealsOnly)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Prepared Meals Only';
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
        CustomerRec: Record Customer;
        CustomerName: Text[30];
        FullTotal: Integer;
        HalfTotal: Integer;
        TempSalesInvoiceLine: Record "Sales Line" temporary;
        SaveCustomer: Code[20];
        SubFullTotal: Integer;
        SubHalfTotal: Integer;
        Full: Integer;
        Half: Integer;
        PrintToExcel: Boolean;
        Text101: label 'Data';
        Text102: label 'Meal Route Report';
        PrepardMealsOnly: Boolean;
}

