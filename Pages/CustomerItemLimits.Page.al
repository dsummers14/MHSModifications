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
                field(ItemNo;ItemNo)
                {
                    ApplicationArea = Basic;
                }
                field(MinimumQty;MinimumQty)
                {
                    ApplicationArea = Basic;
                }
                field(MaximumQty;MaximumQty)
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

