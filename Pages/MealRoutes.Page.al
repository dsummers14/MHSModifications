Page 50025 "Meal Routes"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Meal Routes";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Route No.";Rec."Route No.")
                {
                    ApplicationArea = Basic;
                }
                field("Delivery Stop";Rec."Delivery Stop")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
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

