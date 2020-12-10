PageExtension 50114 ICPSalesJournal extends "Sales Journal"
{
    layout
    {
        addafter("Account No.")
        {
            field("Allocated Type"; Rec."Allocated Type")
            {
                ApplicationArea = All;
                ToolTip = 'Tooltip';
            }
        }
    }
}

