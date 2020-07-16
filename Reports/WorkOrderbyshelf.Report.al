Report 50073 "Work Order by shelf"
{
    // // iCepts BRB 09.24.13dxd - Add Required Filters Allocated Type, Order Date, and item Category Code  iCepts1.00
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/WorkOrderbyshelf.rdlc';

    Caption = 'Work Order';

    dataset
    {
        dataitem("Sales Header";"Sales Header")
        {
            DataItemTableView = sorting("Document Type","No.") where("Document Type"=const(Order));
            RequestFilterFields = "No.","Sell-to Customer No.","Allocated Type","Order Date";
            RequestFilterHeading = 'Sales Order';
            column(ReportForNavId_6640; 6640)
            {
            }
            dataitem(PageLoop;"Integer")
            {
                DataItemTableView = sorting(Number) where(Number=const(1));
                column(ReportForNavId_6455; 6455)
                {
                }
                column(No1_SalesHeader;"Sales Header"."No.")
                {
                }
                column(ShipmentDate_SalesHeader;Format("Sales Header"."Shipment Date"))
                {
                }
                column(CompanyName;COMPANYNAME)
                {
                }
                column(CustAddr1;CustAddr[1])
                {
                }
                column(CustAddr2;CustAddr[2])
                {
                }
                column(CustAddr3;CustAddr[3])
                {
                }
                column(CustAddr4;CustAddr[4])
                {
                }
                column(CustAddr5;CustAddr[5])
                {
                }
                column(CustAddr6;CustAddr[6])
                {
                }
                column(CustAddr7;CustAddr[7])
                {
                }
                column(CustAddr8;CustAddr[8])
                {
                }
                column(ShipmentDateCaption;ShipmentDateCaptionLbl)
                {
                }
                column(SalesOrderNoCaption;SalesOrderNoCaptionLbl)
                {
                }
                column(PageNoCaption;PageNoCaptionLbl)
                {
                }
                column(WorkOrderCaption;WorkOrderCaptionLbl)
                {
                }
                dataitem("Sales Line";"Sales Line")
                {
                    DataItemLink = "Document Type"=field("Document Type"),"Document No."=field("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = sorting("Document Type","Document No.","Line No.");
                    column(ReportForNavId_2844; 2844)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        TempSalesLine.Init;
                        TempSalesLine := "Sales Line";
                        if not ItemR.Get("Sales Line"."No.") then
                          Clear (ItemR);
                        TempSalesLine."Item Category Code" := ItemR."Shelf No.";
                        //MESSAGE('KEY %1 %2 %3 Shelf %4',TempSalesLine."Document Type",TempSalesLine."Document No.",TempSalesLine."Line No.",TempSalesLine."Item Category Code");
                        TempSalesLine.Insert;
                        /*IF PrintToExcel THEN
                          MakeWOLine; */

                    end;

                    trigger OnPreDataItem()
                    begin
                        /*IF PrintToExcel THEN
                          MakeWOLineHeader;*/
                        TempSalesLine.Reset;
                        TempSalesLine.DeleteAll;

                    end;
                }
                dataitem(PrintSalesLine;"Integer")
                {
                    DataItemTableView = sorting(Number);
                    column(ReportForNavId_1000000000; 1000000000)
                    {
                    }
                    column(No_SalesLine;TempSalesLine."No.")
                    {
                        IncludeCaption = true;
                    }
                    column(Description_SalesLine;TempSalesLine.Description)
                    {
                        IncludeCaption = true;
                    }
                    column(Quantity_SalesLine;TempSalesLine.Quantity)
                    {
                        IncludeCaption = true;
                    }
                    column(UnitofMeasure_SalesLine;TempSalesLine."Unit of Measure")
                    {
                        IncludeCaption = true;
                    }
                    column(Type_SalesLine;TempSalesLine.Type)
                    {
                        IncludeCaption = true;
                    }
                    column(ShelfNo_SalesLine;TempSalesLine."Item Category Code")
                    {
                    }
                    column(QtyworkPostSalesOrderCptn;QtyworkPostSalesOrderCptnLbl)
                    {
                    }
                    column(QuantityUsedCaption;QuantityUsedCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaption;UnitofMeasureCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        OnLineNum := OnLineNum + 1;
                        with TempSalesLine do begin
                          if OnLineNum = 1 then
                             Find('-')
                          else
                             Next;
                          Message('Doc %1 Shelf %2',TempSalesLine."Document No.",TempSalesLine."Item Category Code");
                          if PrintToExcel then
                            MakeWOLine;
                        end;
                    end;

                    trigger OnPostDataItem()
                    begin
                        if PrintToExcel and not HasWorkOrderLineRange and not IsEmpty then begin
                          ExcelBuf.EndRange;
                          ExcelBuf.CreateRange('WorkOrderLineRange');
                          HasWorkOrderLineRange := true;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        TempSalesLine.Reset;
                        NoOfLines := TempSalesLine.Count;
                        SetRange(Number,1,NoOfLines);
                        OnLineNum := 0;
                        //MESSAGE('nolines %1',NoOfLines);
                        if PrintToExcel then
                          MakeWOLineHeader;
                    end;
                }
                dataitem("Sales Comment Line";"Sales Comment Line")
                {
                    DataItemLink = "Document Type"=field("Document Type"),"No."=field("No.");
                    DataItemLinkReference = "Sales Header";
                    DataItemTableView = where("Document Line No."=const(0));
                    column(ReportForNavId_8541; 8541)
                    {
                    }
                    column(Date_SalesCommentLine;Format(Date))
                    {
                    }
                    column(Code_SalesCommentLine;Code)
                    {
                        IncludeCaption = true;
                    }
                    column(Comment_SalesCommentLine;Comment)
                    {
                        IncludeCaption = true;
                    }
                    column(CommentsCaption;CommentsCaptionLbl)
                    {
                    }
                    column(SalesCommentLineDtCptn;SalesCommentLineDtCptnLbl)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if PrintToExcel then
                          MakeWOCommentLine;
                    end;

                    trigger OnPostDataItem()
                    begin
                        if PrintToExcel and not HasWorkOrderCommentLineRange and not IsEmpty then begin
                          ExcelBuf.EndRange;
                          ExcelBuf.CreateRange('WorkOrderCommentLineRange');
                          HasWorkOrderCommentLineRange := true;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        if PrintToExcel then
                          MakeWOCommentLineHeader;
                    end;
                }
                dataitem("Extra Lines";"Integer")
                {
                    DataItemTableView = sorting(Number) where(Number=const(1));
                    column(ReportForNavId_2249; 2249)
                    {
                    }
                    column(NoCaption;NoCaptionLbl)
                    {
                    }
                    column(DescriptionCaption;DescriptionCaptionLbl)
                    {
                    }
                    column(QuantityCaption;QuantityCaptionLbl)
                    {
                    }
                    column(UnitofMeasureCaptionControl33;UnitofMeasureCaptionControl33Lbl)
                    {
                    }
                    column(DateCaption;DateCaptionLbl)
                    {
                    }
                    column(workPostdItemorResJnlCptn;workPostdItemorResJnlCptnLbl)
                    {
                    }
                    column(TypeCaption;TypeCaptionLbl)
                    {
                    }

                    trigger OnPostDataItem()
                    begin
                        if PrintToExcel and not HasWorkOrderExtraLineRange and not IsEmpty then begin
                          ExcelBuf.EndRange;
                          ExcelBuf.CreateRange('WorkOrderExtraLineRange');
                          HasWorkOrderExtraLineRange := true;

                          ExcelBuf.NewRow;
                          ExcelBuf.NewRow;
                          ExcelBuf.NewRow;
                          ExcelBuf.NewRow;
                        end;
                    end;

                    trigger OnPreDataItem()
                    begin
                        if PrintToExcel then
                          MakeWOExtraLineHeader;
                    end;
                }
            }

            trigger OnAfterGetRecord()
            begin
                FormatAddr.SalesHeaderBillTo(CustAddr,"Sales Header");

                if PrintToExcel then
                  MakeWOHeader;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PrintToExcel;PrintToExcel)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Print to Excel';
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
        if PrintToExcel then begin
          ExcelBuf.WriteSheet(Text000,COMPANYNAME,UserId);
          ExcelBuf.CloseBook;
          ExcelBuf.OpenExcel;

          if not "Sales Header".IsEmpty then begin
            if not "Sales Line".IsEmpty then
              ExcelBuf.AutoFit('WorkOrderLineRange');
            if not "Sales Line".IsEmpty then
              ExcelBuf.BorderAround('WorkOrderLineRange');
            if not "Sales Comment Line".IsEmpty then
              ExcelBuf.BorderAround('WorkOrderCommentLineRange');
            if not "Sales Line".IsEmpty then
              ExcelBuf.BorderAround('WorkOrderExtraLineRange');
          end;

          ExcelBuf.GiveUserControl;
          Error('');
        end;
    end;

    trigger OnPreReport()
    begin
        if PrintToExcel then
          ExcelBuf.CreateBook(Text000);
    end;

    var
        Text000: label 'Work Order in Shelf No. Order';
        Text001: label 'Sales Order No.';
        Text002: label 'Quantity used during work (Posted with the Sales Order)';
        Text003: label 'Quantity Used';
        Text004: label 'Comments';
        Text005: label 'Extra Item/Resource used during work (Posted with Item or Resource Journals)';
        ExcelBuf: Record "Excel Buffer" temporary;
        FormatAddr: Codeunit "Format Address";
        CustAddr: array [8] of Text[50];
        PrintToExcel: Boolean;
        Text006: label 'Date';
        HasWorkOrderExtraLineRange: Boolean;
        HasWorkOrderCommentLineRange: Boolean;
        HasWorkOrderLineRange: Boolean;
        ShipmentDateCaptionLbl: label 'Shipment Date';
        SalesOrderNoCaptionLbl: label 'Sales Order No.';
        PageNoCaptionLbl: label 'Page';
        WorkOrderCaptionLbl: label 'Work Order';
        QtyworkPostSalesOrderCptnLbl: label 'Quantity used during work (Posted with the Sales Order)';
        QuantityUsedCaptionLbl: label 'Quantity Used';
        UnitofMeasureCaptionLbl: label 'Unit of Measure';
        CommentsCaptionLbl: label 'Comments';
        SalesCommentLineDtCptnLbl: label 'Date';
        NoCaptionLbl: label 'No.';
        DescriptionCaptionLbl: label 'Description';
        QuantityCaptionLbl: label 'Quantity';
        UnitofMeasureCaptionControl33Lbl: label 'Unit of Measure';
        DateCaptionLbl: label 'Date';
        workPostdItemorResJnlCptnLbl: label 'Extra Item/Resource used during work (Posted with Item or Resource Journals)';
        TypeCaptionLbl: label 'Type';
        TempSalesLine: Record "Sales Line" temporary;
        ItemR: Record Item;
        NoOfLines: Integer;
        OnLineNum: Integer;

    local procedure MakeWOHeader()
    begin
        ExcelBuf.NewRow;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[1],false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format(Text001),false,'',true,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Header"."No.",false,'',true,false,false,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[2],false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Header".FieldCaption("Shipment Date"),false,'',false,false,false,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Header"."Shipment Date",false,'',false,false,false,'',ExcelBuf."cell type"::Date);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[3],false,'',false,false,false,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[4],false,'',false,false,false,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[5],false,'',false,false,false,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[6],false,'',false,false,false,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[7],false,'',false,false,false,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(CustAddr[8],false,'',false,false,false,'',ExcelBuf."cell type"::Text);
    end;

    local procedure MakeWOLineHeader()
    begin
        if "Sales Line".IsEmpty then
          exit;

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Format(Text002),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Type),false,'',true,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.StartRange;
        ExcelBuf.AddColumn("Sales Line".FieldCaption("No."),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Description),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Quantity),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Unit of Measure"),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format(Text003),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Unit of Measure"),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
    end;

    local procedure MakeWOLine()
    begin
        if "Sales Line".IsEmpty then
          exit;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Format("Sales Line".Type),false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line"."No.",false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".Description,false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".Quantity,false,'',false,false,true,'',ExcelBuf."cell type"::Number);
        ExcelBuf.AddColumn("Sales Line"."Unit of Measure",false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
    end;

    local procedure MakeWOCommentLineHeader()
    begin
        if "Sales Comment Line".IsEmpty then
          exit;

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Format(Text004),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Comment Line".FieldCaption(Code),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.StartRange;

        ExcelBuf.AddColumn("Sales Comment Line".FieldCaption(Comment),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Comment Line".FieldCaption(Date),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
    end;

    local procedure MakeWOCommentLine()
    begin
        if "Sales Comment Line".IsEmpty then
          exit;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Comment Line".Code,false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Comment Line".Comment,false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Comment Line".Date,false,'',false,false,true,'',ExcelBuf."cell type"::Date);
    end;

    local procedure MakeWOExtraLineHeader()
    begin
        if "Sales Line".IsEmpty then
          exit;

        ExcelBuf.NewRow;
        ExcelBuf.NewRow;

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn(Format(Text005),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Type),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.StartRange;
        ExcelBuf.AddColumn("Sales Line".FieldCaption("No."),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Description),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption(Quantity),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn("Sales Line".FieldCaption("Unit of Measure"),false,'',true,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn(Format(Text006),false,'',true,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);

        ExcelBuf.NewRow;
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
        ExcelBuf.AddColumn('',false,'',false,false,true,'',ExcelBuf."cell type"::Text);
    end;
}

