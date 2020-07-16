Table 50015 InsightCustomerFavorites
{

    fields
    {
        field(1;CustomerNo;Code[20])
        {
            TableRelation = Customer;
        }
        field(2;ItemNo;Code[20])
        {
            TableRelation = Item;
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

