Table 50014 InsightPromoMaufItem
{

    fields
    {
        field(1;PromoCode;Code[10])
        {
        }
        field(2;VendorNo;Code[20])
        {
            TableRelation = Vendor;
        }
        field(3;ItemNo;Code[10])
        {
            TableRelation = Item;
        }
    }

    keys
    {
        key(Key1;PromoCode,VendorNo,ItemNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

