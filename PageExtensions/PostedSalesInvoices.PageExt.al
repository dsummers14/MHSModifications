PageExtension 50112 ICPPostedSalesInvoices extends "Posted Sales Invoices" 
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Allocated Type";Rec."Allocated Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

