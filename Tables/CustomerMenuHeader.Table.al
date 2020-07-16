Table 50021 "Customer Menu Header"
{
    // // iCepts BRB 05.30.07 - Customer Menu Header MHS1.00

    LookupPageID = "Customer Menus";

    fields
    {
        field(1;CustomerNo;Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2;MenuID;Code[20])
        {
            TableRelation = "Standard Menu Master".MenuID;
        }
        field(3;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;CustomerNo,MenuID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        iCustDetail: Record "Customer Menu Details";
    begin
        iCustDetail.Reset;
        iCustDetail.SetRange(CustomerNo,Rec.CustomerNo);
        iCustDetail.SetRange(MenuID,Rec.MenuID);
        iCustDetail.DeleteAll;
    end;
}

