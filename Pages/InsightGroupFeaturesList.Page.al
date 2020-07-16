Page 50075 "Insight Group Features List"
{
    // //iCepts 09.18.13 DXD Upgrade2013           iCepts1.00

    PageType = List;
    SourceTable = InsightGroupFeatures;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(FeatureCode;FeatureCode)
                {
                    ApplicationArea = Basic;
                }
                field(Value;Value)
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

