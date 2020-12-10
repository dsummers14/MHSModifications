PageExtension 50103 ICPCustomerList extends "Customer List"
{
    layout
    {
        addafter(Name)
        {
            field(Supervisor; Rec.Supervisor)
            {
                ApplicationArea = Basic;
            }
            field(Gender; Gender)
            {
                ApplicationArea = Basic;
            }
            field(Division; Rec.Division)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

