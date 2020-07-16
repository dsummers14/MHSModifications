Table 50003 InsightUser
{
    LookupPageID = "Insight User List";

    fields
    {
        field(1;Username;Text[32])
        {
        }
        field(2;Password;Text[32])
        {
        }
        field(3;AppGrp;Text[20])
        {
            TableRelation = InsightGroupCodes.GroupCode;
        }
        field(4;CustomerNo;Text[10])
        {
            TableRelation = Customer."No.";
        }
        field(5;rowguid;Guid)
        {
        }
    }

    keys
    {
        key(Key1;Username)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        rowguid:= CreateGuid();
    end;

    trigger OnModify()
    begin
        if IsNullGuid(rowguid) then rowguid := CreateGuid;
    end;
}

