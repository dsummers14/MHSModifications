PageExtension 50108 ICPSalesOrder extends "Sales Order"
{
    layout
    {
        addafter(Control1900201301)
        {
            group(Custom)
            {
                Caption = 'Custom';
                field("Allocated Type"; Rec."Allocated Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
            }
        }
    }
}

