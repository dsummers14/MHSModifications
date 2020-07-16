Codeunit 57004 WebServices
{

    trigger OnRun()
    begin
    end;

        procedure CreateSalesOrder(pGuid: Text[40]) iNavOrderNo: Text[250]
    var
        iOrderImport: Codeunit "Order Import";
    begin

        iNavOrderNo := iOrderImport.CreateSalesOrder(pGuid);
    end;
}

