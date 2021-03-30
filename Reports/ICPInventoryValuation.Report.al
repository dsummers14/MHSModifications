Report 50139 "ICPInventoryValuation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ReportLayouts/InventoryValuation.rdlc';
    Caption = 'Inventory Valuation';
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
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Time; Time)
            {
            }
            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(UserId; UserId)
            {
            }
            column(STRSUBSTNO_Text003_AsOfDate_; StrSubstNo(Text003Txt, vAsOfDate))
            {
            }
            column(ShowVariants; vShowVariants)
            {
            }
            column(ShowLocations; ShowLocations)
            {
            }
            column(ShowACY; ShowACY)
            {
            }
            column(STRSUBSTNO_Text006_Currency_Description_; StrSubstNo(Text006Txt, Currency.Description))
            {
            }
            column(Item_TABLECAPTION__________ItemFilter; Item.TableCaption + ': ' + ItemFilter)
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
            }
            column(Item_Description; Description)
            {
            }
            column(Item__Base_Unit_of_Measure_; "Base Unit of Measure")
            {
            }
            column(Item__Costing_Method_; "Costing Method")
            {
            }
            column(STRSUBSTNO_Text005_InvPostingGroup_TABLECAPTION_InvPostingGroup_Code_InvPostingGroup_Description_; StrSubstNo(Text005Txt, InventoryPostingGroup.TableCaption, InventoryPostingGroup.Code, InventoryPostingGroup.Description))
            {
            }
            column(InventoryValue; InventoryValue)
            {
            }
            column(InventoryValue_Control1020009; InventoryValue)
            {
            }
            column(Item_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Item_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            column(Item_Location_Filter; "Location Filter")
            {
            }
            column(Item_Variant_Filter; "Variant Filter")
            {
            }
            column(Inventory_ValuationCaption; Inventory_ValuationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item__Costing_Method_Caption; FieldCaption("Costing Method"))
            {
            }
            column(InventoryValue_Control34Caption; InventoryValue_Control34CaptionLbl)
            {
            }
            column(Item__No__Caption; FieldCaption("No."))
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Item__Base_Unit_of_Measure_Caption; FieldCaption("Base Unit of Measure"))
            {
            }
            column(Item_Ledger_Entry__Remaining_Quantity_Caption; "Item Ledger Entry".FieldCaption("Remaining Quantity"))
            {
            }
            column(UnitCost_Control33Caption; UnitCost_Control33CaptionLbl)
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
                column(STRSUBSTNO_Text004_ItemVariant_TABLECAPTION_ItemVariant_Code_ItemVariant_Description_; StrSubstNo(Text004Txt, ItemVariant.TableCaption, ItemVariant.Code, ItemVariant.Description))
                {
                }
                column(ItemVariant_GET__Item_No____Variant_Code__; ItemVariant.Get("Item No.", "Variant Code"))
                {
                }
                column(STRSUBSTNO_Text004_Location_TABLECAPTION_Location_Code_Location_Name_; StrSubstNo(Text004Txt, Location.TableCaption, Location.Code, Location.Name))
                {
                }
                column(Location_GET__Location_Code__; Location.Get("Location Code"))
                {
                }
                column(Item_Ledger_Entry__Entry_Type_; "Entry Type")
                {
                }
                column(Item_Ledger_Entry__Document_No__; "Document No.")
                {
                }
                column(Item_Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Item_Ledger_Entry__Remaining_Quantity_; "Remaining Quantity")
                {
                    DecimalPlaces = 0 : 5;
                }
                column(InventoryValue_Control34; InventoryValue)
                {
                }
                column(Item_Ledger_Entry__Entry_No__; "Entry No.")
                {
                }
                column(STRSUBSTNO_Text005_Location_TABLECAPTION__Location_Code__Location_Name_; StrSubstNo(Text005Txt, Location.TableCaption, "Location Code", Location.Name))
                {
                }
                column(InventoryValue_Control21; InventoryValue)
                {
                }
                column(RemainingQty; RemainingQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(UnitCost; UnitCost)
                {
                    DecimalPlaces = 2 : 5;
                }
                column(STRSUBSTNO_Text005_Location_TABLECAPTION__Location_Code__Text008_; StrSubstNo(Text005Txt, Location.TableCaption, "Location Code", Text008Txt))
                {
                }
                column(STRSUBSTNO_Text005_ItemVariant_TABLECAPTION__Variant_Code__ItemVariant_Description_; StrSubstNo(Text005Txt, ItemVariant.TableCaption, "Variant Code", ItemVariant.Description))
                {
                }
                column(InventoryValue_Control39; InventoryValue)
                {
                }
                column(RemainingQty_Control40; RemainingQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(UnitCost_Control41; UnitCost)
                {
                    DecimalPlaces = 2 : 5;
                }
                column(STRSUBSTNO_Text005_ItemVariant_TABLECAPTION__Variant_Code__Text007_; StrSubstNo(Text005Txt, ItemVariant.TableCaption, "Variant Code", Text007Txt))
                {
                }
                column(RemainingQty_Control35; RemainingQty)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(InventoryValue_Control36; InventoryValue)
                {
                }
                column(Item_Ledger_Entry__Item_No__; "Item No.")
                {
                }
                column(Item__Costing_Method__Control1020008; Item."Costing Method")
                {
                }
                column(Item__Base_Unit_of_Measure__Control1020009; Item."Base Unit of Measure")
                {
                }
                column(Item_Description_Control1020011; Item.Description)
                {
                }
                column(UnitCost_Control33; UnitCost)
                {
                    DecimalPlaces = 2 : 5;
                }
                column(Item_Ledger_Entry_Variant_Code; "Variant Code")
                {
                }
                column(Item_Ledger_Entry_Location_Code; "Location Code")
                {
                }
                column(Item_Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(Item_Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    AdjustItemLedgEntryToAsOfDate("Item Ledger Entry");

                    RemainingQty := "Remaining Quantity";
                    if ShowACY then
                        InventoryValue := "Cost Amount (Actual) (ACY)"
                    else
                        InventoryValue := "Cost Amount (Actual)";
                end;

                trigger OnPreDataItem()
                begin
                    // CurrReport.CreateTotals(RemainingQty, InventoryValue);
                    SetRange("Posting Date", 0D, vAsOfDate);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if not InventoryPostingGroup.Get("Inventory Posting Group") then
                    Clear(InventoryPostingGroup);
            end;

            trigger OnPreDataItem()
            begin
                //  CurrReport.CreateTotals(RemainingQty, InventoryValue);
                SetRange("Date Filter", 0D, vAsOfDate);
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
                    Caption = 'Options';
                    field(AsOfDate; vAsOfDate)
                    {
                        ApplicationArea = All;
                        Caption = 'As Of Date';
                        Tooltip = 'Tooltip';
                    }
                    field(ShowVariants; vShowVariants)
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

    trigger OnPreReport()
    begin
        Grouping := (Item.FieldCaption("Inventory Posting Group") = Item.CurrentKey);

        if vAsOfDate = 0D then
            Error(Text000Txt);
        if ShowLocations and not vShowVariants then
            if not "Item Ledger Entry".SetCurrentkey("Item No.", "Location Code") then
                Error(Text001Txt,
                  "Item Ledger Entry".TableCaption,
                  "Item Ledger Entry".FieldCaption("Item No."),
                  "Item Ledger Entry".FieldCaption("Location Code"));
        if Item.GetFilter("Date Filter") <> '' then
            Error(Text002Txt, Item.FieldCaption("Date Filter"), Item.TableCaption);

        CompanyInformation.Get();
        ItemFilter := CopyStr(Item.GetFilters(), 1, 250);
        GeneralLedgerSetup.Get();
        if GeneralLedgerSetup."Additional Reporting Currency" = '' then
            ShowACY := false
        else begin
            Currency.Get(GeneralLedgerSetup."Additional Reporting Currency");
            Currency.TestField("Amount Rounding Precision");
            Currency.TestField("Unit-Amount Rounding Precision");
        end;
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        InventoryPostingGroup: Record "Inventory Posting Group";
        Currency: Record Currency;
        Location: Record Location;
        ItemVariant: Record "Item Variant";
        ItemFilter: Text[250];
        InventoryValue: Decimal;
        UnitCost: Decimal;
        vShowVariants: Boolean;
        ShowLocations: Boolean;
        ShowACY: Boolean;
        vAsOfDate: Date;
        RemainingQty: Decimal;
        Text000Txt: label 'You must enter an As Of Date.';
        Text001Txt: label 'If you want to show Locations without also showing Variants, you must add a new key to the %1 table which starts with the %2 and %3 fields.';
        Text002Txt: label 'Do not set a %1 on the %2.  Use the As Of Date on the Option tab instead.';
        Text003Txt: label 'Quantities and Values As Of %1';
        Text004Txt: label '%1 %2 (%3)';
        Text005Txt: label '%1 %2 (%3) Total';
        Text006Txt: label 'All Inventory Values are shown in %1.';
        Text007Txt: label 'No Variant';
        Text008Txt: label 'No Location';
        Grouping: Boolean;
        Inventory_ValuationCaptionLbl: label 'Inventory Valuation';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        InventoryValue_Control34CaptionLbl: label 'Inventory Value';
        DescriptionCaptionLbl: label 'Description';
        UnitCost_Control33CaptionLbl: label 'Unit Cost';
        Total_Inventory_ValueCaptionLbl: label 'Total Inventory Value';

    local procedure AdjustItemLedgEntryToAsOfDate(var ItemLedgerEntry: Record "Item Ledger Entry")
    var
        ItemApplicationEntry: Record "Item Application Entry";
        ValueEntry: Record "Value Entry";
        iItemLedgerEntry: Record "Item Ledger Entry";
        InvoicedValue: Decimal;
        InvoicedValueACY: Decimal;
        ExpectedValue: Decimal;
        ExpectedValueACY: Decimal;
    begin

        // adjust remaining quantity
        ItemLedgerEntry."Remaining Quantity" := ItemLedgerEntry.Quantity;
        if ItemLedgerEntry.Positive then begin
            ItemApplicationEntry.Reset();
            ItemApplicationEntry.SetCurrentkey(
              "Inbound Item Entry No.", "Item Ledger Entry No.", "Outbound Item Entry No.", "Cost Application");
            ItemApplicationEntry.SetRange("Inbound Item Entry No.", ItemLedgerEntry."Entry No.");
            ItemApplicationEntry.SetRange("Posting Date", 0D, vAsOfDate);
            ItemApplicationEntry.SetFilter("Outbound Item Entry No.", '<>%1', 0);
            ItemApplicationEntry.SetFilter("Item Ledger Entry No.", '<>%1', ItemLedgerEntry."Entry No.");
            if ItemApplicationEntry.Find('-') then
                repeat
                    if iItemLedgerEntry.Get(ItemApplicationEntry."Item Ledger Entry No.") and
                       (iItemLedgerEntry."Posting Date" <= vAsOfDate)
                    then
                        ItemLedgerEntry."Remaining Quantity" := ItemLedgerEntry."Remaining Quantity" + ItemApplicationEntry.Quantity;
                until ItemApplicationEntry.Next() = 0;
        end else begin
            ItemApplicationEntry.Reset();
            ItemApplicationEntry.SetCurrentkey(
              "Outbound Item Entry No.", "Item Ledger Entry No.", "Cost Application", "Transferred-from Entry No.");
            ItemApplicationEntry.SetRange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
            ItemApplicationEntry.SetRange("Outbound Item Entry No.", ItemLedgerEntry."Entry No.");
            ItemApplicationEntry.SetRange("Posting Date", 0D, vAsOfDate);
            if ItemApplicationEntry.Find('-') then
                repeat
                    if iItemLedgerEntry.Get(ItemApplicationEntry."Inbound Item Entry No.") and
                       (iItemLedgerEntry."Posting Date" <= vAsOfDate)
                    then
                        ItemLedgerEntry."Remaining Quantity" := ItemLedgerEntry."Remaining Quantity" - ItemApplicationEntry.Quantity;
                until ItemApplicationEntry.Next() = 0;
        end;

        // calculate adjusted cost of entry
        ValueEntry.Reset();
        ValueEntry.SetCurrentkey("Item Ledger Entry No.", "Entry Type");
        ValueEntry.SetRange("Item Ledger Entry No.", ItemLedgerEntry."Entry No.");
        ValueEntry.SetRange("Posting Date", 0D, vAsOfDate);
        if ValueEntry.Find('-') then
            repeat
                ExpectedValue := ExpectedValue + ValueEntry."Cost Amount (Expected)";
                ExpectedValueACY := ExpectedValueACY + ValueEntry."Cost Amount (Expected) (ACY)";
                InvoicedValue := InvoicedValue + ValueEntry."Cost Amount (Actual)";
                InvoicedValueACY := InvoicedValueACY + ValueEntry."Cost Amount (Actual) (ACY)";
            until ValueEntry.Next() = 0;
        ItemLedgerEntry."Cost Amount (Actual)" := ROUND(InvoicedValue + ExpectedValue);
        ItemLedgerEntry."Cost Amount (Actual) (ACY)" := ROUND(InvoicedValueACY + ExpectedValueACY, Currency."Amount Rounding Precision");

    end;
}

