Page 50091 "Standard Menus"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = All;
    CardPageID = "Standard Menu";
    PageType = List;
    SourceTable = "Standard Menu Master";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MenuID;Rec.MenuID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
            }
        }
    }

    actions
    {
    }
}

