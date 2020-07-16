PageExtension 50101 pageextension50101 extends "General Ledger Entries" 
{
    layout
    {
        addafter(Description)
        {
            field("Allocated Type";"Allocated Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

