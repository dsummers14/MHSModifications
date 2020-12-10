PageExtension 50103 ICPCustomerList extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(Supervisor; Rec.Supervisor)
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
            field(Gender; Gender)
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
            field(Division; Rec.Division)
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
        }
    }
}

