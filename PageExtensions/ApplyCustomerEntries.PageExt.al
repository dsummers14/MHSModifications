PageExtension 50113 pageextension50113 extends "Apply Customer Entries" 
{
    layout
    {
        addafter("ApplyingCustLedgEntry.Description")
        {
            field("ApplyingCustLedgEntry.""Allocated Type""";ApplyingCustLedgEntry."Allocated Type")
            {
                ApplicationArea = Basic;
                Caption = 'Allocated Type';
            }
        }
        addafter(Description)
        {
            field("Allocated Type";"Allocated Type")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

