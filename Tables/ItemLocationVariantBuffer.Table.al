Table 10139 "Item Location Variant Buffer"
{

    fields
    {
        field(1;"Item No.";Code[20])
        {
        }
        field(2;"Variant Code";Code[10])
        {
        }
        field(3;"Location Code";Code[10])
        {
        }
        field(4;Label;Text[250])
        {
        }
        field(5;"Remaining Quantity";Decimal)
        {
        }
        field(6;Value1;Decimal)
        {
        }
        field(7;Value2;Decimal)
        {
        }
        field(8;Value3;Decimal)
        {
        }
        field(9;Value4;Decimal)
        {
        }
        field(10;Value5;Decimal)
        {
        }
        field(11;Value6;Decimal)
        {
        }
        field(12;Value7;Decimal)
        {
        }
        field(13;Value8;Decimal)
        {
        }
        field(14;Value9;Decimal)
        {
        }
        field(15;Value10;Decimal)
        {
        }
        field(16;Value11;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Item No.","Variant Code","Location Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

