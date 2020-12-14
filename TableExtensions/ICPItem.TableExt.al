TableExtension 50104 ICPItem extends Item 
{
    fields
    {
        modify(Inventory)
        {
            Caption = 'Quantity on Hand';
        }
        modify("Reserved Qty. on Inventory")
        {
            Caption = 'Reserved Qty. on Inventory';
        }
        modify("Res. Qty. on Outbound Transfer")
        {
            Caption = 'Res. Qty. on Outbound Transfer';
        }
        modify("Res. Qty. on Inbound Transfer")
        {
            Caption = 'Res. Qty. on Inbound Transfer';
        }
        modify("Rolled-up Capacity Cost")
        {
            Caption = 'Rolled-up Capacity Cost';
        }
        modify("Manufacturing Policy")
        {
            OptionCaption = 'Make-to-Stock,Make-to-Order';
        }
        modify("Stockkeeping Unit Exists")
        {
            Caption = 'Stockkeeping Unit Exists';
        }
        modify("Qty. Assigned to ship")
        {
            Caption = 'Qty Assig to ship';
        }
        modify("Put-away Unit of Measure Code")
        {
            Caption = 'Put-away Unit of Measure Code';
        }
        modify("Single-Level Capacity Cost")
        {
            Caption = 'Single-Level Capacity Cost';
        }

        //Unsupported feature: Code Modification on ""Standard Cost"(Field 24).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF ("Costing Method" = "Costing Method"::Standard) AND (CurrFieldNo <> 0) THEN
              IF NOT GUIALLOWED THEN BEGIN
                "Standard Cost" := xRec."Standard Cost";
                EXIT;
              END ELSE
                IF NOT
                   CONFIRM(
                     Text020 +
                     Text021 +
                     Text022,FALSE,
                     FIELDCAPTION("Standard Cost"))
                THEN BEGIN
                  "Standard Cost" := xRec."Standard Cost";
                  EXIT;
                END;

            ItemCostMgt.UpdateUnitCost(Rec,'','',0,0,FALSE,FALSE,TRUE,FIELDNO("Standard Cost"));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF ("Costing Method" = "Costing Method"::Standard) AND (CurrFieldNo <> 0) THEN
              IF NOT
                 CONFIRM(
                   Text020 +
                   Text021 +
                   Text022,FALSE,
                   FIELDCAPTION("Standard Cost")) OR NOT GUIALLOWED
              THEN BEGIN
                "Standard Cost" := xRec."Standard Cost";
                EXIT;
            END;

            ItemCostMgt.UpdateUnitCost(Rec,'','',0,0,FALSE,FALSE,TRUE,FIELDNO("Standard Cost"));
            */
        //end;
        field(57001;FoodItem;Boolean)
        {
            Caption = 'Food Item';
            Description = 'RFM5484';

            trigger OnValidate()
            begin
                // iCepts BRB 05.17.07 - RFM5484 If Non-Food Item, Menu-Only is N
                if not FoodItem then
                  "Menu-Only" := false;
            end;
        }
        field(57002;"Menu-Only";Boolean)
        {
            Description = 'RFM5484';

            trigger OnValidate()
            begin
                // iCepts BRB 05.17.07 - RFM5484 If Non-Food Item, Menu-Only is N
                if (not FoodItem) and "Menu-Only" = true then
                  Error('Non-Food Items can not be flagged as Menu-Only Items');
            end;
        }
        field(57003;"Maximum Sales Order Qty.";Decimal)
        {
            Description = 'RFM5484';
        }
        field(57004;"Minimum Sales Order Qty.";Decimal)
        {
            Description = 'RFM5484';
        }
        field(57005;DisplayColor;Option)
        {
            Description = 'RFM7300';
            OptionMembers = "  ",Green,Yellow,Red;
        }
        field(57006;"Food Allergen";Option)
        {
            Description = 'RFM8201';
            OptionMembers = " ","Nut Allergen","Other Food Allergen";
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Item Category Code")
        // {
        // }
        key(Key2;FoodItem,"Menu-Only")
        {
        }
    }
}

