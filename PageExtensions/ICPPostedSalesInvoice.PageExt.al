PageExtension 50111 ICPPostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Electronic Invoice")
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

