PageExtension 50107 ICPSalesQuote extends "Sales Quote"
{
    layout
    {
        addafter("Foreign Trade")
        {
            group(Custom)
            {
                Caption = 'Custom';
                field("Allocated Type"; Rec."Allocated Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
            }
        }
    }
}

