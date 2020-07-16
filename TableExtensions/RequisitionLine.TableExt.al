TableExtension 50112 tableextension50112 extends "Requisition Line" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Replenishment System"(Field 99000903).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TESTFIELD(Type,Type::Item);
            CheckActionMessageNew;
            IF ValidateFields AND
            #4..28
                  IF Item."Purch. Unit of Measure" <> '' THEN
                    VALIDATE("Unit of Measure Code",Item."Purch. Unit of Measure");
                  VALIDATE("Transfer-from Code",'');
                  IF CurrFieldNo = FIELDNO("Location Code") THEN
                    VALIDATE("Vendor No.")
                  ELSE
            #35..127
                  VALIDATE("Unit of Measure Code",Item."Base Unit of Measure");
                END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..31
                  "Vendor Item No." := SKU."Vendor Item No."; // iCepts BRB 02.11.14 - Not poplulating Vendor Item No.
            #32..130
            */
        //end;
    }
}

