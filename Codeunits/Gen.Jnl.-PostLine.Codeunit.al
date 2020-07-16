Codeunit 70000012 "Gen. Jnl.-Post Line12"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Gen. Jnl.-Post Line"(Codeunit 12)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09252013D;
        //      Time=153202T;
        //      Modified=Yes;
        //      Version List=NAVW17.00.00.35201,NAVNA7.00.00.35201,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Gen. Jnl.-Post Line"(Codeunit 12);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          TotalAmountLCY := 0;
        //                                          TotalAmountAddCurr := 0;
        //  
        //                                          #4..27
        //                                                DtldCustLedgEntry."Source Code" := GenJnlLine2."Source Code";
        //                                                DtldCustLedgEntry."Transaction No." := NextTransactionNo;
        //                                                CustUpdateDebitCredit(GenJnlLine2.Correction,DtldCustLedgEntry);
        //                                                DtldCustLedgEntry.INSERT;
        //  
        //                                                IF OriginalDateSet THEN BEGIN
        //                                          #34..534
        //                                              ZeroTransNoDtldCustLedgEntries(NextTransactionNo);
        //                                            DtldCVLedgEntryBuf.DELETEALL;
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..30
        //  
        //                                                // iCepts BRB 05.30.07 - Update Allocated Type :START
        //                                                DtldCustLedgEntry."Allocated Type" := GenJnlLine."Allocated Type";
        //                                                // iCepts BRB 05.30.07 - Update Allocated Type :END
        //  
        //                                          #31..537
        //                                        END;
        //  
        //                           Target=PostDtldCustLedgEntries(PROCEDURE 46) }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW17.00.00.35201,NAVNA7.00.00.35201;
        //                           ModifiedValue=NAVW17.00.00.35201,NAVNA7.00.00.35201,iCepts1.00 }
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

