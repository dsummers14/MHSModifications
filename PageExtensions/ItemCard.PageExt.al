PageExtension 50105 ICPItemCard extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("Description 2"; Rec."Description 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Warehouse)
        {
            group(Custom)
            {
                Caption = 'Custom';
                field(FoodItem; Rec.FoodItem)
                {
                    ApplicationArea = Basic;

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
                    ApplicationArea = Basic;
                    Editable = vFoodItemFlag;
                }
                field("Maximum Sales Order Qty."; Rec."Maximum Sales Order Qty.")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Sales Order Qty."; Rec."Minimum Sales Order Qty.")
                {
                    ApplicationArea = Basic;
                }
                field(DisplayColor; Rec.DisplayColor)
                {
                    ApplicationArea = Basic;
                }
                field("Food Allergen"; Rec."Food Allergen")
                {
                    ApplicationArea = Basic;
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

