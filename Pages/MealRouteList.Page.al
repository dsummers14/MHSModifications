Page 50026 "Meal Route List"
{
    ApplicationArea = All;
    PageType = List;
    SourceTable = "Meal Routes";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
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

