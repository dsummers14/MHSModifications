Table 50016 InsightTemplateHeader
{
    LookupPageID = "Insight Order Forms";

    fields
    {
        field(1;CustomerNo;Code[20])
        {
        }
        field(2;ListName;Text[50])
        {
        }
        field(3;Description;Text[100])
        {
        }
    }

    keys
    {
        key(Key1;CustomerNo,ListName)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        iTemplateDetail: Record InsightTemplateDetails;
    begin
        iTemplateDetail.Reset;
        iTemplateDetail.SetRange(CustomerNo,Rec.CustomerNo);
        iTemplateDetail.SetRange(ListName,Rec.ListName);
        iTemplateDetail.DeleteAll;
    end;
}

