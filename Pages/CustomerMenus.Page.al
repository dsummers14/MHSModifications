Page 50095 "Customer Menus"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = All;
    CardPageID = "Customer Menu";
    PageType = List;
    SourceTable = "Customer Menu Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CustomerNo;Rec.CustomerNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(MenuID;MenuID)
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

