PageExtension 50102 ICPCustomerCard extends "Customer Card"
{
    layout
    {
        addafter("Phone No.")
        {
            field("Student Home Initials"; Rec."Student Home Initials")
            {
                ApplicationArea = Basic;
            }
            field("Student Allergies"; Rec."Student Allergies")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Last Date Modified")
        {
            field("Route No."; Rec."Route No.")
            {
                ApplicationArea = Basic;
            }
            field("Delivery Stop"; Rec."Delivery Stop")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Invoicing)
        {
            group(Custom)
            {
                Caption = 'Custom';
                field(Allocation; Rec.Allocation)
                {
                    ApplicationArea = Basic;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                group(Food)
                {
                    Caption = 'Food';
                    field("Food Allocation Amount"; Rec."Food Allocation Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Food Max Forward Amount"; Rec."Food Max Forward Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Food Balance"; Rec."Food Balance")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group("Non-Food")
                {
                    Caption = 'Non-Food';
                    field("Non-Food Allocation Amount"; Rec."Non-Food Allocation Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Non-Food Max Forward Amount"; Rec."Non-Food Max Forward Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Non-Food Balance"; Rec."Non-Food Balance")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
    }
}

