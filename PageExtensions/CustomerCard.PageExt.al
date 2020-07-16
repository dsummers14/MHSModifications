PageExtension 50102 pageextension50102 extends "Customer Card" 
{
    layout
    {
        addafter("Phone No.")
        {
            field("Student Home Initials";"Student Home Initials")
            {
                ApplicationArea = Basic;
            }
            field("Student Allergies";"Student Allergies")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Last Date Modified")
        {
            field("Route No.";"Route No.")
            {
                ApplicationArea = Basic;
            }
            field("Delivery Stop";"Delivery Stop")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Foreign Trade")
        {
            group(Custom)
            {
                Caption = 'Custom';
                field(Allocation;Allocation)
                {
                    ApplicationArea = Basic;
                }
                field(Supervisor;Supervisor)
                {
                    ApplicationArea = Basic;
                }
                field(Division;Division)
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                group(Food)
                {
                    Caption = 'Food';
                    field("Food Allocation Amount";"Food Allocation Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Food Max Forward Amount";"Food Max Forward Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Food Balance";"Food Balance")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group("Non-Food")
                {
                    Caption = 'Non-Food';
                    field("Non-Food Allocation Amount";"Non-Food Allocation Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Non-Food Max Forward Amount";"Non-Food Max Forward Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Non-Food Balance";"Non-Food Balance")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
    }
}

