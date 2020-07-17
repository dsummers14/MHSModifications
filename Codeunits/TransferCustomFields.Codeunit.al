Codeunit 50149 "Transfer Custom Fields10201"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Transfer Custom Fields"(Codeunit 10201)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09252013D;
        //      Time=153228T;
        //      Modified=Yes;
        //      Version List=NAVNA7.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Transfer Custom Fields"(Codeunit 10201);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          // iCepts BRB 05.30.07 - Update Allocated Type :START
        //                                          GenLedgEntry."Allocated Type" := GenJnlLine."Allocated Type";
        //                                          // iCepts BRB 05.30.07 - Update Allocated Type :END
        //                                        END;
        //  
        //                           Target=GenJnlLineTOGenLedgEntry(PROCEDURE 1020000) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          // iCepts BRB 05.30.07 - Update Allocated Type :START
        //                                          CustLedgEntry."Allocated Type" := GenJnlLine."Allocated Type";
        //                                          // iCepts BRB 05.30.07 - Update Allocated Type :END
        //                                        END;
        //  
        //                           Target=GenJnlLineTOCustLedgEntry(PROCEDURE 1020002) }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVNA7.00;
        //                           ModifiedValue=NAVNA7.00,iCepts1.00 }
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

