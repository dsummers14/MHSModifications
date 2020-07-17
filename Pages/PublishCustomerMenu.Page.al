Page 50098 "Publish Customer Menu"
{
    //DRS 07/17.20 - Rem'd out code that accesses Insight Tables
    
    //iCepts 09.23.13 DXD Upgrade2013                     iCepts1.00

    PageType = NavigatePage;

    layout
    {
        area(content)
        {
            group(Control1000000005)
            {
                field("Customer Number";vCustomerNo)
                {
                    ApplicationArea = Basic;
                }
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

        procedure PassParameters(var pCustomerNo: Code[20];var pMenuID: Code[20])
    begin
        vCustomerNo := pCustomerNo;
        vMenuID := pMenuID;
    end;

        procedure gPublish()
    var
      /*   iTemplateHeader: Record InsightTemplateHeader;
        iTemplateDetail: Record InsightTemplateDetails; */
        iCustHeader: Record "Customer Menu Header";
        iCustDetail: Record "Customer Menu Details";
        iListName: Text[50];
        iDescription: Text[100];
        iDate: Date;
        iMeal: Integer;
        iItem: Record Item;
    begin
        iCustHeader.Reset;
        iCustHeader.SetRange(CustomerNo,vCustomerNo);
        iCustHeader.SetRange(MenuID,vMenuID);

        iCustDetail.Reset;
        iCustDetail.SetRange(CustomerNo,vCustomerNo);
        iCustDetail.SetRange(MenuID,vMenuID);

        if iCustHeader.FindFirst then
        begin
          if iCustDetail.FindFirst then
          repeat
            // Check for new day, meal or menu id
            iDate := vStartDate + (7 * (iCustDetail.WeekNo - 1)) + iCustDetail.Day;
            iMeal := iCustDetail.Meal;

            if Format(iDate,0,'<Year4><Month,2><Day,2>') + Format(iMeal)
               + iCustDetail.MenuID <> iListName then
            begin
              iListName := Format(iDate,0,'<Year4><Month,2><Day,2>') + Format(iMeal) + iCustDetail.MenuID;
              iDescription := Format(iCustDetail.Meal) + ' for ' +
                              Format(iDate,0,'<Weekday Text> <Month Text> <Day>') + ' - ' +
                              iCustHeader.Description;
/* 
              iTemplateHeader.Reset;
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


           /*  iTemplateDetail.Init;
            iTemplateDetail.CustomerNo := vCustomerNo;
            iTemplateDetail.ListName := iListName;
            iTemplateDetail.SeqNo := iCustDetail.SeqNo;
            iTemplateDetail.ItemNo := iCustDetail.ItemNo;
            iTemplateDetail.OrderQty := iCustDetail.Quantity;
            iTemplateDetail.RequestDate := iDate;
            iTemplateDetail.UOM := iCustDetail.Uom;
            iTemplateDetail.Insert; */
          until iCustDetail.Next = 0;
          Message('Menu Published');
        end;
    end;
}

