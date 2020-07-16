Page 50084 "Insight Vendor Promo"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = InsightPromo;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(PromoCode;PromoCode)
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

