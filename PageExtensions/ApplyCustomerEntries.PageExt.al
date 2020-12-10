PageExtension 50113 ICPApplyCustomerEntries extends "Apply Customer Entries"
{
    layout
    {
        /* DRS 07/17/20 - Cannot access Global ApplyingCustLedgEntry in extension
                addafter(ApplyingDescription)
                {
                    field(ApplyingAllocatedType; ApplyingCustLedgEntry."Allocated Type")
                    {
                       ApplicationArea = Basic;
                        Caption = 'Applying Allocated Type'; 
                    }
                }
         */

        addafter(Description)
        {
            field("Allocated Type"; Rec."Allocated Type")
            {
                ApplicationArea = Basic;
                Caption = 'Allocated Type';
            }
        }
    }
}

