PageExtension 50116 ICPDetailedCustLedgEntries extends "Detailed Cust. Ledg. Entries" 
{
    layout
    {
        addafter("Customer No.")
        {
            field("Allocated Type";Rec."Allocated Type")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
        }
    }
}

