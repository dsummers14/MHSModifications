TableExtension 50103 ICPCustomerLedgerEntry extends "Cust. Ledger Entry" 
{
    fields
    {
        field(57000;"Allocated Type";Option)
        {
            Editable = false;
            OptionMembers = " ",Food,"Non-Food";
        }
        field(57008;Division;Option)
        {
            CalcFormula = lookup(Customer.Division where ("No."=field("Customer No.")));
            Description = 'RFM7490';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Elementary,Middle,Senior';
            OptionMembers = Elementary,Middle,Senior;
        }
        field(57009;Gender;Option)
        {
            CalcFormula = lookup(Customer.Gender where ("No."=field("Customer No.")));
            Description = 'RFM7490';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(57010;Supervisor;Code[10])
        {
            CalcFormula = lookup(Customer.Supervisor where ("No."=field("Customer No.")));
            Description = 'RFM7557';
            Editable = false;
            FieldClass = FlowField;
        }
    }


    //Unsupported feature: Code Modification on "DrillDownOnEntries(PROCEDURE 1)".

    //procedure DrillDownOnEntries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CustLedgEntry.RESET;
        DtldCustLedgEntry.COPYFILTER("Customer No.",CustLedgEntry."Customer No.");
        DtldCustLedgEntry.COPYFILTER("Currency Code",CustLedgEntry."Currency Code");
        DtldCustLedgEntry.COPYFILTER("Initial Entry Global Dim. 1",CustLedgEntry."Global Dimension 1 Code");
        DtldCustLedgEntry.COPYFILTER("Initial Entry Global Dim. 2",CustLedgEntry."Global Dimension 2 Code");
        CustLedgEntry.SETCURRENTKEY("Customer No.","Posting Date");
        CustLedgEntry.SETRANGE(Open,TRUE);
        PAGE.RUN(0,CustLedgEntry);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
        DtldCustLedgEntry.COPYFILTER("Allocated Type",CustLedgEntry."Allocated Type"); // iCepts BRB 06.04.07 - Allocated Type Filter
        #6..8
        */
    //end;
}

