Report 50138 "ICPInventorytoG/LReconcile"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/InventorytoGLReconcile.rdlc';
    UsageCategory = ReportsandAnalysis;

    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Inventory Posting Group", "Costing Method", "Location Filter", "Variant Filter";
            column(ReportForNavId_8129; 8129)
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(STRSUBSTNO_Text003_AsOfDate_; StrSubstNo(Text003Txt, vAsOfDate))
            {
            }
            column(STRSUBSTNO_Text006_Currency_Description_; StrSubstNo(Text006Txt, Currency.Description))
            {
            }
            column(Item_TABLECAPTION__________ItemFilter; Item.TableCaption + ': ' + ItemFilter)
            {
            }
            column(ShowVariants; ShowVariants)
            {
            }
            column(ShowLocations; ShowLocations)
            {
            }
            column(ShowACY; ShowACY)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(STRSUBSTNO_Text004_InvPostingGroup_TABLECAPTION_InvPostingGroup_Code_InvPostingGroup_Description_; StrSubstNo(Text004Txt, InventoryPostingGroup.TableCaption, InventoryPostingGroup.Code, InventoryPostingGroup.Description))
            {
            }
            column(Item__Inventory_Posting_Group_; "Inventory Posting Group")
            {
            }
            column(Grouping; Grouping)
            {
            }
            column(Item__No__; "No.")
            {
                IncludeCaption = true;
            }
            column(STRSUBSTNO_Text009_FIELDCAPTION__Costing_Method____Costing_Method__; StrSubstNo(Text009Txt, FieldCaption("Costing Method"), "Costing Method"))
            {
            }
            column(Item_Description; Description)
            {
            }
            column(STRSUBSTNO_Text005_InvPostingGroup_TABLECAPTION_InvPostingGroup_Code_InvPostingGroup_Description_; StrSubstNo(Text005Txt, InventoryPostingGroup.TableCaption, InventoryPostingGroup.Code, InventoryPostingGroup.Description))
            {
            }
            column(Inventory_to_G_L_ReconciliationCaption; Inventory_to_G_L_ReconciliationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(InventoryValueCaption; InventoryValue_Control34CaptionLbl)
            {
            }
            column(ReceivedNotInvoicedCaption; ReceivedNotInvoiced_Control1020000CaptionLbl)
            {
            }
            column(ShippedNotInvoicedCaption; ShippedNotInvoiced_Control1020002CaptionLbl)
            {
            }
            column(TotalExpectedCostCaption; TotalExpectedCost_Control1020004CaptionLbl)
            {
            }
            column(ReceivedNotInvoicedPostedCaption; ReceivedNotInvoicedPosted_Control1020006CaptionLbl)
            {
            }
            column(ShippedNotInvoicedPostedCaption; ShippedNotInvoicedPosted_Control1020008CaptionLbl)
            {
            }
            column(NetExpectedCostPostedCaption; NetExpectedCostPosted_Control1020010CaptionLbl)
            {
            }
            column(NetExpectedCostNotPostedCaption; NetExpectedCostNotPosted_Control1020012CaptionLbl)
            {
            }
            column(AdjustFlagEntryCaption; AdjustFlagEntryCaptionLbl)
            {
            }
            column(TotalInvoicedValueCaption; TotalInvoicedValue_Control1020016CaptionLbl)
            {
            }
            column(InvoicedValuePostedCaption; InvoicedValuePosted_Control1020018CaptionLbl)
            {
            }
            column(InvoicedValueNotPostedCaption; InvoicedValueNotPosted_Control1020020CaptionLbl)
            {
            }
            column(Total_Inventory_ValueCaption; Total_Inventory_ValueCaptionLbl)
            {
            }
            dataitem("Item Ledger Entry"; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = field("No."), "Global Dimension 1 Code" = field("Global Dimension 1 Filter"), "Global Dimension 2 Code" = field("Global Dimension 2 Filter"), "Location Code" = field("Location Filter"), "Variant Code" = field("Variant Filter");
                DataItemTableView = sorting("Item No.", "Variant Code", "Location Code", "Posting Date");
                column(ReportForNavId_7209; 7209)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if "Applied Entry to Adjust" then
                        AdjustFlagEntry := true;

                    AdjustItemLedgEntryToAsOfDate("Item Ledger Entry");
                    UpdateBuffer("Item Ledger Entry");
                end;

                trigger OnPostDataItem()
                begin
                    UpdateTempBuffer();
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Posting Date", 0D, vAsOfDate);
                end;
            }
            dataitem(BufferLoop; "Integer")
            {
                DataItemTableView = sorting(Number);
                column(ReportForNavId_1596; 1596)
                {
                }
                column(RowLabel; TempItemLocationVariantBufferGbl.Label)
                {
                }
                column(RowLabelTotal; StrSubstNo(Text010Txt, TempItemLocationVariantBufferGbl.Label))
                {
                }
                column(ItemTotalText; StrSubstNo(Text010Txt, TempItemLocationVariantBufferGbl."Item No."))
                {
                }
                column(InventoryValue; TempItemLocationVariantBufferGbl.Value1)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(ReceivedNotInvoiced; TempItemLocationVariantBufferGbl.Value2)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(ShippedNotInvoiced; TempItemLocationVariantBufferGbl.Value3)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(TotalExpectedCost; TempItemLocationVariantBufferGbl.Value4)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(ReceivedNotInvoicedPosted; TempItemLocationVariantBufferGbl.Value5)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(ShippedNotInvoicedPosted; TempItemLocationVariantBufferGbl.Value6)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(NetExpectedCostPosted; TempItemLocationVariantBufferGbl.Value7)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(NetExpectedCostNotPosted; TempItemLocationVariantBufferGbl.Value8)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(TotalInvoicedValue; TempItemLocationVariantBufferGbl.Value9)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(InvoicedValuePosted; TempItemLocationVariantBufferGbl.Value10)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(InvoicedValueNotPosted; TempItemLocationVariantBufferGbl.Value11)
                {
                    AutoFormatExpression = Currency.Code;
                    AutoFormatType = 1;
                }
                column(ItemLedgerEntry_VariantCode; TempItemLocationVariantBufferGbl."Variant Code")
                {
                }
                column(ItemLedgerEntry_LocationCode; TempItemLocationVariantBufferGbl."Location Code")
                {
                }
                column(AdjustFlagEntry; Format(AdjustFlagEntry))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Number = 1 then
                        TempItemLocationVariantBufferGbl.Find('-')
                    else
                        TempItemLocationVariantBufferGbl.Next();
                end;

                trigger OnPostDataItem()
                begin
                    TempItemLocationVariantBufferGbl.DeleteAll();
                end;

                trigger OnPreDataItem()
                begin
                    BufferLoop.SetRange(Number, 1, TempItemLocationVariantBufferGbl.Count);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if not InventoryPostingGroup.Get("Inventory Posting Group") then
                    Clear(InventoryPostingGroup);
                ProgressDialog.Update(1, Format("No."));
                AdjustFlagEntry := false;
            end;

            trigger OnPreDataItem()
            begin
                SetRange("Date Filter", 0D, vAsOfDate);
            end;
        }
    }

    requestpage
    {
        Caption = 'Inventory to G/L Reconcile';
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(AsOfDate; vAsOfDate)
                    {
                        ApplicationArea = All;
                        Caption = 'As Of Date';
                        Tooltip = 'Tooltip';
                    }
                    field(BreakdownByVariants; ShowVariants)
                    {
                        ApplicationArea = All;
                        Caption = 'Breakdown by Variants';
                        Tooltip = 'Tooltip';
                    }
                    field(BreakdownByLocation; ShowLocations)
                    {
                        ApplicationArea = All;
                        Caption = 'Breakdown by Location';
                        Tooltip = 'Tooltip';
                    }
                    field(UseAdditionalReportingCurrency; ShowACY)
                    {
                        ApplicationArea = All;
                        Caption = 'Use Additional Reporting Currency';
                        Tooltip = 'Tooltip';
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
        ProgressDialog.Close();
    end;

    trigger OnPreReport()
    begin
        Grouping := (Item.FieldCaption("Inventory Posting Group") = Item.CurrentKey);

        if vAsOfDate = 0D then
            Error(Text000Txt);
        if ShowLocations and not ShowVariants then
            if not "Item Ledger Entry".SetCurrentkey("Item No.", "Location Code") then
                Error(Text001Txt,
                  "Item Ledger Entry".TableCaption,
                  "Item Ledger Entry".FieldCaption("Item No."),
                  "Item Ledger Entry".FieldCaption("Location Code"));
        if Item.GetFilter("Date Filter") <> '' then
            Error(Text002Txt, Item.FieldCaption("Date Filter"), Item.TableCaption);

        CompanyInformation.Get();
        ItemFilter := CopyStr(Item.GetFilters, 1, 250);
        GeneralLedgerSetup.Get();
        if GeneralLedgerSetup."Additional Reporting Currency" = '' then
            ShowACY := false
        else begin
            Currency.Get(GeneralLedgerSetup."Additional Reporting Currency");
            Currency.TestField("Amount Rounding Precision");
            Currency.TestField("Unit-Amount Rounding Precision");
        end;
        ProgressDialog.Open(Item.TableCaption + '  #1############');
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        InventoryPostingGroup: Record "Inventory Posting Group";
        Currency: Record Currency;
        Location: Record Location;
        ItemVariant: Record "Item Variant";
        TempItemLocationVariantBufferGbl: Record "Item Location Variant Buffer" temporary;
        ItemFilter: Text[250];
        ShowVariants: Boolean;
        ShowLocations: Boolean;
        ShowACY: Boolean;
        vAsOfDate: Date;
        Text000Txt: label 'You must enter an As Of Date.';
        Text001Txt: label 'If you want to show Locations without also showing Variants, you must add a new key to the %1 table which starts with the %2 and %3 fields.';
        Text002Txt: label 'Do not set a %1 on the %2.  Use the As Of Date on the Option tab instead.';
        Text003Txt: label 'Values As Of %1';
        Text004Txt: label '%1 %2 (%3)';
        Text005Txt: label '%1 %2 (%3) Total';
        Text006Txt: label 'All Inventory Values are shown in %1.';
        Text007Txt: label 'No Variant';
        Text008Txt: label 'No Location';
        Text009Txt: label '%1: %2';
        Text010Txt: label '%1 Total'; // Placeholder %1 is Total
        Grouping: Boolean;
        Inventory_to_G_L_ReconciliationCaptionLbl: label 'Inventory to G/L Reconciliation';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        InventoryValue_Control34CaptionLbl: label 'Inventory Valuation';
        ReceivedNotInvoiced_Control1020000CaptionLbl: label 'Received Not Invoiced';
        ShippedNotInvoiced_Control1020002CaptionLbl: label 'Shipped Not Invoiced';
        TotalExpectedCost_Control1020004CaptionLbl: label 'Total Expected Cost';
        ReceivedNotInvoicedPosted_Control1020006CaptionLbl: label 'Rec. Not Inv. Posted to G/L';
        ShippedNotInvoicedPosted_Control1020008CaptionLbl: label 'Shp. Not Inv. Posted to G/L';
        NetExpectedCostPosted_Control1020010CaptionLbl: label 'Expected Cost Posted to G/L';
        NetExpectedCostNotPosted_Control1020012CaptionLbl: label 'Expected Cost to be Posted';
        AdjustFlagEntryCaptionLbl: label 'Pending Adj.';
        TotalInvoicedValue_Control1020016CaptionLbl: label 'Invoiced Value';
        InvoicedValuePosted_Control1020018CaptionLbl: label 'Inv. Value Posted to G/L';
        InvoicedValueNotPosted_Control1020020CaptionLbl: label 'Inv. Value to be Posted';
        Total_Inventory_ValueCaptionLbl: label 'Total Inventory Value';
        InventoryValue: Decimal;
        ShippedNotInvoiced: Decimal;
        ReceivedNotInvoiced: Decimal;
        NetExpectedCostNotPosted: Decimal;
        ShippedNotInvoicedPosted: Decimal;
        ReceivedNotInvoicedPosted: Decimal;
        NetExpectedCostPosted: Decimal;
        TotalExpectedCost: Decimal;
        TotalInvoicedValue: Decimal;
        InvoicedValueNotPosted: Decimal;
        InvoicedValuePosted: Decimal;
        IsCollecting: Boolean;
        ProgressDialog: Dialog;
        LastItemNo: Code[20];
        LastLocationCode: Code[10];
        LastVariantCode: Code[10];
        NewRow: Boolean;
        VariantLabel: Text[250];
        LocationLabel: Text[250];
        AdjustFlagEntry: Boolean;

    local procedure AdjustItemLedgEntryToAsOfDate(var ItemLedgerEntry: Record "Item Ledger Entry")
    var
        ValueEntry: Record "Value Entry";
        InvoicedValue: Decimal;
        InvoicedValueACY: Decimal;
        InvoicedPostedToGL: Decimal;
        InvoicedPostedToGLACY: Decimal;
        InvoicedQty: Decimal;
        ValuedQty: Decimal;
        ExpectedValue: Decimal;
        ExpectedValueACY: Decimal;
        ExpectedPostedToGL: Decimal;
        ExpectedPostedToGLACY: Decimal;
    begin
        InventoryValue := 0;
        ShippedNotInvoiced := 0;
        ReceivedNotInvoiced := 0;
        NetExpectedCostNotPosted := 0;
        ShippedNotInvoicedPosted := 0;
        ReceivedNotInvoicedPosted := 0;
        NetExpectedCostPosted := 0;
        TotalExpectedCost := 0;
        TotalInvoicedValue := 0;
        InvoicedValueNotPosted := 0;
        InvoicedValuePosted := 0;

        InvoicedValue := 0;
        InvoicedValueACY := 0;
        InvoicedPostedToGL := 0;
        InvoicedPostedToGLACY := 0;
        InvoicedQty := 0;
        ValuedQty := 0;
        ExpectedValue := 0;
        ExpectedValueACY := 0;
        ExpectedPostedToGL := 0;
        ExpectedPostedToGLACY := 0;

        // calculate adjusted cost of entry
        ValueEntry.Reset();
        ValueEntry.SetCurrentkey("Item Ledger Entry No.");
        ValueEntry.SetRange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
        ValueEntry.SetRange("Posting Date", 0D, vAsOfDate);
        if ValueEntry.Find('-') then
            repeat
                ExpectedValue := ExpectedValue + ValueEntry."Cost Amount (Expected)";
                ExpectedValueACY := ExpectedValueACY + ValueEntry."Cost Amount (Expected) (ACY)";
                ExpectedPostedToGL := ExpectedPostedToGL + ValueEntry."Expected Cost Posted to G/L";
                ExpectedPostedToGLACY := ExpectedPostedToGLACY + ValueEntry."Exp. Cost Posted to G/L (ACY)";
                if ValueEntry."Expected Cost" and (ValuedQty = 0) then
                    ValuedQty := ValueEntry."Valued Quantity";
                InvoicedQty := InvoicedQty + ValueEntry."Invoiced Quantity";
                InvoicedValue := InvoicedValue + ValueEntry."Cost Amount (Actual)";
                InvoicedValueACY := InvoicedValueACY + ValueEntry."Cost Amount (Actual) (ACY)";
                InvoicedPostedToGL := InvoicedPostedToGL + ValueEntry."Cost Posted to G/L";
                InvoicedPostedToGLACY := InvoicedPostedToGLACY + ValueEntry."Cost Posted to G/L (ACY)";
            until ValueEntry.Next() = 0;

        if ValuedQty = 0 then
            ValuedQty := InvoicedQty
        else
            if ValuedQty > 0 then begin
                if ShowACY then begin
                    ReceivedNotInvoiced := ExpectedValueACY;
                    ReceivedNotInvoicedPosted := ExpectedPostedToGLACY;
                end else begin
                    ReceivedNotInvoiced := ExpectedValue;
                    ReceivedNotInvoicedPosted := ExpectedPostedToGL;
                end;
            end else
                if ValuedQty < 0 then
                    if ShowACY then begin
                        ShippedNotInvoiced := ExpectedValueACY;
                        ShippedNotInvoicedPosted := ExpectedPostedToGLACY;
                    end else begin
                        ShippedNotInvoiced := ExpectedValue;
                        ShippedNotInvoicedPosted := ExpectedPostedToGL;
                    end;

        TotalExpectedCost := ReceivedNotInvoiced + ShippedNotInvoiced;
        NetExpectedCostPosted := ReceivedNotInvoicedPosted + ShippedNotInvoicedPosted;
        NetExpectedCostNotPosted := TotalExpectedCost - NetExpectedCostPosted;
        if ShowACY then begin
            TotalInvoicedValue := InvoicedValueACY;
            InvoicedValuePosted := InvoicedPostedToGLACY;
        end else begin
            TotalInvoicedValue := InvoicedValue;
            InvoicedValuePosted := InvoicedPostedToGL;
        end;
        InvoicedValueNotPosted := TotalInvoicedValue - InvoicedValuePosted;
        InventoryValue := TotalInvoicedValue + TotalExpectedCost;

    end;

    local procedure UpdateBuffer(ItemLedgerEntry: Record "Item Ledger Entry")
    begin
        if ItemLedgerEntry."Item No." <> LastItemNo then begin
            ClearLastEntry();
            LastItemNo := ItemLedgerEntry."Item No.";
            NewRow := true
        end;

        if ShowVariants or ShowLocations then begin
            if (ItemLedgerEntry."Variant Code" <> LastVariantCode) then begin
                NewRow := true;
                LastVariantCode := ItemLedgerEntry."Variant Code";
                if ShowVariants then begin
                    if (ItemLedgerEntry."Variant Code" = '') or not (ItemVariant.Get(ItemLedgerEntry."Item No.", ItemLedgerEntry."Variant Code")) then
                        VariantLabel := Text007Txt
                    else
                        VariantLabel := ItemVariant.TableCaption + ' ' + ItemLedgerEntry."Variant Code" + '(' + ItemVariant.Description + ')';
                end
                else
                    VariantLabel := ''
            end;
            if (ItemLedgerEntry."Location Code" <> LastLocationCode) then begin
                NewRow := true;
                LastLocationCode := ItemLedgerEntry."Location Code";
                if ShowLocations then begin
                    if (ItemLedgerEntry."Location Code" = '') or not Location.Get(ItemLedgerEntry."Location Code") then
                        LocationLabel := Text008Txt
                    else
                        LocationLabel := Location.TableCaption + ' ' + ItemLedgerEntry."Location Code" + '(' + Location.Name + ')';
                end
                else
                    LocationLabel := '';
            end
        end;

        if NewRow then
            UpdateTempBuffer();

        if ShowACY then begin
            TempItemLocationVariantBufferGbl.Value1 += ROUND(InventoryValue, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value2 += ROUND(ReceivedNotInvoiced, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value3 += ROUND(ShippedNotInvoiced, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value4 += ROUND(TotalExpectedCost, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value5 += ROUND(ReceivedNotInvoicedPosted, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value6 += ROUND(ShippedNotInvoicedPosted, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value7 += ROUND(NetExpectedCostPosted, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value8 += ROUND(NetExpectedCostNotPosted, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value9 += ROUND(TotalInvoicedValue, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value10 += ROUND(InvoicedValuePosted, Currency."Amount Rounding Precision");
            TempItemLocationVariantBufferGbl.Value11 += ROUND(InvoicedValueNotPosted, Currency."Amount Rounding Precision");
        end else begin
            TempItemLocationVariantBufferGbl.Value1 += ROUND(InventoryValue);
            TempItemLocationVariantBufferGbl.Value2 += ROUND(ReceivedNotInvoiced);
            TempItemLocationVariantBufferGbl.Value3 += ROUND(ShippedNotInvoiced);
            TempItemLocationVariantBufferGbl.Value4 += ROUND(TotalExpectedCost);
            TempItemLocationVariantBufferGbl.Value5 += ROUND(ReceivedNotInvoicedPosted);
            TempItemLocationVariantBufferGbl.Value6 += ROUND(ShippedNotInvoicedPosted);
            TempItemLocationVariantBufferGbl.Value7 += ROUND(NetExpectedCostPosted);
            TempItemLocationVariantBufferGbl.Value8 += ROUND(NetExpectedCostNotPosted);
            TempItemLocationVariantBufferGbl.Value9 += ROUND(TotalInvoicedValue);
            TempItemLocationVariantBufferGbl.Value10 += ROUND(InvoicedValuePosted);
            TempItemLocationVariantBufferGbl.Value11 += ROUND(InvoicedValueNotPosted);
        end;

        TempItemLocationVariantBufferGbl."Item No." := ItemLedgerEntry."Item No.";
        if ShowVariants then
            TempItemLocationVariantBufferGbl."Variant Code" := LastVariantCode;
        if ShowLocations then
            TempItemLocationVariantBufferGbl."Location Code" := LastLocationCode;
        TempItemLocationVariantBufferGbl.Label := CopyStr(VariantLabel + ' ' + LocationLabel, 1, 250);

        IsCollecting := true;
    end;

    local procedure ClearLastEntry()
    begin
        LastItemNo := '@@@';
        LastLocationCode := '@@@';
        LastVariantCode := '@@@';
    end;

    local procedure UpdateTempBuffer()
    var
        TempItemLocationVariantBuffer: Record "Item Location Variant Buffer" temporary;
    begin
        if IsCollecting then
            if not TempItemLocationVariantBuffer.Insert() then begin
                TempItemLocationVariantBuffer.Copy(TempItemLocationVariantBuffer, true);
                TempItemLocationVariantBuffer.Get(TempItemLocationVariantBuffer."Item No.", TempItemLocationVariantBuffer."Variant Code", TempItemLocationVariantBuffer."Location Code");
                TempItemLocationVariantBuffer.Value1 += TempItemLocationVariantBuffer.Value1;
                TempItemLocationVariantBuffer.Value2 += TempItemLocationVariantBuffer.Value2;
                TempItemLocationVariantBuffer.Value3 += TempItemLocationVariantBuffer.Value3;
                TempItemLocationVariantBuffer.Value4 += TempItemLocationVariantBuffer.Value4;
                TempItemLocationVariantBuffer.Value5 += TempItemLocationVariantBuffer.Value5;
                TempItemLocationVariantBuffer.Value6 += TempItemLocationVariantBuffer.Value6;
                TempItemLocationVariantBuffer.Value7 += TempItemLocationVariantBuffer.Value7;
                TempItemLocationVariantBuffer.Value8 += TempItemLocationVariantBuffer.Value8;
                TempItemLocationVariantBuffer.Value9 += TempItemLocationVariantBuffer.Value9;
                TempItemLocationVariantBuffer.Value10 += TempItemLocationVariantBuffer.Value10;
                TempItemLocationVariantBuffer.Value11 += TempItemLocationVariantBuffer.Value11;
                TempItemLocationVariantBuffer.Modify();
            end;

        IsCollecting := false;
        Clear(TempItemLocationVariantBuffer);
    end;
}

