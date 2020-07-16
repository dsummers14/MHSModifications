PageExtension 50103 pageextension50103 extends "Customer List" 
{
    layout
    {
        addafter(Name)
        {
            field(Supervisor;Supervisor)
            {
                ApplicationArea = Basic;
            }
            field(Gender;Gender)
            {
                ApplicationArea = Basic;
            }
            field(Division;Division)
            {
                ApplicationArea = Basic;
            }
        }
    }
}

