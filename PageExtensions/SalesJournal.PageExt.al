PageExtension 50114 pageextension50114 extends "Sales Journal" 
{
    layout
    {
        addafter("Account No.")
        {
            field("Allocated Type";"Allocated Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

