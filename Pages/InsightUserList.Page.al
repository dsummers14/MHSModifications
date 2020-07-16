Page 50073 "Insight User List"
{
    // //iCepts 09.18.13 DXD  Upgrade2013            iCepts1.00

    PageType = List;
    SourceTable = InsightUser;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Username;Username)
                {
                    ApplicationArea = Basic;
                }
                field(CustomerNo;CustomerNo)
                {
                    ApplicationArea = Basic;
                }
                field(AppGrp;AppGrp)
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

