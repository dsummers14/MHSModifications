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
                field(WeekNo;WeekNo)
                {
                    ApplicationArea = Basic;
                }
                field(Day;Day)
                {
                    ApplicationArea = Basic;
                }
                field(Meal;Meal)
                {
                    ApplicationArea = Basic;
                }
                field(ItemNo;ItemNo)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CalcFields(ItemDesc);
                    end;
                }
                field(ItemDesc;ItemDesc)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(Uom;Uom)
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

