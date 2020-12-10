Page 50099 "Publish Standard Menu"
{
    //DRS 07/17.20 - Rem'd out code that accesses Insight Tables
    //iCepts 09.23.13 DXD Upgrade2013                     iCepts1.00

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
                field("Start Date"; vStartDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Caption = 'Start Date';
                }
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
                Caption = 'Publish';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Tooltip';

                trigger OnAction()
                var
                    iDay: Text[30];
                begin
                    iDay := Format(vStartDate, 0, '<WeekDay>');

                    if iDay <> '1' then begin
                        if GuiAllowed then
                            Message('The Starting Date must be a Monday!')
                    end else
                        gPublish();
                end;
            }
        }
    }

    var
       // vCustomerNo: Code[20];
        vMenuID: Code[20];
        vStartDate: Date;
       
    procedure PassParameters(pMenuID: Code[20])
    begin
        vMenuID := pMenuID;
    end;

    procedure gPublish()
    var
        iStandardMenuMaster: Record "Standard Menu Master";
        iStandardMenuDetails: Record "Standard Menu Details";
        iCustomer: Record Customer;
        /*   iTemplateHeader: Record InsightTemplateHeader;
          iTemplateDetail: Record InsightTemplateDetails; */
        iListName: Text[50];
        iDescription: Text[100];
        iDate: Date;
        iMeal: Integer;
    begin
        iCustomer.Reset();
        iCustomer.SetRange(Allocation, true);
        iStandardMenuMaster.Reset();
        iStandardMenuMaster.SetRange(MenuID, vMenuID);

        if iStandardMenuMaster.FindFirst() then begin
            if iCustomer.FindSet() then
                repeat
                    //vCustomerNo := iCustomer."No.";
                    iStandardMenuDetails.Reset();
                    iStandardMenuDetails.SetRange(MenuID, vMenuID);

                    if iStandardMenuDetails.FindSet() then
                        repeat
                            // Check for new day, meal or menu id
                            iDate := vStartDate + (7 * (iStandardMenuDetails.WeekNo - 1)) + iStandardMenuDetails.Day;
                            iMeal := iStandardMenuDetails.Meal;

                            if Format(iDate, 0, '<Year4><Month,2><Day,2>') + Format(iMeal)
                               + iStandardMenuDetails.MenuID <> iListName then begin
                                iListName := Format(iDate, 0, '<Year4><Month,2><Day,2>') + Format(iMeal) + iStandardMenuDetails.MenuID;
                                iDescription := Format(iStandardMenuDetails.Meal) + ' for ' +
                                                Format(iDate, 0, '<Weekday Text> <Month Text> <Day>') + ' - ' +
                                                iStandardMenuMaster.Description;

                                /*   iTemplateHeader.Reset;
                                  iTemplateHeader.SetRange(CustomerNo,vCustomerNo);
                                  iTemplateHeader.SetRange(ListName,iListName);
                                  iTemplateHeader.DeleteAll;

                                  iTemplateDetail.Reset;
                                  iTemplateDetail.SetRange(CustomerNo,vCustomerNo);
                                  iTemplateDetail.SetRange(ListName,iListName);
                                  iTemplateDetail.DeleteAll;

                                  iTemplateHeader.Init;
                                  iTemplateHeader.CustomerNo := vCustomerNo;
                                  iTemplateHeader.ListName := iListName;
                                  iTemplateHeader.Description := iDescription;
                                  iTemplateHeader.Insert; */
                            end;

                        /*    iTemplateDetail.Init;
                           iTemplateDetail.CustomerNo := vCustomerNo;
                           iTemplateDetail.ListName := iListName;
                           iTemplateDetail.SeqNo := iStdDetail.SeqNo;
                           iTemplateDetail.ItemNo := iStdDetail.ItemNo;
                           iTemplateDetail.OrderQty := iStdDetail.Quantity;
                           iTemplateDetail.RequestDate := iDate;
                           iTemplateDetail.UOM := iStdDetail.Uom;
                           iTemplateDetail.Insert; */
                        until iStandardMenuDetails.Next() = 0;

                until iCustomer.Next() = 0;

            Message('Menu Published');
        end;
    end;
}

