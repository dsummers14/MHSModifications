PageExtension 50105 ICPItemCard extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = All;
                ToolTip = 'ToolTip';
            }
        }
        addafter(Warehouse)
        {
            group(Custom)
            {
                Caption = 'Custom';
                field(FoodItem; Rec.FoodItem)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';

                    trigger OnValidate()
                    begin
                        if not Rec.FoodItem then begin
                            Rec."Menu-Only" := false;
                            vFoodItemFlag := false;
                        end else
                            vFoodItemFlag := true;
                    end;
                }
                field("Menu-Only"; Rec."Menu-Only")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Editable = vFoodItemFlag;
                }
                field("Maximum Sales Order Qty."; Rec."Maximum Sales Order Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field("Minimum Sales Order Qty."; Rec."Minimum Sales Order Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(DisplayColor; Rec.DisplayColor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field("Food Allergen"; Rec."Food Allergen")
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
            }
        }
    }

    var
        vFoodItemFlag: Boolean;

    trigger OnAfterGetRecord()
    begin
        vFoodItemFlag := rec.FoodItem;
    end;

}

