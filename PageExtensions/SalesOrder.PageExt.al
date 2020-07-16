PageExtension 50108 pageextension50108 extends "Sales Order" 
{
    layout
    {
        addafter(Control1900201301)
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

