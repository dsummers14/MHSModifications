Page 50089 "Insight Order Form"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    PageType = Card;
    SourceTable = InsightTemplateHeader;

    layout
    {
        area(content)
        {
            group(General)
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

