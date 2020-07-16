Table 50006 InsightFeatureCodes
{
    DataPerCompany = false;
    LookupPageID = "Insight Feature Codes List";

    fields
    {
        field(1;FeatureCode;Code[20])
        {
        }
        field(2;Description;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;FeatureCode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

