Page 50092 "Standard Menu"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    InsertAllowed = false;
    PageType = Document;
    SourceTable = "Standard Menu Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(MenuID;Rec.MenuID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Editable = false;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Editable = false;
                }
            }
            part(StandardMenus;"Standard Menu Details")
            {
                SubPageLink = MenuID=field(MenuID);
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
                begin

                    Clear(vPublish);
                    vPublish.PassParameters(Rec.MenuID);
                    vPublish.Run();
                end;
            }
            action("Copy to Customer")
            {
                ApplicationArea = All;
                Caption = 'Copy to Customer';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Tooltip';

                trigger OnAction()
                begin
                    Clear(vCopyFrom);
                    vCopyFrom.PassVariables(Rec.MenuID);
                    vCopyFrom.Run();
                end;
            }
        }
    }

    var
        vCopyFrom: Page "Copy Standard Menu To Customer";
        vPublish: Page "Publish Standard Menu";
}

