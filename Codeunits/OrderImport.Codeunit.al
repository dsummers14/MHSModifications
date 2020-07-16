Codeunit 57009 "Order Import"
{

    trigger OnRun()
    var
        iNavOrder: Text[250];
    begin
         iNavOrder :=  CreateSalesOrder('2C3C2F26-28E2-485D-B405-96D019669D30');
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        SalesTaxMgt: Codeunit "Sales Tax Calculate";
        FoodItems: Boolean;
        TestMode: Boolean;
        SLCreated: Integer;
        vDirective: label 'CHECKOUT';
        Trace: Codeunit InsightTrace;

        procedure CreateSalesOrder(pGuid: Text[80]) iNavOrderNo: Text[250]
    var
        Cust: Record Customer;
        InSalesHeader: Record InsightOrderHeaderView;
        InSalesLine: Record InsightOrderLineView;
        TempSalesCommentLine: Record "Sales Comment Line" temporary;
        TmpSalesHeader: Record "Sales Header" temporary;
        TmpSalesLine: Record "Sales Line" temporary;
        TmpSalesCommentLine: Record "Sales Comment Line";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesCommentLine: Record "Sales Comment Line";
        SalesCalcDisc: Codeunit "Sales-Calc. Discount";
        WebSiteCode: Code[20];
        Amounts: array [5] of Decimal;
        iOrderGuid: Guid;
        itext: Text[50];
        ReleaseSalesDocument: Codeunit "Release Sales Document";
        EnableCalcInvDisc: Boolean;
    begin
        FoodItems := false;
        EnableCalcInvDisc := true;
        iOrderGuid :=pGuid;

        if not InSalesHeader.Get(iOrderGuid) then
        begin
         // Trace.WriteResponse(pGuid,vDirective,FALSE,'Could not find order record');
          exit;
        end;

        if not Cust.Get(InSalesHeader.CustomerNo) then
        begin
         // Trace.WriteResponse(pGuid,vDirective,FALSE,'Could not find customer record');
          exit;
        end;

        if Cust.Blocked <> Cust.Blocked::" " then
        begin
         // Trace.WriteResponse(pGuid,vDirective,FALSE,'Customer Blocked');
          exit;
        end;

        if not CreateSalesHeader(InSalesHeader,SalesHeader,SalesLine,SalesHeader."document type"::Order) then
        begin
         // Trace.WriteResponse(pGuid,vDirective,FALSE,'Could not create sales header record');
          exit;
        end;

        if not CreateSalesLines(InSalesLine,SalesHeader,SalesLine,EnableCalcInvDisc,Amounts,iOrderGuid) then
        begin
         // Trace.WriteResponse(pGuid,vDirective,FALSE,'Could not create sales line records');
          SalesHeader.Delete;
          exit;
        end;

        // iCepts BRB 06.11.07 - Only Update/Release if Sales Lines
        if SLCreated > 0 then begin
            ReleaseSalesDocument.Run(SalesHeader);

          if InSalesHeader.NotUsed5 <> '' then
             CreateQuoteCommentLines(InSalesHeader.NotUsed5,SalesHeader,SalesCommentLine);
        end;

        if FoodItems then
        begin
          // iCepts BRB 06.11.07 - If only food items, use Header created above
          if SLCreated > 0 then begin
              if not CreateSalesHeader(InSalesHeader,SalesHeader,SalesLine,SalesHeader."document type"::Order) then
            begin
           //    Trace.WriteResponse(pGuid,vDirective,FALSE,'Could not create sales header record');
               exit;
            end;
          end;

          if not CreateSalesLines(InSalesLine,SalesHeader,SalesLine,EnableCalcInvDisc,Amounts,iOrderGuid) then
          begin
            SalesHeader.Delete;
           // Trace.WriteResponse(pGuid,vDirective,FALSE,'Could not create sales line records');
            exit;
          end;
          // iCepts BRB 06.11.07 - Make sure Header is flagged as Food Order
          SalesHeader."Allocated Type" := 1;
          SalesHeader.Modify;
          ReleaseSalesDocument.Run(SalesHeader);
          //trace.writetrace(pComments);

          if InSalesHeader.NotUsed5 <> '' then
               CreateQuoteCommentLines(InSalesHeader.NotUsed5,SalesHeader,SalesCommentLine);
              // Trace.WriteResponse(pGuid,vDirective,TRUE,SalesHeader."No.");
        end;


        iNavOrderNo :=  SalesHeader."No.";

        //Delete Cart
        InSalesHeader.Reset;
        InSalesHeader.SetRange(CommerceId,pGuid);
        InSalesHeader.DeleteAll;

        InSalesLine.Reset;
        InSalesLine.SetRange(CommerceId,pGuid);
        InSalesLine.DeleteAll;
    end;

        procedure CreateSalesHeader(var InSalesHeader: Record InsightOrderHeaderView temporary;var SalesHeader: Record "Sales Header";var SalesLine: Record "Sales Line";DocumentType: Option Quote,"Order") ReturnValue: Boolean
    var
        Customer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        TempCustNo: Code[20];
    begin
        ReturnValue := false;
        SalesLine.LockTable;
        SalesHeader.LockTable;
        Clear(SalesHeader);

        SalesHeader.SetHideValidationDialog(true);
        SalesHeader."Document Type" := DocumentType;

        SalesSetup.Get;
        NoSeriesMgt.InitSeries(SalesSetup."Order Nos.",SalesSetup."Order Nos.",
        SalesHeader."Posting Date",SalesHeader."No.",SalesHeader."No. Series");

        SHInitRecord(SalesHeader);
        SalesHeader.Insert;

        TempCustNo := InSalesHeader.CustomerNo;

        if not Customer.Get(TempCustNo) then
          exit(false);

        if Customer."Bill-to Customer No." <> '' then
        begin
          TempCustNo := Customer."Bill-to Customer No.";
          if not Customer.Get(TempCustNo) then
             exit(false);
        end;

        SalesHeader.Validate("Sell-to Customer No.",TempCustNo);
        //SalesHeader."CP Status" := SalesHeader."CP Status"::"Requested by Customer";
        //SalesHeader."Auto Created" := TRUE;
        SalesHeader.Validate("Posting Date",WorkDate);
        SalesHeader.Validate("Order Date",WorkDate);
        SalesHeader.Validate("Document Date",WorkDate);
        SalesHeader.Validate("Shipment Date",WorkDate);
        //SalesHeader.VALIDATE("Login ID",InSalesHeader.CreatedBy);
        //SalesHeader.VALIDATE("Expiration Date",CALCDATE(WebSite."Quote Expiration Calc.",SalesHeader."Document Date"));
        SalesHeader.Status := SalesHeader.Status::Open;

        //IF InSalesHeader."Sell-to Contact" <> '' THEN
        //  SalesHeader.VALIDATE(SalesHeader."Sell-to Contact",InSalesHeader."Sell-to Contact");
        if Customer."No." <> '' then
          SalesHeader.Validate("Bill-to Customer No.",Customer."No.");
        if Customer.Name <> '' then
          SalesHeader.Validate("Bill-to Name",Customer.Name);
        if Customer.Address <> '' then
          SalesHeader.Validate("Bill-to Address",Customer.Address);
        if Customer."Address 2" <> '' then
          SalesHeader.Validate("Bill-to Address 2",Customer."Address 2");
        if Customer.City <> '' then
          SalesHeader.Validate("Bill-to City",Customer.City);
        if Customer."Country/Region Code" <> '' then
          SalesHeader.Validate("Bill-to Country/Region Code",Customer."Country/Region Code");
        if Customer."Post Code" <> '' then
          SalesHeader.Validate("Bill-to Post Code",Customer."Post Code");
        if (InSalesHeader.ShipToNo <> '') and (InSalesHeader.ShipToNo <> 'SAME')
           and (InSalesHeader.ShipToNo <> 'TEMP') then
          SalesHeader.Validate("Ship-to Code",InSalesHeader.ShipToNo);
        if InSalesHeader.TempShipToName <> '' then
          SalesHeader.Validate("Ship-to Name",InSalesHeader.TempShipToName);
        if InSalesHeader.TempShipToAddress1 <> '' then
          SalesHeader.Validate("Ship-to Address",InSalesHeader.TempShipToAddress1);
        if InSalesHeader.TempShipToAddress2 <> '' then
          SalesHeader.Validate("Ship-to Address 2",InSalesHeader.TempShipToAddress2);
        if InSalesHeader.TempShipToCity <> '' then
          SalesHeader.Validate("Ship-to City",InSalesHeader.TempShipToCity);
        if InSalesHeader.TempShipToState <> '' then
          SalesHeader.Validate("Ship-to County",InSalesHeader.TempShipToState);
        if InSalesHeader.TempShipToZip <> '' then
          SalesHeader.Validate("Ship-to Post Code",InSalesHeader.TempShipToZip);
        //IF InSalesHeader."Ship-to Contact" <> '' THEN
        //  SalesHeader."Ship-to Contact" := InSalesHeader."Ship-to Contact";
        if Customer."Shipment Method Code" <> '' then
          SalesHeader.Validate("Shipment Method Code",Customer."Shipment Method Code");
        if InSalesHeader.ShipViaCode <> '' then
          SalesHeader.Validate("Shipping Agent Code",InSalesHeader.ShipViaCode);
        if Customer."Currency Code" <> '' then
          SalesHeader.Validate("Currency Code",Customer."Currency Code");
        //SalesHeader."Web Site Code" := WebSite.Code;
        if InSalesHeader.RefNo <> '' then
          SalesHeader.Validate("External Document No.",InSalesHeader.RefNo);
        if not Customer.Allocation then SalesHeader."Allocated Type" := 0
        else
        if FoodItems then  SalesHeader."Allocated Type" := 1
        else
         SalesHeader."Allocated Type" := 2;

        SalesHeader.Modify;

        ReturnValue := true;
    end;

        procedure CreateSalesLines(var InSalesLine: Record InsightOrderLineView temporary;var SalesHeader: Record "Sales Header";var SalesLine: Record "Sales Line";EnableCalcInvDisc: Boolean;var Amounts: array [5] of Decimal;pGuid: Guid) ReturnValue: Boolean
    var
        AmountSalesHeader: Record "Sales Header" temporary;
        AmountSalesLine: Record "Sales Line" temporary;
        TempVATAmountLine0: Record "VAT Amount Line" temporary;
        TempVATAmountLine1: Record "VAT Amount Line" temporary;
        Item: Record Item;
        SalesCalcDisc: Codeunit "Sales-Calc. Discount";
        i: Integer;
        AmountInclVAT: Decimal;
        InvDiscAmount: Decimal;
        CustAmount: Decimal;
        AmountSalesline2: Record "Sales Line" temporary;
        FoundFoodItem: Boolean;
        iRequestDate: Date;
    begin
        ReturnValue := false;
        FoundFoodItem := false;

        //Trace.WriteTrace('StartsalesLines');

        SalesLine.SetHideValidationDialog(true);

        SalesLine.Reset;
        SalesLine.SetRange("Document Type",SalesHeader."Document Type");
        SalesLine.SetRange("Document No.",SalesHeader."No.");
        SalesLine.DeleteAll;

        SalesLine.SetSalesHeader(SalesHeader);

        InSalesLine.Reset;
        InSalesLine.SetRange(CommerceId,pGuid);

        if InSalesLine.Find('-') then
        repeat
          if (InSalesLine.ItemNo <> '') and Item.Get(InSalesLine.ItemNo) and not(Item.Blocked) then
          begin
            iRequestDate :=InSalesLine.RequestedDeliveryDate;
            if iRequestDate < WorkDate then
              iRequestDate := WorkDate;

            if Item.FoodItem = FoodItems then
            begin
              SalesLine.Init;
              SalesLine."Line No." := SalesLine."Line No." + 10000;
              SalesLine."Document Type" := SalesHeader."Document Type";
              SalesLine."Document No." := SalesHeader."No.";
              SalesLine.Type := SalesLine.Type::Item;
              SalesLine.Validate(Type);
              SalesLine.Validate("No.",InSalesLine.ItemNo);
              SalesLine.Validate("Line Discount %",InSalesLine.DiscPct);
              SalesLine.Validate(Quantity,InSalesLine.OrigOrderAmt);
              SalesLine.Validate("Requested Delivery Date",iRequestDate);
              SalesLine.Insert;
              SLCreated += 1; // iCepts BRB 06.11.07 - Keep track if all Food Items
            end
              else
                FoundFoodItem := true;

            ReturnValue := true;
          end
        until InSalesLine.Next = 0;

        SalesSetup.Get;
        if EnableCalcInvDisc then
          if SalesSetup."Calc. Inv. Discount" then
            if SalesLine.Find then begin
              Clear(SalesCalcDisc);
              SalesCalcDisc.CalculateWithSalesHeader(SalesHeader,SalesLine);
              SalesHeader.Get(SalesHeader."Document Type",SalesHeader."No.");
              SalesLine.Reset;
            end;

        SalesLine.Reset;
        SalesLine.SetRange("Document Type",SalesHeader."Document Type");
        SalesLine.SetRange("Document No.",SalesHeader."No.");

        //AmountSalesHeader := SalesHeader;
        //AmountSalesHeader.INSERT;
        //AmountSalesHeader.Status := AmountSalesHeader.Status::Released;

        if SalesLine.Find('-') then
          repeat
            AmountSalesLine := SalesLine;
            AmountSalesLine.Insert;
          until SalesLine.Next = 0;

        AmountSalesHeader := SalesHeader;
        AmountSalesHeader.Insert;
        AmountSalesHeader.Status := AmountSalesHeader.Status::Released;

        if SalesHeader."Tax Area Code" = '' then begin   //VAT
          if SalesHeader.Status = SalesHeader.Status::Open then begin
            AmountSalesLine.SetSalesHeader(AmountSalesHeader);
            AmountSalesLine.CalcVATAmountLines(0,AmountSalesHeader,AmountSalesLine,TempVATAmountLine0);
            AmountSalesLine.CalcVATAmountLines(1,AmountSalesHeader,AmountSalesLine,TempVATAmountLine1);
            AmountSalesLine.UpdateVATOnLines(0,AmountSalesHeader,AmountSalesLine,TempVATAmountLine0);
            AmountSalesLine.UpdateVATOnLines(1,AmountSalesHeader,AmountSalesLine,TempVATAmountLine1);
          end;
        end else begin   // Sales Tax
          AmountSalesLine.SetSalesHeader(AmountSalesHeader);
          SalesTaxMgt.StartSalesTaxCalculation;
          SalesTaxMgt.ReadTempSalesHeader(AmountSalesHeader);
          with AmountSalesLine do begin
            SetRange("Document Type",AmountSalesHeader."Document Type");
            SetRange("Document No.",AmountSalesHeader."No.");
            if Find('-') then
              repeat
                if AmountSalesLine.Type <> 0 then
                  SalesTaxMgt.AddSalesLine(AmountSalesLine);
              until Next = 0;
          end;
          SalesTaxMgt.EndSalesTaxCalculation(AmountSalesHeader."Posting Date");
          AmountSalesline2.CopyFilters(AmountSalesLine);
          SalesTaxMgt.DistTaxOverSalesLines(AmountSalesLine);
          AmountSalesLine.CopyFilters(AmountSalesline2);
        end;

        if AmountSalesLine.Find('-') then
          repeat
            CustAmount := CustAmount + AmountSalesLine.Amount;
            AmountInclVAT := AmountInclVAT + AmountSalesLine."Amount Including VAT";
            InvDiscAmount := InvDiscAmount + AmountSalesLine."Inv. Discount Amount";
          until AmountSalesLine.Next = 0;

        Amounts[1] := CustAmount + InvDiscAmount;
        Amounts[2] := InvDiscAmount;
        Amounts[3] := CustAmount;
        Amounts[4] := AmountInclVAT - CustAmount;
        Amounts[5] := AmountInclVAT;
        FoodItems := FoundFoodItem;

        //Trace.WriteTrace('EndSaleLinesCreate');
    end;

        procedure CreateQuoteCommentLines(var pComments: Text[250];var SalesHeader: Record "Sales Header";var SalesCommentLine: Record "Sales Comment Line")
    var
        NextLineNo: Integer;
        iText: Text[250];
        iStr: Text[1];
        iPos: Integer;
    begin
        SalesCommentLine.Reset;
        SalesCommentLine.SetRange("Document Type",SalesHeader."Document Type");
        SalesCommentLine.SetRange("No.",SalesHeader."No.");
        SalesCommentLine.DeleteAll;

        // | is line seperator, split into comment lines
        iStr := '|';

        //Strip trailing spaces as it's coming in padded to 250
        iPos := StrLen(pComments);
        repeat
          if CopyStr(pComments,iPos,1) = ' ' then
             pComments := CopyStr(pComments,1,iPos - 1)
          else
             iPos := 1;
          iPos := iPos - 1;
        until iPos = 0;

        if StrLen(pComments) > 0 then
        begin
          if StrLen(pComments) >= 248 then
               pComments := CopyStr(pComments,1,248);
          pComments := pComments + iStr + iStr; // Add two cr's to end for stop
          NextLineNo := 0;
          repeat
            iPos := StrPos(pComments,iStr);
            if iPos > 80 then
            begin
              iText := CopyStr(pComments,1,80);
              pComments := CopyStr(pComments,81);
            end else
            begin
              iText := CopyStr(pComments,1,iPos - 1);
              pComments := CopyStr(pComments,iPos + 1);
            end;
            if StrLen(iText) > 0 then
            begin
              SalesCommentLine.Init;
              NextLineNo := NextLineNo + 10000;
              SalesCommentLine."Line No." := NextLineNo;
              SalesCommentLine."Document Type" := SalesHeader."Document Type";
              SalesCommentLine."No." := SalesHeader."No.";
              SalesCommentLine.Comment := iText;
              SalesCommentLine.Date := WorkDate;
              SalesCommentLine.Insert;
            end;
          until (StrPos(pComments,iStr) = 0) or (StrLen(pComments) <= 1)  ;
        end;
    end;

        procedure SHInitRecord(var SalesHeader: Record "Sales Header")
    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserMgt: Codeunit "User Setup Management";
        Cust: Record Customer;
        GLSetup: Record "General Ledger Setup";
        InvtSetup: Record "Inventory Setup";
    begin
        // iCepts BRB 06.11.07 - Update No. Series for Header
        with SalesHeader do begin
          case "Document Type" of
            "document type"::Quote,"document type"::Order:
              begin
                NoSeriesMgt.SetDefaultSeries("Posting No. Series",SalesSetup."Posted Invoice Nos.");
                NoSeriesMgt.SetDefaultSeries("Shipping No. Series",SalesSetup."Posted Shipment Nos.");
              end;
            "document type"::Invoice:
              begin
                if ("No. Series" <> '') and
                   (SalesSetup."Invoice Nos." = SalesSetup."Posted Invoice Nos.")
                then
                  "Posting No. Series" := "No. Series"
                else
                  NoSeriesMgt.SetDefaultSeries("Posting No. Series",SalesSetup."Posted Invoice Nos.");
                if SalesSetup."Shipment on Invoice" then
                  NoSeriesMgt.SetDefaultSeries("Shipping No. Series",SalesSetup."Posted Shipment Nos.");
              end;
            "document type"::"Return Order":
              begin
                NoSeriesMgt.SetDefaultSeries("Posting No. Series",SalesSetup."Posted Credit Memo Nos.");
                NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series",SalesSetup."Posted Return Receipt Nos.");
              end;
            "document type"::"Credit Memo":
              begin
                if ("No. Series" <> '') and
                   (SalesSetup."Credit Memo Nos." = SalesSetup."Posted Credit Memo Nos.")
                then
                  "Posting No. Series" := "No. Series"
                else
                  NoSeriesMgt.SetDefaultSeries("Posting No. Series",SalesSetup."Posted Credit Memo Nos.");
                if SalesSetup."Return Receipt on Credit Memo" then
                  NoSeriesMgt.SetDefaultSeries("Return Receipt No. Series",SalesSetup."Posted Return Receipt Nos.");
              end;
          end;

          if "Document Type" in ["document type"::Order,"document type"::Invoice,"document type"::Quote] then
            begin
              "Shipment Date" := WorkDate;
              "Order Date" := WorkDate;
            end;
          if "Document Type" = "document type"::"Return Order" then
            "Order Date":= WorkDate;

          if not ("Document Type" in ["document type"::"Blanket Order","document type"::Quote]) and
             ("Posting Date" = 0D)
          then
            "Posting Date" := WorkDate;
          "Document Date" := WorkDate;

          Validate("Location Code",UserMgt.GetLocation(0,Cust."Location Code","Responsibility Center"));

          if "Document Type" in ["document type"::"Return Order","document type"::"Credit Memo"] then begin
            GLSetup.Get;
            Correction := GLSetup."Mark Cr. Memos as Corrections";
          end;

          "Posting Description" := Format("Document Type") + ' ' + "No.";

          Reserve := Reserve::Optional;

          if InvtSetup.Get then
            Validate("Outbound Whse. Handling Time",InvtSetup."Outbound Whse. Handling Time");
          "Responsibility Center" := UserMgt.GetRespCenter(0,"Responsibility Center");
        end;
    end;

        procedure SetTestMode()
    begin
        TestMode := true;
    end;
}

