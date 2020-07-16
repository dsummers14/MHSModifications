Table 50008 InsightDirectiveCodes
{
    LookupPageID = "Insight Directives List";

    fields
    {
        field(1;DirectiveCode;Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;DirectiveCode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

