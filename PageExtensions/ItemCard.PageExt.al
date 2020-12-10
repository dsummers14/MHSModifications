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
                            FoodItemFlag := false;
                        end else
                            FoodItemFlag := true;
                    end;
                }
                field("Menu-Only"; Rec."Menu-Only")
                {
                    ApplicationArea = Basic;
                    Editable = FoodItemFlag;
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
        FoodItemFlag: Boolean;

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    EnablePlanningControls;
    EnableCostingControls;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EnablePlanningControls;
    EnableCostingControls;

    IF NOT FoodItem THEN BEGIN
      "Menu-Only" := FALSE;
      FoodItemFlag := FALSE;
    END ELSE
      FoodItemFlag := TRUE;
    */
    //end;
}

