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
                    ApplicationArea = Basic;
                }
                field(Day;Rec.Day)
                {
                    ApplicationArea = Basic;
                }
                field(Meal;Rec.Meal)
                {
                    ApplicationArea = Basic;
                }
                field(ItemNo;Rec.ItemNo)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(ItemDesc);
                    end;
                }
                field(ItemDesc;Rec.ItemDesc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field(Quantity;Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(Uom;Rec.Uom)
                {
                    ApplicationArea = Basic;
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

