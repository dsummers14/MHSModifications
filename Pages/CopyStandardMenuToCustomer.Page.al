Page 50094 "Copy Standard Menu To Customer"
{
    // //iCepts 09.24.13 DXD Upgrade2013                     iCepts1.00

    PageType = NavigatePage;

    layout
    {
        area(content)
        {
            group(Control1000000001)
            {
                field(MenuID; vMenuID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Caption = 'Menu Id';
                }
                field(CustomerNo; vCustomerNo)
                {
                    ApplicationArea = All;
                    TableRelation = Customer."No.";
                    ToolTip = 'Tooltip';
                    Caption = 'Customer No';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Copy)
            {
                ApplicationArea = All;
                Caption = 'Copy';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Tooltip';

                trigger OnAction()
                begin
                    if vCustomerNo <> '' then CopyToCustomer();
                end;
            }
        }
    }

    var
        vCustomerNo: Code[20];
        vMenuID: Code[20];

    procedure PassVariables(MenuId: Code[20])
    begin
        vMenuID := MenuId;
    end;

    procedure CopyToCustomer()
    var
        iCustomerMenuHeader: Record "Customer Menu Header";
        iCustomerMenuDetails: Record "Customer Menu Details";
        iStandardMenuMaster: Record "Standard Menu Master";
        iStandardMenuDetails: Record "Standard Menu Details";
    begin
        iCustomerMenuHeader.Reset();
        iCustomerMenuHeader.SetRange(CustomerNo, vCustomerNo);
        iCustomerMenuHeader.SetRange(MenuID, vMenuID);
        iCustomerMenuHeader.DeleteAll();

        iCustomerMenuDetails.Reset();
        iCustomerMenuDetails.SetRange(CustomerNo, vCustomerNo);
        iCustomerMenuDetails.SetRange(MenuID, vMenuID);
        iCustomerMenuDetails.DeleteAll();

        iStandardMenuMaster.Reset();
        iStandardMenuMaster.SetRange(MenuID, vMenuID);
        iStandardMenuDetails.Reset();
        iStandardMenuDetails.SetRange(MenuID, vMenuID);

        if iStandardMenuMaster.FindFirst() then begin
            iCustomerMenuHeader.Init();
            iCustomerMenuHeader.CustomerNo := vCustomerNo;
            iCustomerMenuHeader.MenuID := vMenuID;
            iCustomerMenuHeader.Description := iStandardMenuMaster.Description;
            iCustomerMenuHeader.Insert();

            if iStandardMenuDetails.FindSet() then
                repeat
                    iCustomerMenuDetails.Init();
                    iCustomerMenuDetails.CustomerNo := vCustomerNo;
                    iCustomerMenuDetails.MenuID := iStandardMenuDetails.MenuID;
                    iCustomerMenuDetails.WeekNo := iStandardMenuDetails.WeekNo;
                    iCustomerMenuDetails.Day := iStandardMenuDetails.Day;
                    iCustomerMenuDetails.Meal := iStandardMenuDetails.Meal;
                    iCustomerMenuDetails.SeqNo := iStandardMenuDetails.SeqNo;
                    iCustomerMenuDetails.ItemNo := iStandardMenuDetails.ItemNo;
                    iCustomerMenuDetails.Quantity := iStandardMenuDetails.Quantity;
                    iCustomerMenuDetails.Uom := iStandardMenuDetails.Uom;
                    iCustomerMenuDetails.Insert();
                until iStandardMenuDetails.Next() = 0;

            Message('Menu Copied');
        end;
    end;
}

