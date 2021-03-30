Report 50095 "Cust Sales Item Color Detail"
{
    // // iCepts DXD 11.03.14 - Clear Buffer file onPreReport   iCepts1.07
    // // iCepts BRB 04.26.14 - Add CURRENTDATETIME to CurrUser iCepts1.06
    // // iCepts BRB 07.02.12 - RFM7557 Select and sort by Supervisor  iCepts1.05
    // // iCepts BRB 06.26.12 - Use 2 decimals, to show how they add upto 100% iCepts1.04
    // // iCepts BRB 05.21.12 - RFM7490 Be able to Select and sort by Division/Gender iCepts1.03
    // // iCepts BRB 01.31.12 - RFM7394 Skip non-food default TRUE iCepts1.02
    // //iCepts RFM7394 01.26.12 DXD Add %           iCepts1.01
    // // iCepts dxd 09.26.13 -Upgrade2013                             iCepts1.00
    // //iCepts RFM7364 01.12.12 DXD                 iCepts1.00
    DefaultLayout = RDLC;
    RDLCLayout = './ReportLayouts/CustSalesItemColorDetail.rdlc';

    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            DataItemTableView = sorting("Posting Date", "Entry Type") where("Entry Type" = filter(Sale));
            RequestFilterFields = "Source No.", "Posting Date";
            column(ReportForNavId_7209; 7209)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if not Item.Get("Item No.") then
                    Clear(Item);
                if (SkipNonFood) and (Item.DisplayColor = 0) then
                    CurrReport.Skip();
                CalcFields("Sales Amount (Actual)", Supervisor, Division, Gender);
                if ColorSummary then
                    "Item No." := '';

                if not CustomerSaleColorBuffer.Get(Supervisor, Division, Gender, "Source No.", Item.DisplayColor, "Item No.") then begin
                    CustomerSaleColorBuffer.Init();
                    CustomerSaleColorBuffer."Cust No" := "Source No.";
                    CustomerSaleColorBuffer.DisplayColor := Item.DisplayColor;
                    CustomerSaleColorBuffer."Item No." := "Item No.";
                    CustomerSaleColorBuffer."Sales Amount" := "Sales Amount (Actual)";
                    CustomerSaleColorBuffer."Sales Amount Sort" := Format(9999999999.0 - ROUND("Sales Amount (Actual)", 0.01));
                    CustomerSaleColorBuffer.RanBy := CurrUser;

                    // iCepts BRB 05.21.12 - RFM7490 Populate New fields :START
                    CustomerSaleColorBuffer.Division := Division;
                    CustomerSaleColorBuffer.Gender := Gender;
                    // iCepts BRB 05.21.12 - RFM7490 Populate New fields :END

                    // iCepts BRB 07.02.12 - RFM7557 Add Supervisor :START
                    CustomerSaleColorBuffer.Supervisor := Supervisor;
                    //MESSAGE('Supervisor %1',Supervisor); //10.21.13
                    // iCepts BRB 07.02.12 - RFM7557 Add Supervisor :START

                    CustomerSaleColorBuffer.Insert();
                end else begin
                    CustomerSaleColorBuffer."Sales Amount" := CustomerSaleColorBuffer."Sales Amount" + "Sales Amount (Actual)";
                    CustomerSaleColorBuffer."Sales Amount Sort" := Format(9999999999.0 - ROUND(CustomerSaleColorBuffer."Sales Amount", 0.01));
                    CustomerSaleColorBuffer.RanBy := CurrUser;
                    CustomerSaleColorBuffer.Modify();
                end;

                if not TempCustomer.Get("Source No.") then begin
                    TempCustomer.Init();
                    TempCustomer."No." := "Source No.";
                    TempCustomer.Amount := "Sales Amount (Actual)";
                    TempCustomer.Insert();
                end else begin
                    TempCustomer.Amount := TempCustomer.Amount + "Sales Amount (Actual)";
                    TempCustomer.Modify();
                end;
            end;
        }
        dataitem(PrintCustSaleColorBuffer; "Customer Sale Color Buffer")
        {
            DataItemTableView = sorting(RanBy, Supervisor, Division, Gender, "Cust No", "Sales Amount Sort", DisplayColor);
            PrintOnlyIfDetail = false;
            column(ReportForNavId_6803; 6803)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(UserId; UserId)
            {
            }
            column(Color_Summary; ColorSummary)
            {
            }
            column(Item_Ledger_Entry__TABLECAPTION______FilterStr; "Item Ledger Entry".TableCaption + ': ' + FilterStr)
            {
            }
            column(PrintCustSaleColorBuffer_DisplayColor; DisplayColor)
            {
            }
            column(PrintCustSaleColorBuffer__Cust_No_; "Cust No")
            {
            }
            column(CustRec_Name; CustRec.Name)
            {
            }
            column(PrintCustSaleColorBuffer__Cust_No__Control1000000006; "Cust No")
            {
            }
            column(CustRec_Name_Control1000000012; CustRec.Name)
            {
            }
            column(Gender____FORMAT_Gender_; 'Gender: ' + Format(Gender))
            {
            }
            column(Division____FORMAT_Division_; 'Division: ' + Format(Division))
            {
            }
            column(Supervisor____FORMAT_Supervisor_; 'Supervisor: ' + Format(Supervisor))
            {
            }
            column(PrintCustSaleColorBuffer__Item_No__; "Item No.")
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount_; "Sales Amount")
            {
            }
            column(ItemRec_Description; Item.Description)
            {
            }
            column(PrintCustSaleColorBuffer_DisplayColor_Control1000000008; DisplayColor)
            {
            }
            column(FORMAT_DisplayColor____DispTotal; Format(DisplayColor) + DispTotal)
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount__Control1000000018; "Sales Amount")
            {
            }
            column(Percent; Percent)
            {
                DecimalPlaces = 2 : 2;
            }
            column(Cust____Cust_No____Totals___; 'Cust ' + "Cust No" + ' Totals: ')
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount__Control1000000022; "Sales Amount")
            {
            }
            column(Report_Total__; 'Report Total:')
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount__Control1000000020; "Sales Amount")
            {
            }
            column(Customer_Sales_Item_Color_DetailCaption; Customer_Sales_Item_Color_DetailCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Cust_NoCaption; Cust_NoCaptionLbl)
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(Display_ColorCaption; Display_ColorCaptionLbl)
            {
            }
            column(Sales_AmountCaption; Sales_AmountCaptionLbl)
            {
            }
            column(PercentCaption; PercentCaptionLbl)
            {
            }
            column(PrintCustSaleColorBuffer__Item_No__Caption; FieldCaption("Item No."))
            {
            }
            column(PrintCustSaleColorBuffer_DisplayColor_Control1000000008Caption; FieldCaption(DisplayColor))
            {
            }
            column(PrintCustSaleColorBuffer__Cust_No__Control1000000006Caption; FieldCaption("Cust No"))
            {
            }
            column(Customer_NameCaption_Control1000000013; Customer_NameCaption_Control1000000013Lbl)
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount_Caption; FieldCaption("Sales Amount"))
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(ItemNoCaption; ItemNoCaptionLbl)
            {
            }
            column(PrintCustSaleColorBuffer_Supervisor; Supervisor)
            {
            }
            column(PrintCustSaleColorBuffer_Division; Division)
            {
            }
            column(PrintCustSaleColorBuffer_Gender; Gender)
            {
            }
            column(PrintCustSaleColorBuffer_SalesAmount_Sort; "Sales Amount Sort")
            {
            }

            trigger OnAfterGetRecord()
            begin
                Percent := 0;
                if not CustRec.Get("Cust No") then
                    Clear(CustRec);
                if not Item.Get("Item No.") then
                    Clear(Item);

                if TempCustomer.Get("Cust No") then
                    if TempCustomer.Amount <> 0 then
                        Percent := ("Sales Amount" / TempCustomer.Amount) * 100;
            end;

            trigger OnPreDataItem()
            begin
                Win.Close();
                Commit();
                Reset();
                if not ColorSummary then
                    SetCurrentkey(RanBy, Supervisor, Division, Gender, "Cust No", DisplayColor, "Sales Amount Sort", "Item No.")
                else
                    SetCurrentkey(RanBy, Supervisor, Division, Gender, "Cust No", "Sales Amount Sort", DisplayColor);
                SetRange(RanBy, CurrUser);
                //CurrReport.CreateTotals("Sales Amount");
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field("Display Color Summary"; ColorSummary)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Tooltip';
                        Caption = 'Display Color Summary';
                    }
                    field("Skip Non-Food"; SkipNonFood)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Tooltip';
                        Caption = 'Skip Non-Food';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        CustomerSaleColorBuffer.Reset();
        CustomerSaleColorBuffer.SetCurrentkey(RanBy);
        CustomerSaleColorBuffer.SetRange(RanBy, CurrUser);
        CustomerSaleColorBuffer.DeleteAll();
    end;

    trigger OnPreReport()
    begin
        Win.Open('Building report, please wait...');
        CurrUser := CopyStr(UserId + Format(CurrentDatetime), 1, 40);
        FilterStr := CopyStr("Item Ledger Entry".GetFilters, 1, 250);
        //iCepts 11.03.14 DXD
        CustomerSaleColorBuffer.Reset();
        CustomerSaleColorBuffer.DeleteAll();
        //iCepts 11.03.14 DXD
    end;

    var
        CustomerSaleColorBuffer: Record "Customer Sale Color Buffer";
        Item: Record Item;
        CustRec: Record Customer;
        TempCustomer: Record Customer temporary;
        CurrUser: Code[40];
        ColorSummary: Boolean;
        FilterStr: Text[250];
        DispTotal: Text[30];
        Percent: Decimal;
        SkipNonFood: Boolean;
        Win: Dialog;
        Customer_Sales_Item_Color_DetailCaptionLbl: label 'Customer Sales Item Color Detail';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Cust_NoCaptionLbl: label 'Cust No.';
        Customer_NameCaptionLbl: label 'Customer Name';
        Display_ColorCaptionLbl: label 'Display Color';
        Sales_AmountCaptionLbl: label 'Sales Amount';
        PercentCaptionLbl: label '  %';
        Customer_NameCaption_Control1000000013Lbl: label 'Customer Name';
        DescriptionCaptionLbl: label 'Description';
        EmptyStringCaptionLbl: label '%';
        ItemNoCaptionLbl: label 'Item No.';
}

