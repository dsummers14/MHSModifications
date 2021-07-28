codeunit 50120 ICPSCCatalogHelperHandler
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"SC - Catalog Helper", 'OnGetProduct', '', true, true)]
    local procedure "SC - Catalog Helper_OnGetProduct"
    (
        var XMLNodeBuff: Record "SC - XML Buffer (dotNET)";
        var Item: Record "Item";
        var Params: Record "SC - Parameters Collection"
    )
    var
        IsMenuOnly: Integer;
    begin
        if Item."Menu-Only" then
            IsMenuOnly := 1
        else
            IsMenuOnly := 0;

        XMLNodeBuff.AddFieldElement('IsItemMenuOnly', Format(IsMenuOnly));

        XMLNodeBuff.AddFieldElement('TitleColor', Format(Item.DisplayColor));
    end;


}