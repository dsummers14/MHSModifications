PageExtension 50105 pageextension50105 extends "Item Card" 
{
    layout
    {
        addafter(Description)
        {
            field("Description 2";"Description 2")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Warehouse)
        {
            group(Custom)
            {
                Caption = 'Custom';
                field(FoodItem;FoodItem)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if not FoodItem then begin
                          "Menu-Only" := false;
                          FoodItemFlag := false;
                        end else
                          FoodItemFlag := true;
                    end;
                }
                field("Menu-Only";"Menu-Only")
                {
                    ApplicationArea = Basic;
                    Editable = FoodItemFlag;
                }
                field("Maximum Sales Order Qty.";"Maximum Sales Order Qty.")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Sales Order Qty.";"Minimum Sales Order Qty.")
                {
                    ApplicationArea = Basic;
                }
                field(DisplayColor;DisplayColor)
                {
                    ApplicationArea = Basic;
                }
                field("Food Allergen";"Food Allergen")
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

