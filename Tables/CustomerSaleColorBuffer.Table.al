Table 50024 "Customer Sale Color Buffer"
{
    // //iCepts RFM7364 01.18.12 DXD Cust Sale by Red/Yellow/Green       iCepts1.00
    // // iCepts BRB 05.18.12 - RFM7490 New fields and Sort iCepts1.01
    // // iCepts BRB 07.02.12 - RFM7557 Add Supervisor and change Sorts iCepts1.02
    // // iCepts BRB 04.26.14 - Increase Ranby to 40, to include CurrentDATETIME iCepts1.03


    fields
    {
        field(1;"Cust No";Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2;DisplayColor;Option)
        {
            OptionMembers = "  ",Green,Yellow,Red;
        }
        field(3;"Item No.";Code[20])
        {
        }
        field(4;"Sales Amount";Decimal)
        {
        }
        field(5;"Sales Amount Sort";Code[20])
        {
        }
        field(50000;RanBy;Code[40])
        {
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
    }

    keys
    {
        key(Key1;Supervisor,Division,Gender,"Cust No",DisplayColor,"Item No.")
        {
            Clustered = true;
        }
        key(Key2;RanBy,DisplayColor,"Sales Amount Sort",Supervisor,Division,Gender,"Cust No")
        {
        }
        key(Key3;RanBy,DisplayColor,Supervisor,Division,Gender,"Cust No","Sales Amount Sort","Item No.")
        {
        }
        key(Key4;RanBy,Supervisor,Division,Gender,"Cust No",DisplayColor,"Sales Amount Sort","Item No.")
        {
        }
        key(Key5;RanBy,Supervisor,Division,Gender,"Cust No","Sales Amount Sort",DisplayColor)
        {
        }
        key(Key6;RanBy)
        {
        }
    }

    fieldgroups
    {
    }
}

