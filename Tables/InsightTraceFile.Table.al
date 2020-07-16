Table 50002 InsightTraceFile
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
        }
        field(2;TraceTxt;Text[250])
        {
        }
        field(3;DteStmp;Date)
        {
        }
        field(4;TmeStmp;Time)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

