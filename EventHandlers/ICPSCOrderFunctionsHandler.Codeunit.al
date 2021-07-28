codeunit 50118 ICPSCOrderFunctionsHandler
{

    [EventSubscriber(ObjectType::Table, 11123310, 'OnInitLineFieldValues', '', false, false)]
    local procedure OnInitLineFieldValues(var LineNodeBuff: Record "SC - XML Buffer (dotNET)"; var Params: Record "SC - Parameters Collection")
    var
        TextValue: Text[250];
    begin
        TextValue := copystr(GetFieldValueByNameFromXML(LineNodeBuff, 'DailyMenuId'), 1, 250);
        Params.ICPMenuId := CopyStr(TextValue, 1, 20);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SC - Order/Basket Functions", 'OnAfterAddDocumentLine', '', false, false)]
    local procedure OnAfterAddDocumentLine(var SalesLine: Record "Sales Line"; var Params: Record "SC - Parameters Collection")
    var

    begin
        SalesLine.Validate(MenuID, Params.ICPMenuId);
        SalesLine.Modify(true);
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