Page 50087 "Insight User Card"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = InsightUser;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Username;Username)
                {
                    ApplicationArea = Basic;
                }
                field(Password;Password)
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

