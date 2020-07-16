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
                field(MenuID;vMenuID)
                {
                    ApplicationArea = Basic;
                }
                field(CustomerNo;vCustomerNo)
                {
                    ApplicationArea = Basic;
                    TableRelation = Customer."No.";
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
                ApplicationArea = Basic;
                Caption = 'Copy';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if vCustomerNo <> '' then CopyToCustomer;
                end;
            }
        }
    }

    var
        vCustomerNo: Code[20];
        vStartDate: Date;
        vMenuID: Code[20];
        Customer: Record Customer;

        procedure PassVariables(var MenuId: Code[20])
    begin
        vMenuID := MenuId;
    end;

        procedure CopyToCustomer()
    var
        iCustHeader: Record "Customer Menu Header";
        iCustDetail: Record "Customer Menu Details";
        iStdHeader: Record "Standard Menu Master";
        iStdDetail: Record "Standard Menu Details";
    begin
        iCustHeader.Reset;
        iCustHeader.SetRange(CustomerNo,vCustomerNo);
        iCustHeader.SetRange(MenuID,vMenuID);
        iCustHeader.DeleteAll;

        iCustDetail.Reset;
        iCustDetail.SetRange(CustomerNo,vCustomerNo);
        iCustDetail.SetRange(MenuID,vMenuID);
        iCustDetail.DeleteAll;

        iStdHeader.Reset;
        iStdHeader.SetRange(MenuID,vMenuID);
        iStdDetail.Reset;
        iStdDetail.SetRange(MenuID,vMenuID);

        if iStdHeader.FindFirst then
        begin
          iCustHeader.Init;
          iCustHeader.CustomerNo := vCustomerNo;
          iCustHeader.MenuID := vMenuID;
          iCustHeader.Description := iStdHeader.Description;
          iCustHeader.Insert;

          if iStdDetail.FindFirst then
          repeat
            iCustDetail.Init;
            iCustDetail.CustomerNo := vCustomerNo;
            iCustDetail.MenuID := iStdDetail.MenuID;
            iCustDetail.WeekNo := iStdDetail.WeekNo;
            iCustDetail.Day := iStdDetail.Day;
            iCustDetail.Meal := iStdDetail.Meal;
            iCustDetail.SeqNo := iStdDetail.SeqNo;
            iCustDetail.ItemNo := iStdDetail.ItemNo;
            iCustDetail.Quantity := iStdDetail.Quantity;
            iCustDetail.Uom := iStdDetail.Uom;
            iCustDetail.Insert;
          until iStdDetail.Next = 0;

          Message ('Menu Copied');
        end;
    end;
}

