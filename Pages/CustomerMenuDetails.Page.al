Page 50097 "Customer Menu Details"
{
    // //iCepts 09.23.13 DXD Upgrade2013                     iCepts1.00

    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Customer Menu Details";

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
                        CalcFields(ItemDesc);
                    end;
                }
                field(ItemDesc;Rec.ItemDesc)
                {
                    ApplicationArea = All;
                    ToolTip = 'Tooltip';
                    Caption = 'Description';
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
                field(Day;Rec.Day)
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

    var
       
}

