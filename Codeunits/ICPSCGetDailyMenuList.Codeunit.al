codeunit 50119 ICPSCGetDailyMenuList
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

        case Code of
            UPPERCASE('GetDailyMenuList'):
                GetDailyMenuList(RequestBuff, ResponseBuff);
        // Other custom methods
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
                        ProductsBuffer.AddElement(ProductBuffer, 'Product', '');
                        ProductBuffer.AddFieldElement('id', PublishedMenuDetail.ItemNo);
                        ProductBuffer.AddFieldElement('uom', PublishedMenuDetail.UOM);

                    until (PublishedMenuDetail.Next() = 0);

            until (PublishedMenuHeader.Next() = 0);

    end;
}