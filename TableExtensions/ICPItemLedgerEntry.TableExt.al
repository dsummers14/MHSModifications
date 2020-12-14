TableExtension 50105 ICPItemLedgerEntry extends "Item Ledger Entry" 
{
    fields
    {
        field(57008;Division;Option)
        {
            CalcFormula = lookup(Customer.Division where ("No."=field("Source No.")));
            Description = 'RFM7490';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Elementary,Middle,Senior';
            OptionMembers = Elementary,Middle,Senior;
        }
        field(57009;Gender;Option)
        {
            CalcFormula = lookup(Customer.Gender where ("No."=field("Source No.")));
            Description = 'RFM7490';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(57010;Supervisor;Code[10])
        {
            CalcFormula = lookup(Customer.Supervisor where ("No."=field("Source No.")));
            Description = 'RFM7557';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Posting Date","Entry Type")
        // {
        // }
    }
}

