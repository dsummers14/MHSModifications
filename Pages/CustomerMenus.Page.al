Page 50095 "Customer Menus"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = Basic;
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
                field(CustomerNo;CustomerNo)
                {
                    ApplicationArea = Basic;
                }
                field(MenuID;MenuID)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

