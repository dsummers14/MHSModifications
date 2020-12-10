PageExtension 50115 ICPCashReceiptJournal extends "Cash Receipt Journal"
{
    layout
    {
        addafter("Account No.")
        {
            field("Allocated Type"; Rec."Allocated Type")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
        }
    }
}

