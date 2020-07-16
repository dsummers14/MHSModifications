Page 50083 "Insight Promo Vendors"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    PageType = List;
    SourceTable = InsightPromoMauf;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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

