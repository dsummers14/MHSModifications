Page 50026 "Meal Route List"
{
    ApplicationArea = Basic;
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

