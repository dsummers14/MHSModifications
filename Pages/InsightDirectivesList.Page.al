Page 50072 "Insight Directives List"
{
    // //iCepts 09.18.13 dxd Upgrade2013            iCepts1.00

    PageType = List;
    SourceTable = InsightDirectiveCodes;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(DirectiveCode;DirectiveCode)
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

