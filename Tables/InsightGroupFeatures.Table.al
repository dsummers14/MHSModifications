Table 50009 InsightGroupFeatures
{

    fields
    {
        field(1;GroupCode;Code[20])
        {
            TableRelation = InsightGroupCodes.GroupCode;
        }
        field(2;DirectiveCode;Code[20])
        {
            TableRelation = InsightDirectiveCodes.DirectiveCode;
        }
        field(3;FeatureCode;Code[20])
        {
            TableRelation = InsightFeatureCodes.FeatureCode;
        }
        field(4;Value;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;GroupCode,DirectiveCode,FeatureCode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

