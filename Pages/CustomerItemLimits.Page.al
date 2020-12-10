Page 50050 "Customer/Item Limits"
{
    // //iCepts 09.18.13 DXD Upgrade2013       iCepts1.00

    PageType = List;
    SourceTable = CustomerItemQty;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ItemNo;Rec.ItemNo)
                {
                    ApplicationArea = Basic;
                }
                field(MinimumQty;Rec.MinimumQty)
                {
                    ApplicationArea = Basic;
                }
                field(MaximumQty;Rec.MaximumQty)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

