TableExtension 50118 tableextension50118 extends IC2GLTest 
{

    //Unsupported feature: Property Modification (Name) on "IC2GLTest(Table 50010)".

    fields
    {
        modify("No.")
        {

            //Unsupported feature: Property Modification (Name) on ""No."(Field 1)".


            //Unsupported feature: Property Modification (Data type) on ""No."(Field 1)".

            TableRelation = InsightUser.Username;
        }
        modify(Name)
        {

            //Unsupported feature: Property Modification (Name) on "Name(Field 2)".


            //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".

            TableRelation = InsightDirectiveCodes.DirectiveCode;
        }
        modify("Account Type")
        {

            //Unsupported feature: Property Modification (Name) on ""Account Type"(Field 3)".


            //Unsupported feature: Property Modification (Data type) on ""Account Type"(Field 3)".

            TableRelation = InsightFeatureCodes.FeatureCode;
        }
        modify("Income/Balance")
        {

            //Unsupported feature: Property Modification (Name) on ""Income/Balance"(Field 4)".


            //Unsupported feature: Property Modification (Data type) on ""Income/Balance"(Field 4)".

            TableRelation = if (FeatureCode=const('IS_SLSPTERR')) "Salesperson/Purchaser".Code;
        }

        //Unsupported feature: Property Deletion (CaptionML) on ""No."(Field 1)".


        //Unsupported feature: Property Deletion (NotBlank) on ""No."(Field 1)".


        //Unsupported feature: Property Deletion (CaptionML) on "Name(Field 2)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Account Type"(Field 3)".


        //Unsupported feature: Property Deletion (OptionCaptionML) on ""Account Type"(Field 3)".


        //Unsupported feature: Property Deletion (OptionString) on ""Account Type"(Field 3)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Income/Balance"(Field 4)".


        //Unsupported feature: Property Deletion (OptionCaptionML) on ""Income/Balance"(Field 4)".


        //Unsupported feature: Property Deletion (OptionString) on ""Income/Balance"(Field 4)".


        //Unsupported feature: Deletion (FieldCollection) on "Blocked(Field 5)".


        //Unsupported feature: Deletion (FieldCollection) on ""Map-to G/L Acc. No."(Field 6)".


        //Unsupported feature: Deletion (FieldCollection) on "Indentation(Field 7)".

    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""No."(Key)".
        // 
        // key(Key1;Username,DirectiveCode,FeatureCode)
        // {
        // Clustered = true;
        // }
    }
}

