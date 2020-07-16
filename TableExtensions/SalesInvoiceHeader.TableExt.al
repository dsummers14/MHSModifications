TableExtension 50110 tableextension50110 extends "Sales Invoice Header" 
{
    fields
    {
        modify("Applies-to Doc. Type")
        {
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
        }
        field(57000;"Allocated Type";Option)
        {
            Editable = false;
            OptionMembers = " ",Food,"Non-Food";
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Order Date")
        // {
        // }
    }
}

