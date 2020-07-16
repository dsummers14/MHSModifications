Page 50100 InsightList
{
    PageType = List;
    SourceTable = InsightGroupFeatures;

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

