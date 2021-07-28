Table 50016 PublishedMenuHeader
{
    fields
    {
        field(1; CustomerNo; Code[20])
        {
        }
        field(2; ListName; Text[50])
        {
        }
        field(3; Description; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; CustomerNo, ListName)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        PublishedMenuDetails: Record PublishedMenuDetails;
    begin
        PublishedMenuDetails.Reset();
        PublishedMenuDetails.SetRange(CustomerNo, Rec.CustomerNo);
        PublishedMenuDetails.SetRange(ListName, Rec.ListName);
        PublishedMenuDetails.DeleteAll();
    end;
}

