Table 50007 InsightGroupCodes
{
    DataPerCompany = false;
    LookupPageID = "Insight Group Codes List";

    fields
    {
        field(1;GroupCode;Code[20])
        {
        }
        field(2;Description;Text[250])
        {
        }
    }

    keys
    {
        key(Key1;GroupCode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

