Table 50012 InsightPromoItems
{

    fields
    {
        field(1;PromoCode;Code[10])
        {
            TableRelation = InsightPromo.PromoCode;
        }
        field(2;ItemNo;Code[20])
        {
            TableRelation = Item."No.";
        }
    }

    keys
    {
        key(Key1;PromoCode,ItemNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

