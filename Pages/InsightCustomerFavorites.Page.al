Page 50081 "Insight Customer Favorites"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    PageType = List;
    SourceTable = InsightCustomerFavorites;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ItemNo;ItemNo)
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

