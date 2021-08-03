Table 50017 PublishedMenuDetails
{

    fields
    {
        field(1; CustomerNo; Code[20])
        {
        }
        field(2; ListName; Text[50])
        {
        }
        field(3; SeqNo; Integer)
        {
        }
        field(4; ItemNo; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(5; OrderQty; Decimal)
        {
        }
        field(6; UOM; Code[10])
        {
        }
        field(8; RequestDate; Date)
        {
        }

        field(9; "Food Allergen"; Option)
        {
            CalcFormula = lookup(Item."Food Allergen" where("No." = field(ItemNo)));
            Caption = 'Food Allergen';
            FieldClass = FlowField;
            OptionMembers = " ","Nut Allergen","Other Food Allergen";
        }
    }

    keys
    {
        key(Key1; CustomerNo, ListName, SeqNo)
        {
            Clustered = true;
        }
        key(Key2; CustomerNo, RequestDate, ListName, SeqNo)
        {
        }
    }

    fieldgroups
    {
    }
}

