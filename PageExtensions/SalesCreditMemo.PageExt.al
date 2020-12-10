PageExtension 50110 ICPSalesCreditMemo extends "Sales Credit Memo" 
{
    layout
    {
        addafter(Billing)
        {
            group(Custom)
            {
                Caption = 'Custom';
                field("Allocated Type";Rec."Allocated Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

