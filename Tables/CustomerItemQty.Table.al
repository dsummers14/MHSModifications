Table 50023 CustomerItemQty
{

    fields
    {
        field(1;CustomerNo;Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2;ItemNo;Code[20])
        {
            TableRelation = Item."No.";
        }
        field(3;MinimumQty;Decimal)
        {
        }
        field(4;MaximumQty;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;CustomerNo,ItemNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

