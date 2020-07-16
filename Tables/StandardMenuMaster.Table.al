Table 50018 "Standard Menu Master"
{
    // // iCepts BRB 05.30.07 - Standard Master Menu MHS1.00

    LookupPageID = "Standard Menus";

    fields
    {
        field(1;MenuID;Code[20])
        {
        }
        field(2;Description;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;MenuID)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        iStdDetail: Record "Standard Menu Details";
    begin
        iStdDetail.Reset;
        iStdDetail.SetRange(MenuID,Rec.MenuID);
        iStdDetail.DeleteAll;
    end;
}

