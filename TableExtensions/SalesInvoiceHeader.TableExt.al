TableExtension 50110 tableextension50110 extends "Sales Invoice Header" 
{
    fields
    {
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

