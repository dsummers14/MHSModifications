Page 50076 "Insight Group Features Card"
{
    // //iCepts 09.18.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = InsightGroupCodes;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
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

