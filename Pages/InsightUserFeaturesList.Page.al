Page 50079 "Insight User Features List"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    PageType = List;
    SourceTable = InsightUserFeatures;

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

