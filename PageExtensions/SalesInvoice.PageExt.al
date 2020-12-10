PageExtension 50109 ICPSalesInvoice extends "Sales Invoice"
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
                    ApplicationArea = Basic;
                }
            }
        }
    }
}

