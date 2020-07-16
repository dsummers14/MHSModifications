PageExtension 50107 pageextension50107 extends "Sales Quote" 
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

