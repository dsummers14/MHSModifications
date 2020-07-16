PageExtension 50113 pageextension50113 extends "Apply Customer Entries"
{
    layout
    {

        addafter(ApplyingDescription)
        {
            field(ApplyingAllocatedType; ApplyingCustLedgEntry."Allocated Type")
            {
               ApplicationArea = Basic;
                Caption = 'Applying Allocated Type'; 
            }
        }


        addafter(Description)
        {
            field("Allocated Type"; "Allocated Type")
            {
                ApplicationArea = Basic;
                Caption = 'Allocated Type';
            }
        }
    }
}

