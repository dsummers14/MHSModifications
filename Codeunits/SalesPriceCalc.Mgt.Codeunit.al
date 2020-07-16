Codeunit 70007000 "Sales Price Calc. Mgt.7000"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Sales Price Calc. Mgt."(Codeunit 7000)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09232013D;
        //      Time=120000T;
        //      Modified=Yes;
        //      Version List=NAVW17.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Sales Price Calc. Mgt."(Codeunit 7000);
        //    }
        //    CHANGES
        //    {
        //      { Insertion         ;InsertAfter=JobJnlLineStartDate(PROCEDURE 55);
        //                           ChangedElements=PROCEDURECollection
        //                           {
        //                             PROCEDURE GetPriceCommNav@1000000000(VAR CustNum@1000000000 : Code[20];VAR ItemNum@1000000001 : Code[20];VAR UntPrce@1000000002 : Decimal;UOM@1000000004 : Code[10]);
        //                             VAR
        //                               CustRec@1000000003 : Record Customer;
        //                               qpuom@1000000005 : Decimal;
        //                               ItmUOM@1000000006 : Record "Item Unit of Measure";
        //                             BEGIN
        //                               IF NOT Item.GET(ItemNum) THEN
        //                                 CLEAR(Item);
        //                               IF NOT CustRec.GET(CustNum) THEN
        //                                 CLEAR(CustRec);
        //                               qpuom := 0;
        //                               IF UOM = '' THEN BEGIN
        //                                 IF ItmUOM.GET(ItemNum,Item."Base Unit of Measure") THEN
        //                                   qpuom := ItmUOM."Qty. per Unit of Measure";
        //                               END ELSE BEGIN
        //                                 IF ItmUOM.GET(ItemNum,UOM) THEN
        //                                   qpuom := ItmUOM."Qty. per Unit of Measure";
        //                               END;
        //                               IF qpuom = 0 THEN
        //                                 qpuom := 1;
        //                               SetCurrency('',0,0D);
        //                               SetVAT(FALSE,0,0,'');
        //                               SetUoM(1,qpuom);
        //                               FindSalesPrice(TempSalesPrice,CustRec."No.",'',CustRec."Customer Price Group",'',Item."No.",'','EA','',TODAY,FALSE);
        //                               //TempSalesPrice.FINDFIRST;
        //                               CalcBestUnitPrice(TempSalesPrice);
        //                               UntPrce := TempSalesPrice."Unit Price";
        //                             END;
        //  
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW17.00;
        //                           ModifiedValue=NAVW17.00,iCepts1.00 }
        //    }
        //    CODE
        //    {
        //  
        //      BEGIN
        //      END.
        //    }
        //  }
        //  
        //  

    end;
}

