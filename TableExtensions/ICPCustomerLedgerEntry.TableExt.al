TableExtension 50103 ICPCustomerLedgerEntry extends "Cust. Ledger Entry"
{
    
    fields
    {
        field(57000; "Allocated Type"; Option)
        {
            Editable = false;
            OptionMembers = " ",Food,"Non-Food";
        }
        field(57008; Division; Option)
        {
            CalcFormula = lookup(Customer.Division where("No." = field("Customer No.")));
            Description = 'RFM7490';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Elementary,Middle,Senior';
            OptionMembers = Elementary,Middle,Senior;
        }
        field(57009; Gender; Option)
        {
            CalcFormula = lookup(Customer.Gender where("No." = field("Customer No.")));
            Description = 'RFM7490';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'Male,Female';
            OptionMembers = Male,Female;
        }
        field(57010; Supervisor; Code[10])
        {
            CalcFormula = lookup(Customer.Supervisor where("No." = field("Customer No.")));
            Description = 'RFM7557';
            Editable = false;
            FieldClass = FlowField;
        }



    }

    procedure ICPDrillDownOnEntries(var DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry")
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    begin
        CustLedgerEntry.RESET();
        DetailedCustLedgEntry.COPYFILTER("Customer No.", CustLedgerEntry."Customer No.");
        DetailedCustLedgEntry.COPYFILTER("Currency Code", CustLedgerEntry."Currency Code");
        DetailedCustLedgEntry.COPYFILTER("Initial Entry Global Dim. 1", CustLedgerEntry."Global Dimension 1 Code");
        DetailedCustLedgEntry.COPYFILTER("Initial Entry Global Dim. 2", CustLedgerEntry."Global Dimension 2 Code");
        CustLedgerEntry.SETCURRENTKEY("Customer No.", "Posting Date");
        CustLedgerEntry.SETRANGE(Open, TRUE);
        PAGE.RUN(0, CustLedgerEntry);
    end;

}




