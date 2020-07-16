PageExtension 50111 pageextension50111 extends "Posted Sales Invoice" 
{
    layout
    {
        addafter("Electronic Invoice")
        {
            group(Custom)
            {
                Caption = 'Custom';
                field("Allocated Type";"Allocated Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

