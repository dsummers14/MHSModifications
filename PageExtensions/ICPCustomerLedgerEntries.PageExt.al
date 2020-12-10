PageExtension 50104 ICPCustomerLedgerEntries extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Customer No.")
        {
            field("Allocated Type"; Rec."Allocated Type")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
        }
    }
}

