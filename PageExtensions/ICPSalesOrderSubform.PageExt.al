pageextension 50118 ICPSalesOrderSubform extends "Sales Order Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field(MenuID; Rec.MenuID)
            {
                Caption = 'Menu Id';
                ToolTip = 'Enter Menu Id';
                ApplicationArea = All;
            }
        }

        modify("Requested Delivery Date")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}