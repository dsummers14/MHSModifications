Report 50096 "Customer Sales By Color Class"
{
    // //iCepts RFM7364 01.12.12 DXD                 iCepts1.00
    // // iCepts BRB 05.21.12 - RFM7490 Be able to Select and sort by Division/Gender iCepts1.01
    // // iCepts BRB 07.02.12 - RFM7557 Be able to Select and sort by Supervisor iCepts1.02
    // // iCepts BRB 04.26.14 - Add CURRENTDATETIME to CurrUser iCepts1.03
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CustomerSalesByColorClass.rdlc';

    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            CalcFields = Supervisor, Division, Gender;
            DataItemTableView = sorting("Posting Date", "Entry Type") where("Entry Type" = filter(Sale));
            RequestFilterFields = "Posting Date", Supervisor, Division, Gender;
            column(ReportForNavId_7209; 7209)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CalcFields("Sales Amount (Actual)");
                if not Item.Get("Item No.") then
                    Clear(Item);
                if (not ColorSelect[4] and ColorSelect[1] and ColorSelect[2] and ColorSelect[3]) then
                    if ((Item.DisplayColor <> Item.Displaycolor::Green) and
                        (Item.DisplayColor <> Item.Displaycolor::Yellow) and
                        (Item.DisplayColor <> Item.Displaycolor::Red)) then
                        CurrReport.Skip();

                if (not ColorSelect[4] and (ColorSelect[1] and ColorSelect[2]) and not ColorSelect[3]) then
                    if ((Item.DisplayColor <> Item.Displaycolor::Green) and
                       (Item.DisplayColor <> Item.Displaycolor::Yellow)) then
                        CurrReport.Skip();

                if (not ColorSelect[4] and not ColorSelect[1] and ColorSelect[2] and ColorSelect[3]) then
                    if ((Item.DisplayColor <> Item.Displaycolor::Yellow) and
                       (Item.DisplayColor <> Item.Displaycolor::Red)) then
                        CurrReport.Skip();

                if (not ColorSelect[4] and (ColorSelect[1] and not ColorSelect[2]) and ColorSelect[3]) then
                    if ((Item.DisplayColor <> Item.Displaycolor::Green) and
                       (Item.DisplayColor <> Item.Displaycolor::Red)) then
                        CurrReport.Skip();

                if (not ColorSelect[4] and ColorSelect[1] and not ColorSelect[2] and not ColorSelect[3]) then
                    if (Item.DisplayColor <> Item.Displaycolor::Green) then
                        CurrReport.Skip();

                if (not ColorSelect[4] and not ColorSelect[1] and ColorSelect[2] and not ColorSelect[3]) then
                    if (Item.DisplayColor <> Item.Displaycolor::Yellow) then
                        CurrReport.Skip();

                if (not ColorSelect[4] and not ColorSelect[1] and not ColorSelect[2] and ColorSelect[3]) then
                    if (Item.DisplayColor <> Item.Displaycolor::Red) then
                        CurrReport.Skip();

                if not CustomerSaleColorBuffer.Get(Supervisor, Division, Gender, "Source No.", Item.DisplayColor, '') then begin
                    CustomerSaleColorBuffer.Init();
                    CustomerSaleColorBuffer."Cust No" := "Source No.";
                    CustomerSaleColorBuffer.DisplayColor := Item.DisplayColor;
                    CustomerSaleColorBuffer."Item No." := '';
                    CustomerSaleColorBuffer."Sales Amount" := "Sales Amount (Actual)";
                    CustomerSaleColorBuffer."Sales Amount Sort" := Format(9999999999.0 - ROUND("Sales Amount (Actual)", 0.01));
                    CustomerSaleColorBuffer.RanBy := CurrUser;

                    // iCepts BRB 05.21.12 - RFM7490 Populate New fields :START
                    CustomerSaleColorBuffer.Division := Division;
                    CustomerSaleColorBuffer.Gender := Gender;
                    // iCepts BRB 05.21.12 - RFM7490 Populate New fields :END

                    // iCepts BRB 07.02.12 - RFM7557 Populate Supervisor :START
                    CustomerSaleColorBuffer.Supervisor := Supervisor;
                    // iCepts BRB 07.02.12 - RFM7557 Populate Supervisor :START

                    CustomerSaleColorBuffer.Insert();
                end else begin
                    CustomerSaleColorBuffer."Sales Amount" := CustomerSaleColorBuffer."Sales Amount" + "Sales Amount (Actual)";
                    CustomerSaleColorBuffer."Sales Amount Sort" := Format(9999999999.0 - ROUND(CustomerSaleColorBuffer."Sales Amount", 0.01));
                    CustomerSaleColorBuffer.RanBy := CurrUser;
                    CustomerSaleColorBuffer.Modify();
                end;
            end;

            trigger OnPostDataItem()
            begin
                PrintCustSaleColorBuffer.Reset();
            end;
        }
        dataitem(PrintCustSaleColorBuffer; "Customer Sale Color Buffer")
        {
            DataItemTableView = sorting(RanBy, DisplayColor, "Sales Amount Sort", Supervisor, Division, Gender, "Cust No");
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
            column(Item_Ledger_Entry__TABLECAPTION______FilterStr; "Item Ledger Entry".TableCaption + ': ' + FilterStr)
            {
            }
            column(PrintCustSaleColorBuffer_DisplayColor; DisplayColor)
            {
            }
            column(PrintCustSaleColorBuffer_DisplayColor_Control1000000008; DisplayColor)
            {
            }
            column(PrintCustSaleColorBuffer__Cust_No_; "Cust No")
            {
            }
            column(CustRec_Name; Customer.Name)
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount_; "Sales Amount")
            {
            }
            column(PrintCustSaleColorBuffer_Gender; Gender)
            {
            }
            column(PrintCustSaleColorBuffer_Division; Division)
            {
            }
            column(PrintCustSaleColorBuffer_Supervisor; Supervisor)
            {
            }
            column(Group___FORMAT_DisplayColor____Total___; 'Group ' + Format(DisplayColor) + ' Total: ')
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount__Control1000000022; "Sales Amount")
            {
            }
            column(Report_Total__; 'Report Total:')
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount__Control1000000023; "Sales Amount")
            {
            }
            column(Customer_Sales_by_Color_ClassificationCaption; Customer_Sales_by_Color_ClassificationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(PrintCustSaleColorBuffer_DisplayColor_Control1000000008Caption; FieldCaption(DisplayColor))
            {
            }
            column(PrintCustSaleColorBuffer__Cust_No_Caption; FieldCaption("Cust No"))
            {
            }
            column(Customer_NameCaption; Customer_NameCaptionLbl)
            {
            }
            column(PrintCustSaleColorBuffer__Sales_Amount_Caption; FieldCaption("Sales Amount"))
            {
            }
            column(PrintCustSaleColorBuffer_GenderCaption; FieldCaption(Gender))
            {
            }
            column(PrintCustSaleColorBuffer_DivisionCaption; FieldCaption(Division))
            {
            }
            column(PrintCustSaleColorBuffer_SupervisorCaption; FieldCaption(Supervisor))
            {
            }
            column(PrintCustSaleColorBuffer_Item_No_; "Item No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                if not Customer.Get("Cust No") then
                    Clear(Customer);
            end;

            trigger OnPreDataItem()
            begin
                Dialog.Close();
                Commit();
                Reset();
                SetCurrentkey(RanBy, DisplayColor, "Sales Amount Sort", Supervisor, Division, Gender, "Cust No");
                SetRange(RanBy, CurrUser);
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
                group(Opitons)
                {
                    field(Green; ColorSelect[1])
                    {
                        ApplicationArea = All;
                        ToolTip = 'Tooltip';
                        Caption = 'Green';

                        trigger OnValidate()
                        begin
                            if ColorSelect[1] then begin
                                ColorSelect[4] := false;
                                ColorSelect[2] := false;
                                ColorSelect[3] := false;
                            end;
                        end;
                    }
                    field(Yellow; ColorSelect[2])
                    {
                        ApplicationArea = All;
                        ToolTip = 'Tooltip';
                        Caption = 'Yellow';

                        trigger OnValidate()
                        begin
                            if ColorSelect[2] then begin
                                ColorSelect[1] := false;
                                ColorSelect[4] := false;
                                ColorSelect[3] := false;
                            end;
                        end;
                    }
                    field(Red; ColorSelect[3])
                    {
                        ApplicationArea = All;
                        ToolTip = 'Tooltip';
                        Caption = 'Red';

                        trigger OnValidate()
                        begin
                            if ColorSelect[3] then begin
                                ColorSelect[1] := false;
                                ColorSelect[2] := false;
                                ColorSelect[4] := false;
                            end;
                        end;
                    }
                    field(All; ColorSelect[4])
                    {
                        ApplicationArea = All;
                        ToolTip = 'Tooltip';
                        Caption = 'All';

                        trigger OnValidate()
                        begin
                            if ColorSelect[4] then begin
                                ColorSelect[1] := false;
                                ColorSelect[2] := false;
                                ColorSelect[3] := false;
                            end;
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            if (not ColorSelect[1]) and (not ColorSelect[2]) and (not ColorSelect[3]) and (not ColorSelect[4]) then
                ColorSelect[4] := true;
        end;
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
        Dialog.Open('Building report, please wait...');
        CurrUser := CopyStr(UserId + Format(CurrentDatetime), 1, 40);
        FilterStr := CopyStr("Item Ledger Entry".GetFilters(), 1, 250);
    end;

    var
        CustomerSaleColorBuffer: Record "Customer Sale Color Buffer";
        Item: Record Item;
        Customer: Record Customer;
        CurrUser: Code[40];
        FilterStr: Text[250];
        ColorSelect: array[4] of Boolean;
        Customer_Sales_by_Color_ClassificationCaptionLbl: label 'Customer Sales by Color Classification';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        Customer_NameCaptionLbl: label 'Customer Name';
        Dialog: Dialog;
}

