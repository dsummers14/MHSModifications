Page 50093 "Standard Menu Details"
{
    // //iCepts 09.20.13 DXD Upgrade2013                     iCepts1.00

    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Standard Menu Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(WeekNo;Rec.WeekNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(Day;Rec.Day)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(Meal;Rec.Meal)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(ItemNo;Rec.ItemNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(ItemDesc);
                    end;
                }
                field(ItemDesc;Rec.ItemDesc)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Tooltip';
                }
                field(Quantity;Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                }
                field(Uom;Rec.Uom)
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

    trigger OnAfterGetRecord()
    begin
        if not Item.Get(ItemNo) then
          Clear(Item);
    end;

    var
        Item: Record Item;
}

