PageExtension 50115 pageextension50115 extends "Cash Receipt Journal" 
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

