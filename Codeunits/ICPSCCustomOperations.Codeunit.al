codeunit 50119 ICPSCCustomOperations
{
    TableNo = "SC - Operation";

    trigger OnRun();
    var
        RequestBuff: Record "SC - XML Buffer (dotNET)" temporary;
        ResponseBuff: Record "SC - XML Buffer (dotNET)" temporary;
        Context: Codeunit "SC - Execution Context";
    begin
        Context.GetRequestBuff(RequestBuff);
        Context.GetResponseBuff(ResponseBuff);

        case Rec.Code of
            UPPERCASE('GetDailyMenuList'):
                GetDailyMenuList(RequestBuff, ResponseBuff);
            UPPERCASE('GetMonthlyBudget'):
                GetMonthlyBudget(RequestBuff, ResponseBuff);
        end;
    end;

    local procedure GetDailyMenuList(var RequestBuff: Record "SC - XML Buffer (dotNET)"; var ResponseBuff: Record "SC - XML Buffer (dotNET)")
    var
        Params: Record "SC - Parameters Collection" temporary;
        PublishedMenuHeader: Record PublishedMenuHeader;
        PublishedMenuDetail: Record PublishedMenuDetails;
        DailyMenuBuffer: Record "SC - XML Buffer (dotNET)";
        ProductsBuffer: Record "SC - XML Buffer (dotNET)";
        ProductBuffer: Record "SC - XML Buffer (dotNET)";

    begin
        // Initialize parameters
        Params.InitCustomParameters(RequestBuff);

        PublishedMenuHeader.SetFilter(CustomerNo, Params.ICPCustomerId);

        if PublishedMenuHeader.FindSet() then
            repeat
                ResponseBuff.AddElement(DailyMenuBuffer, 'DailyMenu', '');
                DailyMenuBuffer.AddFieldElement('Id', PublishedMenuHeader.ListName);
                DailyMenuBuffer.AddFieldElement('Description', PublishedMenuHeader.Description);

                DailyMenuBuffer.AddElement(ProductsBuffer, 'Products', '');

                PublishedMenuDetail.Reset();
                PublishedMenuDetail.SetRange(CustomerNo, PublishedMenuHeader.CustomerNo);
                PublishedMenuDetail.SetRange(ListName, PublishedMenuHeader.ListName);
                if PublishedMenuDetail.FindSet() then
                    repeat
                        PublishedMenuDetail.CalcFields("Food Allergen");
                        ProductsBuffer.AddElement(ProductBuffer, 'Product', '');
                        ProductBuffer.AddFieldElement('id', PublishedMenuDetail.ItemNo);
                        ProductBuffer.AddFieldElement('uom', PublishedMenuDetail.UOM);
                        ProductBuffer.AddFieldElement('Allergen', format(PublishedMenuDetail."Food Allergen"));
                        ProductBuffer.AddFieldElement('DeliveryDate', Format(PublishedMenuDetail.RequestDate));
                    until (PublishedMenuDetail.Next() = 0);

            until (PublishedMenuHeader.Next() = 0);

    end;

    local procedure GetMonthlyBudget(var RequestBuff: Record "SC - XML Buffer (dotNET)"; var ResponseBuff: Record "SC - XML Buffer (dotNET)")
    var
        Params: Record "SC - Parameters Collection" temporary;
        CurrentPeriodFoodBudget: Decimal;
        CurrentQuarterNonFoodBudget: Decimal;
        NextPeriodFoodBudget: Decimal;
        NextQuarterNonFoodBudget: Decimal;
        CurrentPeriodStartDate: Date;
        CurrentPeriodEndDate: Date;
        NextPeriodStartDate: Date;
        NextPeriodEndDate: Date;
        CurrentQuarterStartDate: Date;
        CurrentQuarterEndDate: Date;
        NextQuarterStartDate: Date;
        NextQuarterEndDate: Date;
        CurrentPeriodOpenFoodOrderTotal: Decimal;
        CurrentQuarterOpenNonFoodOrderTotal: Decimal;
        NextPeriodOpenFoodOrderTotal: Decimal;
        NextQuarterOpenNonFoodOrderTotal: Decimal;

    begin
        // Initialize parameters
        Params.InitCustomParameters(RequestBuff);

        GetPeriodDates(CurrentPeriodStartDate, CurrentPeriodEndDate, NextPeriodStartDate, NextPeriodEndDate);
        GetQuarterDates(CurrentPeriodStartDate, CurrentQuarterStartDate, CurrentQuarterEndDate, NextQuarterStartDate, NextQuarterEndDate);

        CurrentPeriodOpenFoodOrderTotal := GetOpenOrderTotal(Params.ICPCustomerId, true, CurrentPeriodStartDate, CurrentPeriodEndDate);
        CurrentQuarterOpenNonFoodOrderTotal := GetOpenOrderTotal(Params.ICPCustomerId, false, CurrentQuarterStartDate, CurrentQuarterEndDate);
        NextPeriodOpenFoodOrderTotal := GetOpenOrderTotal(Params.ICPCustomerId, true, NextPeriodStartDate, NextPeriodEndDate);
        NextQuarterOpenNonFoodOrderTotal := GetOpenOrderTotal(Params.ICPCustomerId, false, NextQuarterStartDate, NextQuarterEndDate);

        CurrentPeriodFoodBudget := GetBalance(Params.ICPCustomerId, true, CurrentPeriodStartDate, CurrentPeriodEndDate);
        NextPeriodFoodBudget := GetBalance(Params.ICPCustomerId, true, NextPeriodStartDate, NextPeriodEndDate);
        CurrentQuarterNonFoodBudget := GetBalance(Params.ICPCustomerId, false, CurrentQuarterStartDate, CurrentQuarterEndDate);
        NextQuarterNonFoodBudget := GetBalance(Params.ICPCustomerId, false, NextQuarterStartDate, NextQuarterEndDate);

        ResponseBuff.AddFieldElement('CurrentPeriodFoodBudget', format(CurrentPeriodFoodBudget + CurrentPeriodOpenFoodOrderTotal));
        ResponseBuff.AddFieldElement('NextPeriodFoodBudget', format(NextPeriodFoodBudget + NextPeriodOpenFoodOrderTotal));
        ResponseBuff.AddFieldElement('CurrentPeriodNonFoodBudget', format(CurrentQuarterNonFoodBudget + CurrentQuarterOpenNonFoodOrderTotal));
        ResponseBuff.AddFieldElement('NextPeriodNonFoodBudget', format(NextQuarterNonFoodBudget + NextQuarterOpenNonFoodOrderTotal));
    end;

    procedure GetBalance(CustomerNo: code[20]; Food: Boolean; StartDate: Date; EndDate: Date): Decimal
    var
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        Balance: Decimal;
    begin
        Balance := 0;

        CustomerLedgerEntry.SetRange("Customer No.", CustomerNo);
        CustomerLedgerEntry.SetRange("Posting Date", StartDate, EndDate);
        CustomerLedgerEntry.SetRange(Open, true);
        CustomerLedgerEntry.SetFilter("Date Filter", '>=%1 & <=%2', StartDate, EndDate);

        if Food then
            CustomerLedgerEntry.SetRange("Allocated Type", CustomerLedgerEntry."Allocated Type"::Food)
        else
            CustomerLedgerEntry.SetRange("Allocated Type", CustomerLedgerEntry."Allocated Type"::"Non-Food");

        if CustomerLedgerEntry.FindSet() then
            repeat
                CustomerLedgerEntry.CalcFields(Amount);
                Balance += CustomerLedgerEntry."Amount";
            until (CustomerLedgerEntry.Next() = 0);

        exit(Balance);
    end;

    procedure GetPeriodDates(
          var CurrentPeriodStartDate: Date;
          var CurrentPeriodEndDate: Date;
          var NextPeriodStartDate: Date;
        var NextPeriodEndDate: Date)
    var
        AccountingPeriods: Record "Accounting Period";


    begin
        AccountingPeriods.SetCurrentKey("Starting Date");
        AccountingPeriods.SetRange(Closed, false);
        AccountingPeriods.SetFilter("Starting Date", '<=%1', WorkDate());

        if AccountingPeriods.FindLast() then begin
            CurrentPeriodStartDate := AccountingPeriods."Starting Date";

            AccountingPeriods.Reset();
            AccountingPeriods.SetFilter("Starting Date", '>%1', CurrentPeriodStartDate);
            AccountingPeriods.SetRange(Closed, false);

            if AccountingPeriods.FindFirst() then begin
                NextPeriodStartDate := AccountingPeriods."Starting Date";
                CurrentPeriodEndDate := CalcDate('<-1D>', NextPeriodStartDate);

                AccountingPeriods.Reset();
                AccountingPeriods.SetFilter("Starting Date", '>%1', NextPeriodStartDate);
                AccountingPeriods.SetRange(Closed, false);
                if AccountingPeriods.FindFirst() then
                    NextPeriodEndDate := CalcDate('<-1D>', AccountingPeriods."Starting Date");
            end;


        end;
    end;

    procedure GetQuarterDates(
          CurrentPeriodStartDate: Date;
          var CurrentQuarterStartDate: Date;
          var CurrentQuarterEndDate: Date;
          var NextQuarterStartDate: Date;
        var NextQuarterEndDate: Date)
    var
        AccountingPeriods: Record "Accounting Period";
        QuarterStartDate: array[6] of Date;
        Counter: Integer;

    begin
        AccountingPeriods.Reset();
        AccountingPeriods.SetFilter("Starting Date", '<=%1', CurrentPeriodStartDate);
        AccountingPeriods.SetRange(Closed, false);
        AccountingPeriods.SetRange("New Fiscal Year", true);

        if AccountingPeriods.FindLast() then begin
            QuarterStartDate[1] := AccountingPeriods."Starting Date";
            QuarterStartDate[2] := CalcDate('<+3M>', QuarterStartDate[1]);
            QuarterStartDate[3] := CalcDate('<+3M>', QuarterStartDate[2]);
            QuarterStartDate[4] := CalcDate('<+3M>', QuarterStartDate[3]);
            QuarterStartDate[5] := CalcDate('<+3M>', QuarterStartDate[4]);
            QuarterStartDate[6] := CalcDate('<+3M>', QuarterStartDate[5]);

            for Counter := 1 to 4 do
                if (WorkDate() >= QuarterStartDate[Counter]) and (WorkDate() < QuarterStartDate[Counter + 1]) then begin
                    CurrentQuarterStartDate := QuarterStartDate[Counter];
                    CurrentQuarterEndDate := CalcDate('<-1D>', QuarterStartDate[Counter + 1]);
                    NextQuarterStartDate := QuarterStartDate[Counter + 1];
                    NextQuarterEndDate := CalcDate('<-1D>', QuarterStartDate[Counter + 2]);
                    exit;
                end;
        end;
    end;

    procedure GetOpenOrderTotal(CustomerNo: code[20]; Food: Boolean; StartDate: Date; EndDate: Date): Decimal
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        OpenOrderTotal: Decimal;
    begin
        OpenOrderTotal := 0;
        SalesHeader.SetRange("Sell-to Customer No.", CustomerNo);
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        if Food then
            SalesHeader.SetRange("Allocated Type", SalesHeader."Allocated Type"::Food)
        else
            SalesHeader.SetRange("Allocated Type", SalesHeader."Allocated Type"::"Non-Food");

        if SalesHeader.FindSet() then
            repeat
                SalesLine.Reset();
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange("Requested Delivery Date", StartDate, EndDate);

                if SalesLine.FindSet() then
                    repeat
                        OpenOrderTotal += SalesLine."Outstanding Amount" + SalesLine."Shipped Not Invoiced";
                    until (SalesLine.next() = 0);
            until (SalesHeader.Next() = 0);

        exit(OpenOrderTotal);
    end;
}