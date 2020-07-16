Table 50005 InsightOrderLineView
{
    DataPerCompany = false;
    LinkedObject = true;

    fields
    {
        field(1;CommerceId;Guid)
        {
        }
        field(2;LineId;Guid)
        {
        }
        field(3;CreatedBy;Text[32])
        {
        }
        field(4;CreatedDate;DateTime)
        {
        }
        field(5;ModifiedBy;Text[32])
        {
        }
        field(6;ModifiedDate;Date)
        {
        }
        field(7;PricedDate;DateTime)
        {
        }
        field(8;BoCheckedDate;DateTime)
        {
        }
        field(9;Qoh;Integer)
        {
        }
        field(10;ParentLineId;Guid)
        {
        }
        field(11;OrigOrderAmt;Decimal)
        {
        }
        field(12;AmtOrdered;Decimal)
        {
        }
        field(13;AmtCommited;Decimal)
        {
        }
        field(14;ItemNo;Text[30])
        {
        }
        field(15;DiscPct;Decimal)
        {
        }
        field(16;RequestedDeliveryDate;Date)
        {
        }
    }

    keys
    {
        key(Key1;CommerceId,LineId)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

