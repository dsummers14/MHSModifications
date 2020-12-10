Report 50139 "ICPInventoryValuation"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/InventoryValuation.rdlc';
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
            column(STRSUBSTNO_Text003_AsOfDate_; StrSubstNo(Text003, AsOfDate))
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
            column(STRSUBSTNO_Text006_Currency_Description_; StrSubstNo(Text006, Currency.Description))
            {
            }
            column(Item_TABLECAPTION__________ItemFilter; Item.TableCaption + ': ' + ItemFilter)
            {
            }
            column(ItemFilter; ItemFilter)
            {
            }
            column(STRSUBSTNO_Text004_InvPostingGroup_TABLECAPTION_InvPostingGroup_Code_InvPostingGroup_Description_; StrSubstNo(Text004, InvPostingGroup.TableCaption, InvPostingGroup.Code, InvPostingGroup.Description))
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
            column(STRSUBSTNO_Text005_InvPostingGroup_TABLECAPTION_InvPostingGroup_Code_InvPostingGroup_Description_; StrSubstNo(Text005, InvPostingGroup.TableCaption, InvPostingGroup.Code, InvPostingGroup.Description))
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
                column(STRSUBSTNO_Text004_ItemVariant_TABLECAPTION_ItemVariant_Code_ItemVariant_Description_; StrSubstNo(Text004, ItemVariant.TableCaption, ItemVariant.Code, ItemVariant.Description))
                {
                }
                column(ItemVariant_GET__Item_No____Variant_Code__; ItemVariant.Get("Item No.", "Variant Code"))
                {
                }
                column(STRSUBSTNO_Text004_Location_TABLECAPTION_Location_Code_Location_Name_; StrSubstNo(Text004, Location.TableCaption, Location.Code, Location.Name))
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
                column(STRSUBSTNO_Text005_Location_TABLECAPTION__Location_Code__Location_Name_; StrSubstNo(Text005, Location.TableCaption, "Location Code", Location.Name))
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
                column(STRSUBSTNO_Text005_Location_TABLECAPTION__Location_Code__Text008_; StrSubstNo(Text005, Location.TableCaption, "Location Code", Text008))
                {
                }
                column(STRSUBSTNO_Text005_ItemVariant_TABLECAPTION__Variant_Code__ItemVariant_Description_; StrSubstNo(Text005, ItemVariant.TableCaption, "Variant Code", ItemVariant.Description))
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
                column(STRSUBSTNO_Text005_ItemVariant_TABLECAPTION__Variant_Code__Text007_; StrSubstNo(Text005, ItemVariant.TableCaption, "Variant Code", Text007))
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
                    SetRange("Posting Date", 0D, AsOfDate);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if not InvPostingGroup.Get("Inventory Posting Group") then
                    Clear(InvPostingGroup);
            end;

            trigger OnPreDataItem()
            begin
                //  CurrReport.CreateTotals(RemainingQty, InventoryValue);
                SetRange("Date Filter", 0D, AsOfDate);
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
                    field(AsOfDate; AsOfDate)
                    {
                        ApplicationArea = Basic;
                        Caption = 'As Of Date';
                    }
                    field(ShowVariants; ShowVariants)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Breakdown by Variants';
                    }
                    field(BreakdownByLocation; ShowLocations)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Breakdown by Location';
                    }
                    field(UseAdditionalReportingCurrency; ShowACY)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Use Additional Reporting Currency';
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

        if AsOfDate = 0D then
            Error(Text000);
        if ShowLocations and not ShowVariants then
            if not "Item Ledger Entry".SetCurrentkey("Item No.", "Location Code") then
                Error(Text001,
                  "Item Ledger Entry".TableCaption,
                  "Item Ledger Entry".FieldCaption("Item No."),
                  "Item Ledger Entry".FieldCaption("Location Code"));
        if Item.GetFilter("Date Filter") <> '' then
            Error(Text002, Item.FieldCaption("Date Filter"), Item.TableCaption);

        CompanyInformation.Get;
        ItemFilter := Item.GetFilters;
        ShowFootnote := false;
        GLSetup.Get;
        if GLSetup."Additional Reporting Currency" = '' then
            ShowACY := false
        else begin
            Currency.Get(GLSetup."Additional Reporting Currency");
            Currency.TestField("Amount Rounding Precision");
            Currency.TestField("Unit-Amount Rounding Precision");
        end;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        CompanyInformation: Record "Company Information";
        InvPostingGroup: Record "Inventory Posting Group";
        Currency: Record Currency;
        Location: Record Location;
        ItemVariant: Record "Item Variant";
        ItemFilter: Text[250];
        InventoryValue: Decimal;
        UnitCost: Decimal;
        ShowFootnote: Boolean;
        ShowVariants: Boolean;
        ShowLocations: Boolean;
        ShowACY: Boolean;
        AsOfDate: Date;
        RemainingQty: Decimal;
        Text000: label 'You must enter an As Of Date.';
        Text001: label 'If you want to show Locations without also showing Variants, you must add a new key to the %1 table which starts with the %2 and %3 fields.';
        Text002: label 'Do not set a %1 on the %2.  Use the As Of Date on the Option tab instead.';
        Text003: label 'Quantities and Values As Of %1';
        Text004: label '%1 %2 (%3)';
        Text005: label '%1 %2 (%3) Total';
        Text006: label 'All Inventory Values are shown in %1.';
        Text007: label 'No Variant';
        Text008: label 'No Location';
        Grouping: Boolean;
        Inventory_ValuationCaptionLbl: label 'Inventory Valuation';
        CurrReport_PAGENOCaptionLbl: label 'Page';
        InventoryValue_Control34CaptionLbl: label 'Inventory Value';
        DescriptionCaptionLbl: label 'Description';
        UnitCost_Control33CaptionLbl: label 'Unit Cost';
        Total_Inventory_ValueCaptionLbl: label 'Total Inventory Value';

    local procedure AdjustItemLedgEntryToAsOfDate(var ItemLedgEntry: Record "Item Ledger Entry")
    var
        ItemApplnEntry: Record "Item Application Entry";
        ValueEntry: Record "Value Entry";
        ItemLedgEntry2: Record "Item Ledger Entry";
        InvoicedValue: Decimal;
        InvoicedValueACY: Decimal;
        ExpectedValue: Decimal;
        ExpectedValueACY: Decimal;
    begin

        // adjust remaining quantity
        ItemLedgEntry."Remaining Quantity" := ItemLedgEntry.Quantity;
        if ItemLedgEntry.Positive then begin
            ItemApplnEntry.Reset;
            ItemApplnEntry.SetCurrentkey(
              "Inbound Item Entry No.", "Item Ledger Entry No.", "Outbound Item Entry No.", "Cost Application");
            ItemApplnEntry.SetRange("Inbound Item Entry No.", ItemLedgEntry."Entry No.");
            ItemApplnEntry.SetRange("Posting Date", 0D, AsOfDate);
            ItemApplnEntry.SetFilter("Outbound Item Entry No.", '<>%1', 0);
            ItemApplnEntry.SetFilter("Item Ledger Entry No.", '<>%1', ItemLedgEntry."Entry No.");
            if ItemApplnEntry.Find('-') then
                repeat
                    if ItemLedgEntry2.Get(ItemApplnEntry."Item Ledger Entry No.") and
                       (ItemLedgEntry2."Posting Date" <= AsOfDate)
                    then
                        ItemLedgEntry."Remaining Quantity" := ItemLedgEntry."Remaining Quantity" + ItemApplnEntry.Quantity;
                until ItemApplnEntry.Next = 0;
        end else begin
            ItemApplnEntry.Reset;
            ItemApplnEntry.SetCurrentkey(
              "Outbound Item Entry No.", "Item Ledger Entry No.", "Cost Application", "Transferred-from Entry No.");
            ItemApplnEntry.SetRange("Item Ledger Entry No.", ItemLedgEntry."Entry No.");
            ItemApplnEntry.SetRange("Outbound Item Entry No.", ItemLedgEntry."Entry No.");
            ItemApplnEntry.SetRange("Posting Date", 0D, AsOfDate);
            if ItemApplnEntry.Find('-') then
                repeat
                    if ItemLedgEntry2.Get(ItemApplnEntry."Inbound Item Entry No.") and
                       (ItemLedgEntry2."Posting Date" <= AsOfDate)
                    then
                        ItemLedgEntry."Remaining Quantity" := ItemLedgEntry."Remaining Quantity" - ItemApplnEntry.Quantity;
                until ItemApplnEntry.Next = 0;
        end;

        // calculate adjusted cost of entry
        ValueEntry.Reset;
        ValueEntry.SetCurrentkey("Item Ledger Entry No.", "Entry Type");
        ValueEntry.SetRange("Item Ledger Entry No.", ItemLedgEntry."Entry No.");
        ValueEntry.SetRange("Posting Date", 0D, AsOfDate);
        if ValueEntry.Find('-') then
            repeat
                ExpectedValue := ExpectedValue + ValueEntry."Cost Amount (Expected)";
                ExpectedValueACY := ExpectedValueACY + ValueEntry."Cost Amount (Expected) (ACY)";
                InvoicedValue := InvoicedValue + ValueEntry."Cost Amount (Actual)";
                InvoicedValueACY := InvoicedValueACY + ValueEntry."Cost Amount (Actual) (ACY)";
            until ValueEntry.Next = 0;
        ItemLedgEntry."Cost Amount (Actual)" := ROUND(InvoicedValue + ExpectedValue);
        ItemLedgEntry."Cost Amount (Actual) (ACY)" := ROUND(InvoicedValueACY + ExpectedValueACY, Currency."Amount Rounding Precision");

    end;
}

