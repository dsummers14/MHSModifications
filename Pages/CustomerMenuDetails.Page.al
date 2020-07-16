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
                field(WeekNo;WeekNo)
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
                field(Day;Day)
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

