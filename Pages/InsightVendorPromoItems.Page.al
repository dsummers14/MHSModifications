Page 50086 "Insight Vendor Promo Items"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = Basic;
    PageType = List;
    SourceTable = InsightPromoMauf;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(PromoCode;PromoCode)
                {
                    ApplicationArea = Basic;
                }
                field(VendorNo;VendorNo)
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

