PageExtension 50106 ICPItemList extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = Basic;
            }
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = Basic;
            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = Basic;
            }
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {
                ApplicationArea = Basic;
            }
            field("Order Multiple"; Rec."Order Multiple")
            {
                ApplicationArea = Basic;
            }
            field("Minimum Order Quantity"; Rec."Minimum Order Quantity")
            {
                ApplicationArea = Basic;
            }
            field("Maximum Order Quantity"; Rec."Maximum Order Quantity")
            {
                ApplicationArea = Basic;
            }
            field("Reorder Point"; Rec."Reorder Point")
            {
                ApplicationArea = Basic;
            }
            field("Reorder Quantity"; Rec."Reorder Quantity")
            {
                ApplicationArea = Basic;
            }
            field("Maximum Inventory"; Rec."Maximum Inventory")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

