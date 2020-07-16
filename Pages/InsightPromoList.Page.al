Page 50074 "Insight Promo List"
{
    // //iCepts 09.18.13 dxd  Upgrade2013        iCepts1.00

    ApplicationArea = Basic;
    PageType = List;
    SourceTable = InsightPromo;
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
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
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

