TableExtension 50102 ICPCustomer extends Customer
{
    fields
    {
        modify("Cr. Memo Amounts")
        {
            Caption = 'Cr. Memo Amounts';
        }
        modify("No. of Credit Memos")
        {
            Caption = 'No. of Credit Memos';
        }
        modify("Bill-To No. of Credit Memos")
        {
            Caption = 'Bill-To No. of Credit Memos';
        }
        field(57001; Allocation; Boolean)
        {
        }
        field(57002; "Food Allocation Amount"; Decimal)
        {
        }
        field(57003; "Non-Food Allocation Amount"; Decimal)
        {
        }
        field(57004; "Food Max Forward Amount"; Decimal)
        {
        }
        field(57005; "Non-Food Max Forward Amount"; Decimal)
        {
        }
        field(57006; "Food Balance"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                         "Currency Code" = field("Currency Filter"),
                                                                         "Allocated Type" = const(Food)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57007; "Non-Food Balance"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("No."),
                                                                         "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                         "Currency Code" = field("Currency Filter"),
                                                                         "Allocated Type" = const("Non-Food")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57008; Division; Option)
        {
            Description = 'RFM7490';
            OptionCaption = 'Elementary,Middle,Senior';
            OptionMembers = Elementary,Middle,Senior;
        }
        field(57009; Gender; Option)
        {
            Description = 'RFM7490';
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(57010; Supervisor; Code[10])
        {
            Description = 'RFM7557';
        }
        field(57011; "Student Home Initials"; Text[10])
        {
            Description = 'RFM9439';

            trigger OnValidate()
            begin
                "Student Home Initials" := UpperCase("Student Home Initials");
            end;
        }
        field(57012; "Route No."; Code[20])
        {
            Description = 'RFM9439';
            TableRelation = "Meal Routes"."Route No.";
        }
        field(57013; "Delivery Stop"; Integer)
        {
            Description = 'RFM9439';

        }
        field(57014; "Student Allergies"; Boolean)
        {
            Description = 'RFM9439';
        }
    }
    keys
    {
        key(Key1; Supervisor, Division, Gender)
        {
        }
    }

    trigger OnAfterDelete()
    var
    begin
        CustomerItemQty.SETRANGE(CustomerNo, Rec."No.");
        CustomerItemQty.DELETEALL();
    end;

    var
        CustomerItemQty: Record CustomerItemQty;
}

