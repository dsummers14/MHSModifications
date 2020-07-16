Table 50025 "Meal Routes"
{

    fields
    {
        field(1;"Route No.";Code[10])
        {
        }
        field(2;"Delivery Stop";Integer)
        {
        }
        field(3;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Route No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

