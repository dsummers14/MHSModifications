Page 50077 "Insight Promo Items List"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    PageType = List;
    SourceTable = InsightPromoItems;

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

