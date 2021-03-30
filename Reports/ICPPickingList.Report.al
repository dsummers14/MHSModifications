Report 50148 "ICPPickingList"
{
    // // iCepts dxd 09.24.13 - RFM5488 Sort by Location Bin MHS1.00               iCepts1.00
    DefaultLayout = RDLC;
    RDLCLayout = './ReportLayouts/PickingList.rdlc';

    Caption = 'Picking List';
    UsageCategory = Documents;

    dataset
    {
        dataitem("Warehouse Activity Header"; "Warehouse Activity Header")
        {
            DataItemTableView = sorting(Type, "No.") where(Type = filter(Pick | "Invt. Pick"));
            RequestFilterFields = "No.", "No. Printed";
            column(ReportForNavId_9684; 9684)
            {
            }
            column(No_WhseActivHeader; "No.")
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = sorting(Number) where(Number = const(1));
                column(ReportForNavId_5444; 5444)
                {
                }
                column(CompanyName; COMPANYNAME)
                {
                }
                column(TodayFormatted; Format(Today, 0, 4))
                {
                }
                column(Time; Time)
                {
                }
                column(PickFilter; PickFilter)
                {
                }
                column(DirectedPutAwayAndPick; Location."Directed Put-away and Pick")
                {
                }
                column(BinMandatory; Location."Bin Mandatory")
                {
                }
                column(InvtPick; InvtPick)
                {
                }
                column(ShowLotSN; ShowLotSN)
                {
                }
                column(SumUpLines; vSumUpLines)
                {
                }
                column(No_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("No."))
                {
                }
                column(WhseActivHeaderCaption; "Warehouse Activity Header".TableCaption + ': ' + PickFilter)
                {
                }
                column(LoctnCode_WhseActivHeader; "Warehouse Activity Header"."Location Code")
                {
                }
                column(SortingMtd_WhseActivHeader; "Warehouse Activity Header"."Sorting Method")
                {
                }
                column(AssgUserID_WhseActivHeader; "Warehouse Activity Header"."Assigned User ID")
                {
                }
                column(SourcDocument_WhseActLine; "Warehouse Activity Line"."Source Document")
                {
                }
                column(LoctnCode_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("Location Code"))
                {
                }
                column(SortingMtd_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("Sorting Method"))
                {
                }
                column(AssgUserID_WhseActivHeaderCaption; "Warehouse Activity Header".FieldCaption("Assigned User ID"))
                {
                }
                column(SourcDocument_WhseActLineCaption; "Warehouse Activity Line".FieldCaption("Source Document"))
                {
                }
                column(SourceNo_WhseActLineCaption; WhseActLine.FieldCaption("Source No."))
                {
                }
                column(ShelfNo_WhseActLineCaption; WhseActLine.FieldCaption("Shelf No."))
                {
                }
                column(VariantCode_WhseActLineCaption; WhseActLine.FieldCaption("Variant Code"))
                {
                }
                column(Description_WhseActLineCaption; WhseActLine.FieldCaption(Description))
                {
                }
                column(ItemNo_WhseActLineCaption; WhseActLine.FieldCaption("Item No."))
                {
                }
                column(UOMCode_WhseActLineCaption; WhseActLine.FieldCaption("Unit of Measure Code"))
                {
                }
                column(QtytoHandle_WhseActLineCaption; WhseActLine.FieldCaption("Qty. to Handle"))
                {
                }
                column(QtyBase_WhseActLineCaption; WhseActLine.FieldCaption("Qty. (Base)"))
                {
                }
                column(DestinatnType_WhseActLineCaption; WhseActLine.FieldCaption("Destination Type"))
                {
                }
                column(DestinationNo_WhseActLineCaption; WhseActLine.FieldCaption("Destination No."))
                {
                }
                column(ZoneCode_WhseActLineCaption; WhseActLine.FieldCaption("Zone Code"))
                {
                }
                column(BinCode_WhseActLineCaption; WhseActLine.FieldCaption("Bin Code"))
                {
                }
                column(ActionType_WhseActLineCaption; WhseActLine.FieldCaption("Action Type"))
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                column(PickingListCaption; PickingListCaptionLbl)
                {
                }
                column(WhseActLineDueDateCaption; WhseActLineDueDateCaptionLbl)
                {
                }
                column(QtyHandledCaption; QtyHandledCaptionLbl)
                {
                }
                dataitem("Warehouse Activity Line"; "Warehouse Activity Line")
                {
                    DataItemLink = "Activity Type" = field(Type), "No." = field("No.");
                    DataItemLinkReference = "Warehouse Activity Header";
                    DataItemTableView = sorting("Activity Type", "No.", "Location Code", "Bin Code");
                    column(ReportForNavId_6441; 6441)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if vSumUpLines and
                           ("Warehouse Activity Header"."Sorting Method" <>
                            "Warehouse Activity Header"."sorting method"::Document)
                        then begin
                            if TempWarehouseActivityLine."No." = '' then begin
                                TempWarehouseActivityLine := "Warehouse Activity Line";
                                TempWarehouseActivityLine.Insert();
                                Mark(true);
                            end else begin
                                TempWarehouseActivityLine.SetCurrentkey("Activity Type", "No.", "Bin Code", "Breakbulk No.", "Action Type");
                                TempWarehouseActivityLine.SetRange("Activity Type", "Activity Type");
                                TempWarehouseActivityLine.SetRange("No.", "No.");
                                TempWarehouseActivityLine.SetRange("Bin Code", "Bin Code");
                                TempWarehouseActivityLine.SetRange("Item No.", "Item No.");
                                TempWarehouseActivityLine.SetRange("Action Type", "Action Type");
                                TempWarehouseActivityLine.SetRange("Variant Code", "Variant Code");
                                TempWarehouseActivityLine.SetRange("Unit of Measure Code", "Unit of Measure Code");
                                TempWarehouseActivityLine.SetRange("Due Date", "Due Date");
                                if "Warehouse Activity Header"."Sorting Method" =
                                   "Warehouse Activity Header"."sorting method"::"Ship-To"
                                then begin
                                    TempWarehouseActivityLine.SetRange("Destination Type", "Destination Type");
                                    TempWarehouseActivityLine.SetRange("Destination No.", "Destination No.")
                                end;
                                if TempWarehouseActivityLine.FindFirst() then begin
                                    TempWarehouseActivityLine."Qty. (Base)" := TempWarehouseActivityLine."Qty. (Base)" + "Qty. (Base)";
                                    TempWarehouseActivityLine."Qty. to Handle" := TempWarehouseActivityLine."Qty. to Handle" + "Qty. to Handle";
                                    TempWarehouseActivityLine."Source No." := '';
                                    if "Warehouse Activity Header"."Sorting Method" <>
                                       "Warehouse Activity Header"."sorting method"::"Ship-To"
                                    then begin
                                        TempWarehouseActivityLine."Destination Type" := TempWarehouseActivityLine."destination type"::" ";
                                        TempWarehouseActivityLine."Destination No." := '';
                                    end;
                                    TempWarehouseActivityLine.Modify();
                                end else begin
                                    TempWarehouseActivityLine := "Warehouse Activity Line";
                                    TempWarehouseActivityLine.Insert();
                                    Mark(true);
                                end;
                            end;
                        end else
                            Mark(true);
                    end;

                    trigger OnPostDataItem()
                    begin
                        MarkedOnly(true);
                    end;

                    trigger OnPreDataItem()
                    begin
                        TempWarehouseActivityLine.SetRange("Activity Type", "Warehouse Activity Header".Type);
                        TempWarehouseActivityLine.SetRange("No.", "Warehouse Activity Header"."No.");
                        TempWarehouseActivityLine.DeleteAll();
                        if BreakbulkFilter then
                            TempWarehouseActivityLine.SetRange("Original Breakbulk", false);
                        Clear(TempWarehouseActivityLine);
                    end;
                }
                dataitem(WhseActLine; "Warehouse Activity Line")
                {
                    DataItemLink = "Activity Type" = field(Type), "No." = field("No.");
                    DataItemLinkReference = "Warehouse Activity Header";
                    DataItemTableView = sorting("Activity Type", "No.", "Location Code", "Bin Code");
                    column(ReportForNavId_5832; 5832)
                    {
                    }
                    column(SourceNo_WhseActLine; "Source No.")
                    {
                    }
                    column(FormatSourcDocument_WhseActLine; Format("Source Document"))
                    {
                    }
                    column(ShelfNo_WhseActLine; "Shelf No.")
                    {
                    }
                    column(ItemNo_WhseActLine; "Item No.")
                    {
                    }
                    column(Description_WhseActLine; Description)
                    {
                    }
                    column(VariantCode_WhseActLine; "Variant Code")
                    {
                    }
                    column(UOMCode_WhseActLine; "Unit of Measure Code")
                    {
                    }
                    column(DueDate_WhseActLine; Format("Due Date"))
                    {
                    }
                    column(QtytoHandle_WhseActLine; "Qty. to Handle")
                    {
                    }
                    column(QtyBase_WhseActLine; "Qty. (Base)")
                    {
                    }
                    column(DestinatnType_WhseActLine; "Destination Type")
                    {
                    }
                    column(DestinationNo_WhseActLine; "Destination No.")
                    {
                    }
                    column(ZoneCode_WhseActLine; "Zone Code")
                    {
                    }
                    column(BinCode_WhseActLine; "Bin Code")
                    {
                    }
                    column(ActionType_WhseActLine; "Action Type")
                    {
                    }
                    column(LotNo_WhseActLine; "Lot No.")
                    {
                    }
                    column(SerialNo_WhseActLine; "Serial No.")
                    {
                    }
                    column(LotNo_WhseActLineCaption; FieldCaption("Lot No."))
                    {
                    }
                    column(SerialNo_WhseActLineCaption; FieldCaption("Serial No."))
                    {
                    }
                    column(LineNo_WhseActLine; "Line No.")
                    {
                    }
                    column(BinRanking_WhseActLine; "Bin Ranking")
                    {
                    }
                    column(EmptyStringCaption; EmptyStringCaptionLbl)
                    {
                    }
                    dataitem(WhseActLine2; "Warehouse Activity Line")
                    {
                        DataItemLink = "Activity Type" = field("Activity Type"), "No." = field("No."), "Bin Code" = field("Bin Code"), "Item No." = field("Item No."), "Action Type" = field("Action Type"), "Variant Code" = field("Variant Code"), "Unit of Measure Code" = field("Unit of Measure Code"), "Due Date" = field("Due Date");
                        DataItemLinkReference = WhseActLine;
                        DataItemTableView = sorting("Activity Type", "No.", "Bin Code", "Breakbulk No.", "Action Type");
                        column(ReportForNavId_4019; 4019)
                        {
                        }
                        column(LotNo_WhseActLine2; "Lot No.")
                        {
                        }
                        column(SerialNo_WhseActLine2; "Serial No.")
                        {
                        }
                        column(QtyBase_WhseActLine2; "Qty. (Base)")
                        {
                        }
                        column(QtytoHandle_WhseActLine2; "Qty. to Handle")
                        {
                        }
                        column(LineNo_WhseActLine2; "Line No.")
                        {
                        }
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if vSumUpLines then begin
                            TempWarehouseActivityLine.Get("Activity Type", "No.", "Line No.");
                            "Qty. (Base)" := TempWarehouseActivityLine."Qty. (Base)";
                            "Qty. to Handle" := TempWarehouseActivityLine."Qty. to Handle";
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        Copy("Warehouse Activity Line");
                        Counter := Count;
                        if Counter = 0 then
                            CurrReport.Break();

                        if BreakbulkFilter then
                            SetRange("Original Breakbulk", false);
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                GetLocation("Location Code");
                InvtPick := Type = Type::"Invt. Pick";

                if not CurrReport.Preview then
                    WhseCountPrinted.Run("Warehouse Activity Header");
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
                    field(Breakbulk; BreakbulkFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Set Breakbulk Filter';
                        Editable = BreakbulkEditable;
                        ToolTip = 'Tooltip';
                    }
                    field(SumUpLines; vSumUpLines)
                    {
                        ApplicationArea = All;
                        Caption = 'Sum up Lines';
                        Editable = SumUpLinesEditable;
                        ToolTip = 'Tooltip';
                    }
                    field(LotSerialNo; ShowLotSN)
                    {
                        ApplicationArea = All;
                        Caption = 'Show Serial/Lot Number';
                        ToolTip = 'Tooltip';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            SumUpLinesEditable := true;
            BreakbulkEditable := true;
        end;

        trigger OnOpenPage()
        begin
            if HideOptions then begin
                BreakbulkEditable := false;
                SumUpLinesEditable := false;
            end;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        PickFilter := CopyStr("Warehouse Activity Header".GetFilters(), 1, 250);
    end;

    var
        Location: Record Location;
        TempWarehouseActivityLine: Record "Warehouse Activity Line" temporary;
        WhseCountPrinted: Codeunit "Whse.-Printed";
        PickFilter: Text[250];
        BreakbulkFilter: Boolean;
        vSumUpLines: Boolean;
        HideOptions: Boolean;
        InvtPick: Boolean;
        ShowLotSN: Boolean;
        Counter: Integer;
        [InDataSet]
        BreakbulkEditable: Boolean;
        [InDataSet]
        SumUpLinesEditable: Boolean;
        CurrReportPageNoCaptionLbl: label 'Page';
        PickingListCaptionLbl: label 'Picking List';
        WhseActLineDueDateCaptionLbl: label 'Due Date';
        QtyHandledCaptionLbl: label 'Qty. Handled';
        EmptyStringCaptionLbl: label '____________';

    local procedure GetLocation(LocationCode: Code[10])
    begin
        if LocationCode = '' then
            Location.Init()
        else
            if Location.Code <> LocationCode then
                Location.Get(LocationCode);
    end;

    procedure SetBreakbulkFilter(BreakbulkFilter2: Boolean)
    begin
        BreakbulkFilter := BreakbulkFilter2;
    end;

    procedure SetInventory(SetHideOptions: Boolean)
    begin
        HideOptions := SetHideOptions;
    end;
}

