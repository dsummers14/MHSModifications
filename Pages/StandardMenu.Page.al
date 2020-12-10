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
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
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
                ApplicationArea = Basic;
                Caption = 'Publish';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    Clear(vPublish);
                    vPublish.PassParameters(Rec.MenuID);
                    vPublish.Run;
                end;
            }
            action("Copy to Customer")
            {
                ApplicationArea = Basic;
                Caption = 'Copy to Customer';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Clear(vCopyFrom);
                    vCopyFrom.PassVariables(Rec.MenuID);
                    vCopyFrom.Run;
                end;
            }
        }
    }

    var
        vCopyFrom: Page "Copy Standard Menu To Customer";
        vPublish: Page "Publish Standard Menu";
}

