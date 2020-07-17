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
                field(MenuID;vMenuID)
                {
                    ApplicationArea = Basic;
                }
                field("Start Date";vStartDate)
                {
                    ApplicationArea = Basic;
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
                ApplicationArea = Basic;
                Caption = 'Publish';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    iDay: Text[30];
                begin
                    iDay := Format(vStartDate,0,'<WeekDay>');

                    if iDay <> '1' then begin
                      if GuiAllowed then begin
                         Message ('The Starting Date must be a Monday!')
                      end;
                    end else
                        gPublish;
                end;
            }
        }
    }

    var
        vCustomerNo: Code[20];
        vMenuID: Code[20];
        vStartDate: Date;
        Win: Dialog;

        procedure PassParameters(var pMenuID: Code[20])
    begin
        vMenuID := pMenuID;
    end;

        procedure gPublish()
    var
      /*   iTemplateHeader: Record InsightTemplateHeader;
        iTemplateDetail: Record InsightTemplateDetails; */
        iListName: Text[50];
        iDescription: Text[100];
        iDate: Date;
        iMeal: Integer;
        iItem: Record Item;
        iStdHeader: Record "Standard Menu Master";
        iStdDetail: Record "Standard Menu Details";
        iCustomer: Record Customer;
    begin
        iCustomer.Reset;
        iCustomer.SetRange(Allocation,true);
        iStdHeader.Reset;
        iStdHeader.SetRange(MenuID,vMenuID);

        if iStdHeader.FindFirst then
        begin
          if iCustomer.FindFirst then
          repeat
            vCustomerNo := iCustomer."No.";
            iStdDetail.Reset;
            iStdDetail.SetRange(MenuID,vMenuID);

            if iStdDetail.FindFirst then
            repeat
              // Check for new day, meal or menu id
              iDate := vStartDate + (7 * (iStdDetail.WeekNo - 1)) + iStdDetail.Day;
              iMeal := iStdDetail.Meal;

              if Format(iDate,0,'<Year4><Month,2><Day,2>') + Format(iMeal)
                 + iStdDetail.MenuID <> iListName then
              begin
                iListName := Format(iDate,0,'<Year4><Month,2><Day,2>') + Format(iMeal) + iStdDetail.MenuID;
                iDescription := Format(iStdDetail.Meal) + ' for ' +
                                Format(iDate,0,'<Weekday Text> <Month Text> <Day>') + ' - ' +
                                iStdHeader.Description;

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
            until iStdDetail.Next = 0;

          until iCustomer.Next = 0;

          Message('Menu Published');
        end;
    end;
}

