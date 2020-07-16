PageExtension 50116 pageextension50116 extends "Detailed Cust. Ledg. Entries" 
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

