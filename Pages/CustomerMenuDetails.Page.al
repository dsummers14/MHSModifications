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
                        CalcFields(ItemDesc);
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
                field(Day;Rec.Day)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        Item: Record Item;
}

