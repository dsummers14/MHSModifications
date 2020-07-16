Table 50020 "Customer Menu Details"
{
    // // iCepts BRB 05.30.07 - Customer Menu Details MHS1.00


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
        field(3;WeekNo;Integer)
        {
            InitValue = 1;
        }
        field(4;Day;Option)
        {
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;
        }
        field(5;Meal;Option)
        {
            OptionMembers = Breakfast,Lunch,Dinner,Snack;
        }
        field(6;SeqNo;Integer)
        {
        }
        field(7;ItemNo;Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                if Item.Get(ItemNo) then
                  Uom := Item."Sales Unit of Measure";
            end;
        }
        field(8;Quantity;Integer)
        {
            InitValue = 1;
        }
        field(9;Uom;Code[10])
        {
            TableRelation = "Item Unit of Measure".Code where ("Item No."=field(ItemNo));
        }
        field(10;ItemDesc;Text[50])
        {
            CalcFormula = lookup(Item.Description where ("No."=field(ItemNo)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;CustomerNo,MenuID,WeekNo,Day,Meal,SeqNo)
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

