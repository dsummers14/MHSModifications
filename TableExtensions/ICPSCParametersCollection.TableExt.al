tableextension 50116 ICPSCParametersCollection extends "SC - Parameters Collection"
{
    fields
    {
        field(50110; ICPMenuId; Code[20])
        {
            Caption = 'Menu Id';
        }

        field(50111; ICPCustomerId; Code[20])
        {
            Caption = 'Customer Id';
        }
    }
    procedure InitCustomParameters(var InXMLBuff: Record "SC - XML Buffer (dotNET)");
    var
        TextValue: Text;
        TextValue2: Text;
    begin
        // In case if xml node is in format <MyCustomParameter>My value</MyCustomParameter>              
        TextValue := InXMLBuff.SelectSingleNodeText('CustomerId');
        if TextValue <> '' then
            Rec.ICPCustomerId := CopyStr(TextValue, 1, 20);

        TextValue2 := InXMLBuff.SelectSingleNodeText('WebsiteId');
        if TextValue2 <> '' then
            Rec.WebsiteId := CopyStr(TextValue2, 1, 50);
    end;
}