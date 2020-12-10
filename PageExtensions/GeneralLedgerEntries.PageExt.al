PageExtension 50101 ICPGeneralLedgerEntries extends "General Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("Allocated Type"; Rec."Allocated Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

