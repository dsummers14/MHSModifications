PageExtension 50112 pageextension50112 extends "Posted Sales Invoices" 
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Allocated Type";"Allocated Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

