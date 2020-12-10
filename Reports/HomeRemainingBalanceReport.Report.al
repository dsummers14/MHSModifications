Report 50094 "Home Remaining Balance Report"
{
    // // iCepts DXD 09.25.13 - Upgrade2013                     iCepts1.00
    // // iCepts BRB 05.25.12 - RFM7490 New Report for balances iCepts1.00
    // // iCepts BRB 07.02.12 - RFM7557 Change Sort and ReqFilterFields, add Supervisor iCepts1.01
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/HomeRemainingBalanceReport.rdlc';

    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Customer;Customer)
        {
            DataItemTableView = sorting(Supervisor,Division,Gender);
            RequestFilterFields = "No.",Supervisor,Division,Gender;
            column(ReportForNavId_6836; 6836)
            {
            }
            column(FORMAT_TODAY_0_4_;Format(Today,0,4))
            {
            }
            column(COMPANYNAME;COMPANYNAME)
            {
            }
            column(UserId;UserId)
            {
            }
            column(txtFilter;txtFilter)
            {
            }
            column(Customer__No__;"No.")
            {
            }
            column(Customer_Name;Name)
            {
            }
            column(FoodRemainingPerc;FoodRemainingPerc)
            {
                DecimalPlaces = 1:1;
            }
            column(FoodAllowance;FoodAllowance)
            {
            }
            column(FoodSpent;FoodSpent)
            {
            }
            column(FoodRemaining;FoodRemaining)
            {
            }
            column(Customer_Gender;Gender)
            {
            }
            column(Customer_Division;Division)
            {
            }
            column(NonFoodRemainingPerc;NonFoodRemainingPerc)
            {
                DecimalPlaces = 1:1;
            }
            column(NonFoodRemaining;NonFoodRemaining)
            {
            }
            column(NonFoodSpent;NonFoodSpent)
            {
            }
            column(NonFoodAllowance;NonFoodAllowance)
            {
            }
            column(EmptyString;'%')
            {
              //  DecimalPlaces = 1:1;
            }
            column(EmptyString_Control1000000022;'%')
            {
                // DecimalPlaces = 1:1;
            }
            column(Home_Remaining_Balance_ReportCaption;Home_Remaining_Balance_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Customer__No__Caption;Customer__No__CaptionLbl)
            {
            }
            column(Customer_NameCaption;FieldCaption(Name))
            {
            }
            column(FoodRemainingPercCaption;FoodRemainingPercCaptionLbl)
            {
            }
            column(FoodAllowanceCaption;FoodAllowanceCaptionLbl)
            {
            }
            column(FoodSpentCaption;FoodSpentCaptionLbl)
            {
            }
            column(FoodRemainingCaption;FoodRemainingCaptionLbl)
            {
            }
            column(GenderCaption;GenderCaptionLbl)
            {
            }
            column(DivisionCaption;DivisionCaptionLbl)
            {
            }
            column(FoodCaption;FoodCaptionLbl)
            {
            }
            column(Non_FoodCaption;Non_FoodCaptionLbl)
            {
            }
            column(Customer_Supervisor;Supervisor)
            {
            }

            trigger OnAfterGetRecord()
            begin
                FoodAllowance := 0;
                NonFoodAllowance := 0;
                FoodSpent := 0;
                NonFoodSpent := 0;
                FoodRemaining := 0;
                NonFoodRemaining := 0;
                FoodRemainingPerc := 0;
                NonFoodRemainingPerc := 0;

                // Allowance
                DetCustLdgEnt.Reset;
                DetCustLdgEnt.SetCurrentkey("Customer No.","Posting Date","Entry Type","Currency Code");
                DetCustLdgEnt.SetRange("Customer No.","No.");
                DetCustLdgEnt.SetRange("Posting Date",FoodStartDate,FoodEndDate);
                DetCustLdgEnt.SetRange("Document Type",DetCustLdgEnt."document type"::"Credit Memo");
                DetCustLdgEnt.SetRange("Allocated Type",DetCustLdgEnt."allocated type"::Food);
                if DetCustLdgEnt.FindFirst then begin
                  repeat
                    FoodAllowance += -(DetCustLdgEnt.Amount);
                  until DetCustLdgEnt.Next = 0;
                end;

                DetCustLdgEnt.Reset;
                DetCustLdgEnt.SetCurrentkey("Customer No.","Posting Date","Entry Type","Currency Code");
                DetCustLdgEnt.SetRange("Customer No.","No.");
                DetCustLdgEnt.SetRange("Posting Date",NonFoodStartDate,NonFoodEndDate);
                DetCustLdgEnt.SetRange("Document Type",DetCustLdgEnt."document type"::"Credit Memo");
                DetCustLdgEnt.SetRange("Allocated Type",DetCustLdgEnt."allocated type"::"Non-Food");
                if DetCustLdgEnt.FindFirst then begin
                  repeat
                    NonFoodAllowance += -(DetCustLdgEnt.Amount);
                  until DetCustLdgEnt.Next = 0;
                end;

                // Spent
                DetCustLdgEnt.Reset;
                DetCustLdgEnt.SetCurrentkey("Customer No.","Posting Date","Entry Type","Currency Code");
                DetCustLdgEnt.SetRange("Customer No.","No.");
                DetCustLdgEnt.SetRange("Posting Date",FoodStartDate,FoodEndDate);
                DetCustLdgEnt.SetRange("Document Type",DetCustLdgEnt."document type"::Invoice);
                DetCustLdgEnt.SetRange("Allocated Type",DetCustLdgEnt."allocated type"::Food);
                if DetCustLdgEnt.FindFirst then begin
                  repeat
                    FoodSpent += DetCustLdgEnt.Amount;
                  until DetCustLdgEnt.Next = 0;
                end;

                DetCustLdgEnt.Reset;
                DetCustLdgEnt.SetCurrentkey("Customer No.","Posting Date","Entry Type","Currency Code");
                DetCustLdgEnt.SetRange("Customer No.","No.");
                DetCustLdgEnt.SetRange("Posting Date",NonFoodStartDate,NonFoodEndDate);
                DetCustLdgEnt.SetRange("Document Type",DetCustLdgEnt."document type"::Invoice);
                DetCustLdgEnt.SetRange("Allocated Type",DetCustLdgEnt."allocated type"::"Non-Food");
                if DetCustLdgEnt.FindFirst then begin
                  repeat
                    NonFoodSpent += DetCustLdgEnt.Amount;
                  until DetCustLdgEnt.Next = 0;
                end;

                // iCepts BRB 06.26.12 - Do not include open orders
                // iCepts BRB 11.21.12 - Balance not correct, include open orders
                SalesHeader.Reset;
                //SalesHeader.SETCURRENTKEY("Order Date");
                //SalesHeader.SETRANGE("Order Date",FoodStartDate,FoodEndDate);
                SalesHeader.SetRange("Sell-to Customer No.","No.");
                SalesHeader.SetRange("Document Type",SalesHeader."document type"::Order);
                SalesHeader.SetRange("Allocated Type",SalesHeader."allocated type"::Food);
                if SalesHeader.FindFirst then begin
                  repeat
                    // iCepts BRB 11.27.12 - SalesHeader.CALCFIELDS(Amount);
                    // iCepts BRB 11.27.12 - Get totals by line :START
                    SalesLine.Reset;
                    SalesLine.SetRange("Document Type",SalesHeader."Document Type");
                    SalesLine.SetRange("Document No.",SalesHeader."No.");
                    SalesLine.SetRange("Requested Delivery Date",FoodStartDate,FoodEndDate);
                    if SalesLine.FindFirst then begin
                      repeat
                        FoodSpent += SalesLine."Outstanding Amount";
                      until SalesLine.Next = 0;
                    end;
                    // iCepts BRB 11.27.12 - Get totals by line :END
                  until SalesHeader.Next = 0;
                end;

                SalesHeader.Reset;
                // iCepts BRB 11.27.12 - SalesHeader.SETCURRENTKEY("Order Date");
                // iCepts BRB 11.27.12 - SalesHeader.SETRANGE("Order Date",NonFoodStartDate,NonFoodEndDate);
                SalesHeader.SetRange("Sell-to Customer No.","No.");
                SalesHeader.SetRange("Document Type",SalesHeader."document type"::Order);
                SalesHeader.SetRange("Allocated Type",SalesHeader."allocated type"::"Non-Food");
                if SalesHeader.FindFirst then begin
                  repeat
                    // iCepts BRB 11.27.12 - SalesHeader.CALCFIELDS(Amount);
                    // iCepts BRB 11.27.12 - Get totals by line :START
                    SalesLine.Reset;
                    SalesLine.SetRange("Document Type",SalesHeader."Document Type");
                    SalesLine.SetRange("Document No.",SalesHeader."No.");
                    SalesLine.SetRange("Requested Delivery Date",FoodStartDate,FoodEndDate);
                    if SalesLine.FindFirst then begin
                      repeat
                        NonFoodSpent += SalesLine."Outstanding Amount";
                      until SalesLine.Next = 0;
                    end;
                    // iCepts BRB 11.27.12 - Get totals by line :END
                  until SalesHeader.Next = 0;
                end;

                FoodRemaining := FoodAllowance - FoodSpent;
                NonFoodRemaining := NonFoodAllowance - NonFoodSpent;

                if FoodAllowance <> 0 then
                  FoodRemainingPerc := (FoodRemaining / FoodAllowance) * 100;

                if NonFoodAllowance <> 0 then
                  NonFoodRemainingPerc := (NonFoodRemaining / NonFoodAllowance) * 100;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo(Gender);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        // iCepts BRB 05.25.12 - Food dates (monthly)
        AcctPeriod.Reset;
        AcctPeriod.SetFilter("Starting Date",'<=%1',WorkDate);
        if AcctPeriod.FindLast then
          FoodStartDate := AcctPeriod."Starting Date";

        AcctPeriod.Reset;
        AcctPeriod.SetFilter("Starting Date",'>%1',WorkDate);
        if AcctPeriod.FindFirst then
          FoodEndDate := CalcDate('-1D',AcctPeriod."Starting Date");

        // iCepts BRB 05.25.12 - Non-Food dates (quarterly)
        // iCepts BRB 06.27.12 - Find Fiscal Year Start
        AcctPeriod.Reset;
        AcctPeriod.SetFilter("Starting Date",'<=%1',WorkDate);
        AcctPeriod.SetRange("New Fiscal Year",true);
        if AcctPeriod.FindLast then

        /// iCepts BRB 06.27.12 - CurrMth := DATE2DMY(WORKDATE,2);
        // iCepts BRB 06.27.12 - CurrYr := DATE2DMY(WORKDATE,3);
        QtrStartDates[1] := AcctPeriod."Starting Date"; // iCepts BRB 06.27.12 - DMY2DATE(1,1,CurrYr);
        Loop := 0;
        AcctPeriod.Reset;
        AcctPeriod.SetFilter("Starting Date",'>=%1',QtrStartDates[1]);
        if AcctPeriod.FindFirst then begin
          repeat
            Loop += 1;
            QtrStartDates[Loop] := AcctPeriod."Starting Date";
            if Loop > 1 then
              QtrEndDates[Loop-1] := CalcDate('-1D',QtrStartDates[Loop]);
          until (AcctPeriod.Next(3) = 0) or (Loop = 4);
        end;
        QtrEndDates[4] := AcctPeriod."Starting Date";
        Loop := 0;
        repeat
          Loop += 1;
          if (WorkDate >= QtrStartDates[Loop]) and (WorkDate <= QtrEndDates[Loop]) then begin
            NonFoodStartDate := QtrStartDates[Loop];
            NonFoodEndDate := QtrEndDates[Loop];
          end;
        until Loop = 4;

        txtFilter := 'Food Dates: '+Format(FoodStartDate)+'-'+Format(FoodEndDate)+', Non-Food Dates: '+
          Format(NonFoodStartDate)+'-'+Format(NonFoodEndDate);
        if Customer.GetFilters <> '' then
          txtFilter += ', '+Customer.GetFilters;
    end;

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        TotalFor: label 'Total for ';
        FoodStartDate: Date;
        FoodEndDate: Date;
        NonFoodStartDate: Date;
        NonFoodEndDate: Date;
        QtrStartDates: array [5] of Date;
        QtrEndDates: array [5] of Date;
        FoodAllowance: Decimal;
        NonFoodAllowance: Decimal;
        FoodSpent: Decimal;
        NonFoodSpent: Decimal;
        FoodRemaining: Decimal;
        NonFoodRemaining: Decimal;
        FoodRemainingPerc: Decimal;
        NonFoodRemainingPerc: Decimal;
        AcctPeriod: Record "Accounting Period";
        CurrMth: Integer;
        CurrYr: Integer;
        Loop: Integer;
        DetCustLdgEnt: Record "Detailed Cust. Ledg. Entry";
        SalesHeader: Record "Sales Header";
        txtFilter: Text[1024];
        SalesLine: Record "Sales Line";
        Home_Remaining_Balance_ReportCaptionLbl: label 'Home Remaining Balance Report';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Customer__No__CaptionLbl: label 'Home';
        FoodRemainingPercCaptionLbl: label 'Remaining Percent';
        FoodAllowanceCaptionLbl: label 'Allowance';
        FoodSpentCaptionLbl: label 'Spent Amount';
        FoodRemainingCaptionLbl: label 'Remaining Dollars';
        GenderCaptionLbl: label 'Gender';
        DivisionCaptionLbl: label 'Division';
        FoodCaptionLbl: label 'Food';
        Non_FoodCaptionLbl: label 'Non-Food';
}

