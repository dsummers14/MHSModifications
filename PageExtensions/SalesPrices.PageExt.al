PageExtension 50117 ICPSalesPrices extends "Sales Prices"
{
    layout
    {
        addafter("Currency Code")
        {
            field("Minimum Sales Order Qty."; Rec."Minimum Sales Order Qty.")
            {
                ApplicationArea = Basic;
            }
            field("Maximum Sales Order Qty."; Rec."Maximum Sales Order Qty.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

