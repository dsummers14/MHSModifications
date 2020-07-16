PageExtension 50117 pageextension50117 extends "Sales Prices" 
{
    layout
    {
        addafter("Currency Code")
        {
            field("Minimum Sales Order Qty.";"Minimum Sales Order Qty.")
            {
                ApplicationArea = Basic;
            }
            field("Maximum Sales Order Qty.";"Maximum Sales Order Qty.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

