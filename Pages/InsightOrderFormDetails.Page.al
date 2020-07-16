Page 50090 "Insight Order Form Details"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    PageType = List;
    SourceTable = InsightTemplateDetails;

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
                field(OrderQty;OrderQty)
                {
                    ApplicationArea = Basic;
                }
                field(UOM;UOM)
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate;RequestDate)
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

