Page 50098 "Publish Customer Menu"
{
   // PageType = NavigatePage;

    layout
    {
        area(content)
        {
            group(MenuPublishing)
            {
                Caption = 'Menu Publishing';

                field("Customer Number"; vCustomerNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Caption = 'Customer No';
                }
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
                        PublishMenu();
                end;
            }
        }
    }

    var
        vCustomerNo: Code[20];
        vMenuID: Code[20];
        vStartDate: Date;

    procedure PassParameters(pCustomerNo: Code[20]; pMenuID: Code[20])
    begin
        vCustomerNo := pCustomerNo;
        vMenuID := pMenuID;
    end;

    procedure PublishMenu()
    var
        iPublishedMenuHeader: Record PublishedMenuHeader;
        iPublishedMenuDetail: Record PublishedMenuDetails;
        iCustomerMenuHeader: Record "Customer Menu Header";
        iCustomerMenuDetails: Record "Customer Menu Details";
        iListName: Text[50];
        iDescription: Text[100];
        iDate: Date;
        iMeal: Integer;
    begin
        iCustomerMenuHeader.Reset();
        iCustomerMenuHeader.SetRange(CustomerNo, vCustomerNo);
        iCustomerMenuHeader.SetRange(MenuID, vMenuID);

        iCustomerMenuDetails.Reset();
        iCustomerMenuDetails.SetRange(CustomerNo, vCustomerNo);
        iCustomerMenuDetails.SetRange(MenuID, vMenuID);

        if iCustomerMenuHeader.FindFirst() then begin
            if iCustomerMenuDetails.FindSet() then
                repeat
                    // Check for new day, meal or menu id
                    iDate := vStartDate + (7 * (iCustomerMenuDetails.WeekNo - 1)) + iCustomerMenuDetails.Day;
                    iMeal := iCustomerMenuDetails.Meal;

                    if Format(iDate, 0, '<Year4><Month,2><Day,2>') + Format(iMeal)
                       + iCustomerMenuDetails.MenuID <> iListName then begin
                        iListName := Format(iDate, 0, '<Year4><Month,2><Day,2>') + Format(iMeal) + iCustomerMenuDetails.MenuID;
                        iDescription := Format(iCustomerMenuDetails.Meal) + ' for ' +
                                        Format(iDate, 0, '<Weekday Text> <Month Text> <Day>') + ' - ' +
                                        iCustomerMenuHeader.Description;

                        iPublishedMenuHeader.Reset();
                        iPublishedMenuHeader.SetRange(CustomerNo, vCustomerNo);
                        iPublishedMenuHeader.SetRange(ListName, iListName);
                        iPublishedMenuHeader.DeleteAll();

                        iPublishedMenuDetail.Reset();
                        iPublishedMenuDetail.SetRange(CustomerNo, vCustomerNo);
                        iPublishedMenuDetail.SetRange(ListName, iListName);
                        iPublishedMenuDetail.DeleteAll();

                        iPublishedMenuHeader.Init();
                        iPublishedMenuHeader.CustomerNo := vCustomerNo;
                        iPublishedMenuHeader.ListName := iListName;
                        iPublishedMenuHeader.Description := iDescription;
                        iPublishedMenuHeader.Insert();
                    end;


                    iPublishedMenuDetail.Init();
                    iPublishedMenuDetail.CustomerNo := vCustomerNo;
                    iPublishedMenuDetail.ListName := iListName;
                    iPublishedMenuDetail.SeqNo := iCustomerMenuDetails.SeqNo;
                    iPublishedMenuDetail.ItemNo := iCustomerMenuDetails.ItemNo;
                    iPublishedMenuDetail.OrderQty := iCustomerMenuDetails.Quantity;
                    iPublishedMenuDetail.RequestDate := iDate;
                    iPublishedMenuDetail.UOM := iCustomerMenuDetails.Uom;
                    iPublishedMenuDetail.Insert();
                until iCustomerMenuDetails.Next() = 0;
            Message('Menu Published');
        end;
    end;
}

