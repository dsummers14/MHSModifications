PageExtension 50109 pageextension50109 extends "Sales Invoice" 
{
    layout
    {
        addafter("Foreign Trade")
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

