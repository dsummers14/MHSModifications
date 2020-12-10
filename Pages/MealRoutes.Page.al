Page 50025 "Meal Routes"
{
    ApplicationArea = All;
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
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field("Delivery Stop";Rec."Delivery Stop")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
            }
        }
    }

    actions
    {
    }
}

