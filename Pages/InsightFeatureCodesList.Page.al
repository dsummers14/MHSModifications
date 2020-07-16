Page 50071 "Insight Feature Codes List"
{
    // //iCepts 09.18.13 dxd Upgrade2013            iCepts1.00

    PageType = List;
    SourceTable = InsightFeatureCodes;

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

