PageExtension 50104 pageextension50104 extends "Customer Ledger Entries" 
{
    layout
    {
        addafter("Customer No.")
        {
            field("Allocated Type";"Allocated Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

