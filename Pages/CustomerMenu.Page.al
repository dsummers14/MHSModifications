Page 50096 "Customer Menu"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Customer Menu Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(CustomerNo; Rec.CustomerNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Editable = false;

                    trigger OnValidate()
                    begin
                        if not Customer.Get(CustomerNo) then
                            Clear(Customer);
                    end;
                }
                field(CustName; Customer.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Caption = 'Cust Name';
                    Editable = false;
                }
                field(MenuID; Rec.MenuID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Editable = false;
                }
            }
            part(CustomerMenus; "Customer Menu Details")
            {
                SubPageLink = CustomerNo = field(CustomerNo),
                              MenuID = field(MenuID);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Publish)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Tooltip';

                trigger OnAction()
                begin
                    Clear(PagePublishCustomerMenu);
                    PagePublishCustomerMenu.PassParameters(Rec.CustomerNo, Rec.MenuID);
                    PagePublishCustomerMenu.RunModal();
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if not Customer.Get(Rec.CustomerNo) then
            Clear(Customer);
    end;

    var
        Customer: Record Customer;
        PagePublishCustomerMenu: Page "Publish Customer Menu";
}

