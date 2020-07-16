Table 50019 "Standard Menu Details"
{
    // // iCepts BRB 05.30.07 - Menu Details MHS1.00


    fields
    {
        field(1;MenuID;Code[20])
        {
            TableRelation = "Standard Menu Master".MenuID;
        }
        field(2;WeekNo;Integer)
        {
            InitValue = 1;
        }
        field(3;Day;Option)
        {
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(4;Meal;Option)
        {
            OptionMembers = Breakfast,Lunch,Dinner,Snack;
        }
        field(5;SeqNo;Integer)
        {
        }
        field(6;ItemNo;Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                if Item.Get(ItemNo) then
                  Uom := Item."Sales Unit of Measure";
            end;
        }
        field(7;Quantity;Integer)
        {
            InitValue = 1;
        }
        field(8;Uom;Code[10])
        {
            TableRelation = "Item Unit of Measure".Code where ("Item No."=field(ItemNo));
        }
        field(9;ItemDesc;Text[50])
        {
            CalcFormula = lookup(Item.Description where ("No."=field(ItemNo)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;MenuID,WeekNo,Day,Meal,SeqNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Item: Record Item;
}

