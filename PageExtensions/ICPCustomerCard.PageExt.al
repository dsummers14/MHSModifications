PageExtension 50102 ICPCustomerCard extends "Customer Card"
{
    layout
    {
        addafter("Phone No.")
        {
            field("Student Home Initials"; Rec."Student Home Initials")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
            field("Student Allergies"; Rec."Student Allergies")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
        }
        addafter("Last Date Modified")
        {
            field("Route No."; Rec."Route No.")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
            field("Delivery Stop"; Rec."Delivery Stop")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
        }
        addafter(Invoicing)
        {
            group(Custom)
            {
                Caption = 'Custom';
                field(Allocation; Rec.Allocation)
                {
                    ApplicationArea = All;
                    ToolTip = 'ToolTip';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = All;
                    ToolTip = 'ToolTip';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = All;
                    ToolTip = 'ToolTip';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    ToolTip = 'ToolTip';
                }
                group(Food)
                {
                    Caption = 'Food';
                    field("Food Allocation Amount"; Rec."Food Allocation Amount")
                    {
                        ApplicationArea = All;
                        ToolTip = 'ToolTip';
                    }
                    field("Food Max Forward Amount"; Rec."Food Max Forward Amount")
                    {
                        ApplicationArea = All;
                        ToolTip = 'ToolTip';
                    }
                    field("Food Balance"; Rec."Food Balance")
                    {
                        ApplicationArea = All;
                        ToolTip = 'ToolTip';
                    }
                }
                group("Non-Food")
                {
                    Caption = 'Non-Food';
                    field("Non-Food Allocation Amount"; Rec."Non-Food Allocation Amount")
                    {
                        ApplicationArea = All;
                        ToolTip = 'ToolTip';
                    }
                    field("Non-Food Max Forward Amount"; Rec."Non-Food Max Forward Amount")
                    {
                        ApplicationArea = All;
                        ToolTip = 'ToolTip';
                    }
                    field("Non-Food Balance"; Rec."Non-Food Balance")
                    {
                        ApplicationArea = All;
                        ToolTip = 'ToolTip';
                    }
                }
            }
        }
    }
}

