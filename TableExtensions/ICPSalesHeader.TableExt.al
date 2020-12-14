TableExtension 50106 ICPSalesHeader extends "Sales Header"
{
    fields
    {
        field(57000; "Allocated Type"; Option)
        {
            OptionMembers = " ",Food,"Non-Food";

            trigger OnValidate()
            var
                Customer: Record Customer;

            begin
                // iCepts BRB 05.29.07 - RFM5485 If Customer is not Allocated, do not allow them to change (keep blank) :START
                if Customer.Get("Sell-to Customer No.") then
                    if (not Customer.Allocation) and ("Allocated Type" <> 0) then
                        Error('Customer is NOT setup as an Allocated Customer\Leave Allocated Type Blank or change Customer');
                // iCepts BRB 05.29.07 - RFM5485 If Customer is not Allocated, do not allow them to change (keep blank) :END
                // iCepts BRB 05.31.07 - Add Order Date Key RPK4
            end;
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

