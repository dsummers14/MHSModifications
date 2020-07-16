Page 50061 InsightFeatureCodes
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = InsightGroupFeatures;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(GroupCode;GroupCode)
                {
                    ApplicationArea = Basic;
                }
                field(DirectiveCode;DirectiveCode)
                {
                    ApplicationArea = Basic;
                }
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

