Table 50011 InsightPromo
{
    LookupPageID = "Insight Promo List";

    fields
    {
        field(1;PromoCode;Code[10])
        {
        }
        field(2;Description;Text[50])
        {
        }
        field(3;Type;Text[1])
        {
            InitValue = 'S';
            ValuesAllowed = 'U','S','M';
        }
    }

    keys
    {
        key(Key1;PromoCode)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

