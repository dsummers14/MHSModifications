PageExtension 50110 pageextension50110 extends "Sales Credit Memo" 
{
    layout
    {
        addafter(Billing)
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

