codeunit 50118 ICPSCOrderFunctionsHandler
{
    // EventSubscriberInstance = Manual;

    [EventSubscriber(ObjectType::Table, Database::"SC - Parameters Collection", 'OnInitLineFieldValues', '', false, false)]
    local procedure OnInitLineFieldValues(var LineNodeBuff: Record "SC - XML Buffer (dotNET)"; var Params: Record "SC - Parameters Collection")
    var
        TextValue: Text[250];
    begin
        TextValue := copystr(GetFieldValueByNameFromXML(LineNodeBuff, 'DailyMenuId'), 1, 250);
        Params.ICPMenuId := CopyStr(TextValue, 1, 20);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SC - Order/Basket Functions", 'OnBeforeInsertSalesLine', '', true, true)]
    local procedure "SC - Order/Basket Functions_OnBeforeInsertSalesLine"
    (
        var SalesLine: Record "Sales Line";
        var Params: Record "SC - Parameters Collection"
    )
    begin
        SalesLine.MenuID := Params.ICPMenuId;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SC - Order/Basket Functions", 'OnAfterCreateDocResponse', '', true, true)]
    local procedure "SC - Order/Basket Functions_OnAfterCreateDocResponse"
    (
        var XMLNodeBuff: Record "SC - XML Buffer (dotNET)";
        var SalesHeader: Record "Sales Header";
        var Params: Record "SC - Parameters Collection"
    )
    var
        SalesLine: Record "Sales Line";
        CustomOperations: Codeunit ICPSCCustomOperations;
        ResultCollectionNodeBuff: Record "SC - XML Buffer (dotNET)" temporary;
        CollectionNodeBuff: Record "SC - XML Buffer (dotNET)" temporary;
        CurrentPeriodFoodBalance: Decimal;
        CurrentPeriodOpenFoodOrderTotal: Decimal;
        BasketFoodTotal: Decimal;
        CurrentQuarterNonFoodBalance: Decimal;
        CurrentQuarterOpenNonFoodOrderTotal: Decimal;
        BasketNonFoodTotal: Decimal;
        CurrentPeriodStartDate: Date;
        CurrentPeriodEndDate: Date;
        NextPeriodStartDate: Date;
        NextPeriodEndDate: Date;
        CurrentQuarterStartDate: Date;
        CurrentQuarterEndDate: Date;
        NextQuarterStartDate: Date;
        NextQuarterEndDate: Date;
        Message: Text[250];
        MessageCreated: Boolean;

    begin
        XMLNodeBuff.AddElement(ResultCollectionNodeBuff, 'OrderLimitValidationMessages', '');
        MessageCreated := false;

        CustomOperations.GetPeriodDates(CurrentPeriodStartDate, CurrentPeriodEndDate, NextPeriodStartDate, NextPeriodEndDate);
        CustomOperations.GetQuarterDates(CurrentPeriodStartDate, CurrentQuarterStartDate, CurrentQuarterEndDate, NextQuarterStartDate, NextQuarterEndDate);

        CurrentPeriodFoodBalance := CustomOperations.GetBalance(SalesHeader."Sell-to Customer No.", true, CurrentPeriodStartDate, CurrentPeriodEndDate);
        CurrentPeriodOpenFoodOrderTotal := CustomOperations.GetOpenOrderTotal(SalesHeader."Sell-to Customer No.", true, CurrentPeriodStartDate, CurrentPeriodEndDate);
        CurrentQuarterNonFoodBalance := CustomOperations.GetBalance(SalesHeader."Sell-to Customer No.", false, CurrentQuarterStartDate, CurrentQuarterEndDate);
        CurrentQuarterOpenNonFoodOrderTotal := CustomOperations.GetOpenOrderTotal(SalesHeader."Sell-to Customer No.", false, CurrentQuarterStartDate, CurrentQuarterEndDate);

        BasketFoodTotal := GetBasketTotalByAllocationType(SalesHeader."No.", true);

        if (CurrentPeriodOpenFoodOrderTotal + BasketFoodTotal) > -CurrentPeriodFoodBalance then begin
            ResultCollectionNodeBuff.AddElement(CollectionNodeBuff, 'MessageItem', '');
            CollectionNodeBuff.AddFieldElement('Message', StrSubstNo('This order exceeds your Food Balance by $%1', (CurrentPeriodOpenFoodOrderTotal + BasketFoodTotal + CurrentPeriodFoodBalance)));
            MessageCreated := true;
        end;

        BasketNonFoodTotal := GetBasketTotalByAllocationType(SalesHeader."No.", false);

        if (CurrentQuarterOpenNonFoodOrderTotal + BasketNonFoodTotal) > -CurrentQuarterNonFoodBalance then begin
            ResultCollectionNodeBuff.AddElement(CollectionNodeBuff, 'MessageItem', '');
            CollectionNodeBuff.AddFieldElement('Message', StrSubstNo('This order exceeds your Non-Food Balance by $%1', (CurrentQuarterOpenNonFoodOrderTotal + BasketNonFoodTotal + CurrentQuarterNonFoodBalance)));
            MessageCreated := true;
        end;

        if OrderTypeExistForToday(SalesHeader."Sell-to Customer No.", true) then begin
            ResultCollectionNodeBuff.AddElement(CollectionNodeBuff, 'MessageItem', '');
            CollectionNodeBuff.AddFieldElement('Message', 'You are only allowed to place one Food order per day');
            MessageCreated := true;
        end;

        if OrderTypeExistForToday(SalesHeader."Sell-to Customer No.", false) then begin
            ResultCollectionNodeBuff.AddElement(CollectionNodeBuff, 'MessageItem', '');
            CollectionNodeBuff.AddFieldElement('Message', 'You are only allowed to place one Non-Food order per day');
        end;

        SalesLine.Reset();
        SalesLine.setRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindSet() then
            repeat
                Message := CheckForInvalidQuantites(SalesLine);
                if Message <> '' then begin
                    ResultCollectionNodeBuff.AddElement(CollectionNodeBuff, 'MessageItem', '');
                    CollectionNodeBuff.AddFieldElement('Message', Message);
                    MessageCreated := true;
                end;

            until (SalesLine.next() = 0);

        if not Params.IsBasket(XMLNodeBuff) and not MessageCreated then begin
            SalesLine.Reset();
            SalesLine.setRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange("Document No.", SalesHeader."No.");

            if SalesLine.FindFirst() then begin
                SalesLine.CalcFields(FoodItem);

                if SalesLine.FoodItem then
                    SalesHeader."Allocated Type" := SalesHeader."Allocated Type"::Food
                else
                    SalesHeader."Allocated Type" := SalesHeader."Allocated Type"::"Non-Food";

                SalesHeader.Modify();

                SplitOrderByAllocatedType(SalesHeader, SalesLine);
            end;
        end;
    end;

    local procedure SplitOrderByAllocatedType(var SalesHeader: Record "Sales Header"; var SalesLine: record "Sales Line")
    var
        NewSalesHeader: Record "Sales Header";
        FoodItem: Boolean;
    begin
        FoodItem := (SalesHeader."Allocated Type" = SaLesHeader."Allocated Type"::Food);

        SalesLine.Reset();
        SalesLine.setRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetFilter(FoodItem, '<>%1', FoodItem);

        IF SalesLine.FindSet() THEN begin
            CreateSalesHeader(SalesHeader, NewSalesHeader, FoodItem);
            CreateSalesLine(SalesLine, SalesHeader."No.", FoodItem);
            SalesLine.Delete();
        end;
    end;

    local procedure CreateSalesHeader(SalesHeader: Record "Sales Header"; var NewSalesHeader: Record "Sales Header"; FoodItem: Boolean)
    var
    begin
        NewSalesHeader.Init();
        NewSalesHeader."Document Type" := SalesHeader."Document Type";
        NewSalesHeader.Validate("Sell-to Customer No.", SalesHeader."Sell-to Customer No.");
        NewSalesHeader.InitFromSalesHeader(SalesHeader);

        if FoodItem then
            NewSalesHeader."Allocated Type" := NewSalesHeader."Allocated Type"::Food
        ELSE
            NewSalesHeader."Allocated Type" := NewSalesHeader."Allocated Type"::"Non-Food";

        NewSalesHeader.Insert();
    end;

    local procedure CreateSalesLine(SalesLine: Record "Sales Line"; DocumentNo: code[20]; FoodItem: Boolean)
    var
        NewSalesLine: Record "Sales Line";
    begin
        NewSalesLine.Init();
        NewSalesLine."Document Type" := SalesLine."Document Type";
        NewSalesLine."Document No." := DocumentNo;
        NewSalesLine.Validate("No.", SalesLine."No.");
        NewSalesLine.Validate(Quantity, SalesLine.Quantity);
        NewSalesLine.FoodItem := FoodItem;
        NewSalesLine.Insert();
    end;

    local procedure GetBasketTotalByAllocationType(OrderNo: code[20]; Food: Boolean): Decimal
    var
        SalesLine: Record "Sales Line";
        OrderTotal: Decimal;
    begin
        OrderTotal := 0;

        SalesLine.Reset();
        SalesLine.setRange("Document Type", SalesLine."Document Type"::Order);
        SalesLine.SetRange("Document No.", OrderNo);
        SalesLine.SetRange("FoodItem", Food);

        if SalesLine.FindSet() then
            repeat
                OrderTotal += SalesLine.Amount;
            until (SalesLine.next() = 0);

        exit(OrderTotal);
    end;

    local procedure OrderTypeExistForToday(CustomerNo: Code[20]; Food: Boolean): Boolean
    var
        SalesHeader: Record "Sales Header";
        OrderExist: Boolean;
    begin
        SalesHeader.Reset();
        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SetRange("Sell-to Customer No.", CustomerNo);
        SalesHeader.SetRange("Document Date", WorkDate());
        SalesHeader.SetRange("Requested Delivery Date", WorkDate());

        if Food then
            SalesHeader.SetRange("Allocated Type", SalesHeader."Allocated Type"::Food)
        else
            SalesHeader.SetRange("Allocated Type", SalesHeader."Allocated Type"::"Non-Food");

        OrderExist := Not SalesHeader.IsEmpty();

        exit(OrderExist);
    end;

    local procedure CheckForInvalidQuantites(SalesLine: Record "Sales Line"): text[250]
    var
        CustomerItemQty: Record "CustomerItemQty";
        Item: Record Item;
        CollectionNodeBuff: Record "SC - XML Buffer (dotNET)";
        MinimumQty: Decimal;
        MaximumQty: Decimal;
        message: Text[250];
    begin
        message := '';
        MinimumQty := 0;
        MaximumQty := 0;

        If CustomerItemQty.get(SalesLine."Sell-to Customer No.", SalesLine."No.") then begin
            MinimumQty := CustomerItemQty.MinimumQty;
            MaximumQty := CustomerItemQty.MaximumQty;
        end else
            if Item.Get(SalesLine."No.") then begin
                MinimumQty := Item."Minimum Sales Order Qty.";
                MaximumQty := Item."Maximum Sales Order Qty.";
            end;

        If SalesLine.Quantity < MinimumQty then
            Message := StrSubstNo('The minimum order quantity for %1 is %2', SalesLine."No.", MinimumQty)
        else
            if (SalesLine.Quantity > MaximumQty) and (MaximumQty > 0) then
                Message := StrSubstNo('The maximum order quantity for %1 is %2', SalesLine."No.", MaximumQty);

        exit(message);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SC - Orders Functions", 'OnGetSalesLine', '', false, false)]
    local procedure OnGetSalesLine(var Params: Record "SC - Parameters Collection"; var SalesLine: Record "Sales Line"; var XMLNodeBuff: Record "SC - XML Buffer (dotNET)")
    begin
        XMLNodeBuff.AddFieldElement('DailyMenuId', SalesLine.MenuID);
    end;

    local procedure GetFieldValueByNameFromXML(var InXMLBuff: Record "SC - XML Buffer (dotNET)"; FieldName: Text[1024]) TextValue: Text;
    begin
        TextValue := InXMLBuff.CutFieldValueByName(FieldName);
        exit(TextValue);
    end;
}