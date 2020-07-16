Page 50060 "Import-Export Roles-Permission"
{
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(ImportRoles)
            {
                ApplicationArea = Basic;
                Caption = 'Import Roles';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = XMLport "Import/Export Roles";
            }
            action(ImportPermissions)
            {
                ApplicationArea = Basic;
                Caption = 'Import Permissions';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = XMLport "Import/Export Permissions";
            }
        }
    }
}

