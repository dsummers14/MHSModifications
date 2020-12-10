TableExtension 50102 ICPCustomer extends Customer 
{
    fields
    {
        modify("Cr. Memo Amounts")
        {
            Caption = 'Cr. Memo Amounts';
        }
        modify("No. of Credit Memos")
        {
            Caption = 'No. of Credit Memos';
        }
        modify("Bill-To No. of Credit Memos")
        {
            Caption = 'Bill-To No. of Credit Memos';
        }
        field(57001;Allocation;Boolean)
        {
        }
        field(57002;"Food Allocation Amount";Decimal)
        {
        }
        field(57003;"Non-Food Allocation Amount";Decimal)
        {
        }
        field(57004;"Food Max Forward Amount";Decimal)
        {
        }
        field(57005;"Non-Food Max Forward Amount";Decimal)
        {
        }
        field(57006;"Food Balance";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where ("Customer No."=field("No."),
                                                                         "Initial Entry Global Dim. 1"=field("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=field("Global Dimension 2 Filter"),
                                                                         "Currency Code"=field("Currency Filter"),
                                                                         "Allocated Type"=const(Food)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57007;"Non-Food Balance";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where ("Customer No."=field("No."),
                                                                         "Initial Entry Global Dim. 1"=field("Global Dimension 1 Filter"),
                                                                         "Initial Entry Global Dim. 2"=field("Global Dimension 2 Filter"),
                                                                         "Currency Code"=field("Currency Filter"),
                                                                         "Allocated Type"=const("Non-Food")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57008;Division;Option)
        {
            Description = 'RFM7490';
            OptionCaption = 'Elementary,Middle,Senior';
            OptionMembers = Elementary,Middle,Senior;
        }
        field(57009;Gender;Option)
        {
            Description = 'RFM7490';
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(57010;Supervisor;Code[10])
        {
            Description = 'RFM7557';
        }
        field(57011;"Student Home Initials";Text[10])
        {
            Description = 'RFM9439';

            trigger OnValidate()
            begin
                "Student Home Initials" := UpperCase("Student Home Initials");
            end;
        }
        field(57012;"Route No.";Code[20])
        {
            Description = 'RFM9439';
            TableRelation = "Meal Routes"."Route No.";
        }
        field(57013;"Delivery Stop";Integer)
        {
            Description = 'RFM9439';

            trigger OnValidate()
            begin
                //IF NOT MealRoutes.GET("Route No.","Delivery Stop") THEN
                //   MESSAGE('INVALID ROUTE NUMBER AND DELIVERY STOP');
            end;
        }
        field(57014;"Student Allergies";Boolean)
        {
            Description = 'RFM9439';
        }
    }
    keys
    {
        key(Key1;Supervisor,Division,Gender)
        {
        }
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DOPaymentCreditCard.DeleteByCustomer(Rec);

        ServiceItem.SETRANGE("Customer No.","No.");
        #4..44
        StdCustSalesCode.SETRANGE("Customer No.","No.");
        StdCustSalesCode.DELETEALL(TRUE);

        ItemCrossReference.SETCURRENTKEY("Cross-Reference Type","Cross-Reference Type No.");
        ItemCrossReference.SETRANGE("Cross-Reference Type",ItemCrossReference."Cross-Reference Type"::Customer);
        ItemCrossReference.SETRANGE("Cross-Reference Type No.","No.");
        #51..114
        UpdateContFromCust.OnDelete(Rec);

        DimMgt.DeleteDefaultDim(DATABASE::Customer,"No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..47
        // iCepts DRS 09.04.07 - RFM5632 Min and Max Item Qty by Customer
        CustomerItemQty.SETRANGE(CustomerNo,"No.");
        CustomerItemQty.DELETEALL;

        #48..117
        */
    //end;

    var
        CustomerItemQty: Record CustomerItemQty;
        MealRoutes: Record "Meal Routes";
}

