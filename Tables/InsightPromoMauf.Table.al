Table 50013 InsightPromoMauf
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
        field(3;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;PromoCode,VendorNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

