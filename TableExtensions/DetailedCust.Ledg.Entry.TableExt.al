TableExtension 50113 tableextension50113 extends "Detailed Cust. Ledg. Entry" 
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
        // key(Key1;"Customer No.","Initial Entry Due Date","Posting Date","Currency Code","Allocated Type")
        // {
        // SumIndexFields = Amount,"Amount (LCY)","Debit Amount","Credit Amount","Debit Amount (LCY)","Credit Amount (LCY)";
        // }
    }
}

