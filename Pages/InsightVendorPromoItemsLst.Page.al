Page 50085 "Insight Vendor Promo Items Lst"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    PageType = List;
    SourceTable = InsightPromoMaufItem;

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

