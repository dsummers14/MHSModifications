Page 50070 "Insight Group Codes List"
{
    // //iCepts 09.18.13 dxd Upgrade2013            iCepts1.00

    PageType = List;
    SourceTable = InsightGroupCodes;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(GroupCode;GroupCode)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

