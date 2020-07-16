Page 50088 "Insight Order Forms"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = Basic;
    PageType = List;
    SourceTable = InsightTemplateHeader;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(CustomerNo;CustomerNo)
                {
                    ApplicationArea = Basic;
                }
                field(ListName;ListName)
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

