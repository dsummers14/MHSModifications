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
                field(CustomerNo;CustomerNo)
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        if not Cust.Get(CustomerNo) then
                          Clear(Cust);
                    end;
                }
                field(CustName;Cust.Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cust Name';
                    Editable = false;
                }
                field(MenuID;MenuID)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(CustomerMenus;"Customer Menu Details")
            {
                SubPageLink = CustomerNo=field(CustomerNo),
                              MenuID=field(MenuID);
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Publish)
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Clear(vPublish);
                    vPublish.PassParameters(CustomerNo,MenuID);
                    vPublish.Run;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if not Cust.Get(CustomerNo) then
          Clear(Cust);
    end;

    var
        Cust: Record Customer;
        vPublish: Page "Publish Customer Menu";
}

