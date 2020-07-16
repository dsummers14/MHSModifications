TableExtension 50111 tableextension50111 extends "Sales Invoice Line" 
{
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Property Insertion (SumIndexFields) on ""Sell-to Customer No.",Type,"Document No."(Key)".
        // 
        // key(Key1;"Sell-to Customer No.",Type,"No.","Shipment Date")
        // {
        // SumIndexFields = Amount,Quantity;
        // }
    }
}

