Codeunit 70000080 "Sales-Post80"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Sales-Post"(Codeunit 80)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09252013D;
        //      Time=152656T;
        //      Modified=Yes;
        //      Version List=NAVW17.00.00.35026,NAVNA7.00.00.35026,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Sales-Post"(Codeunit 80);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF PostingDateExists AND (ReplacePostingDate OR ("Posting Date" = 0D)) THEN BEGIN
        //                                            "Posting Date" := PostingDate;
        //                                            VALIDATE("Currency Code");
        //                                          #4..1362
        //                                                  GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
        //                                                  GenJnlLine.VALIDATE("FA Posting Type",GenJnlLine."FA Posting Type"::" ");
        //  
        //                                                  IF (InvPostingBuffer[1]."Job No." <> '') AND (InvPostingBuffer[1].Type = InvPostingBuffer[1].Type::"G/L Account") THEN
        //                                                    JobPostLine.SetGLEntryNoOnJobLedgerEntry(InvPostingBuffer[1],"Posting Date",GenJnlLineDocNo,GLEntryNo);
        //  
        //                                          #1369..1424
        //                                              GenJnlLine."Source Code" := SrcCode;
        //                                              GenJnlLine."Posting No. Series" := "Posting No. Series";
        //                                              GenJnlLine."IC Partner Code" := "Sell-to IC Partner Code";
        //                                              GenJnlPostLine.RunWithCheck(GenJnlLine);
        //  
        //                                              // Balancing account
        //                                          #1431..1729
        //                                          // Balancing account
        //                                          IF ("Bal. Account No." <> '') AND IsOnlinePayment(SalesHeader) AND Invoice THEN
        //                                            PostBalancing(TransactionLogEntryNo)
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..1365
        //                                                  // iCepts BRB 05.29.07 - Add Allocated Type :START
        //                                                  GenJnlLine."Allocated Type" := "Allocated Type";
        //                                                  // iCepts BRB 05.29.07 - Add Allocated Type :END
        //  
        //                                          #1366..1427
        //  
        //                                              // iCepts BRB 05.29.07 - Add Allocated Type :START
        //                                              GenJnlLine."Allocated Type" := "Allocated Type";
        //                                              // iCepts BRB 05.29.07 - Add Allocated Type :END
        //  
        //                                          #1428..1732
        //                                        END;
        //  
        //                           Target=OnRun }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          SalesHeader.TESTFIELD("Sell-to IC Partner Code",'');
        //                                          SalesHeader.TESTFIELD("Bill-to IC Partner Code",'');
        //                                          SalesLine.TESTFIELD("IC Partner Ref. Type",SalesLine."IC Partner Ref. Type"::"G/L Account");
        //                                          #4..68
        //                                            TempICGenJnlLine.Amount := ROUND(TempICGenJnlLine.Amount * (1 + TempICGenJnlLine."Bal. VAT %" / 100),
        //                                                Currency."Amount Rounding Precision");
        //                                          TempICGenJnlLine.VALIDATE(Amount);
        //                                          TempICGenJnlLine.INSERT;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..71
        //  
        //                                          // iCepts BRB 05.29.07 - Add Allocated Type :START
        //                                          TempICGenJnlLine."Allocated Type" := SalesHeader."Allocated Type";
        //                                          // iCepts BRB 05.29.07 - Add Allocated Type :END
        //  
        //                                          TempICGenJnlLine.INSERT;
        //                                        END;
        //  
        //                           Target=InsertICGenJnlLine(PROCEDURE 150) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          Cust.GET(CustCode);
        //                                          IF SalesHeader.Receive THEN
        //                                            Cust.CheckBlockedCustOnDocs(Cust,SalesHeader."Document Type",FALSE,TRUE)
        //                                          ELSE BEGIN
        //                                          #5..12
        //                                            END ELSE
        //                                              Cust.CheckBlockedCustOnDocs(Cust,SalesHeader."Document Type",FALSE,TRUE);
        //                                          END;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          Cust.GET(CustCode);
        //  
        //                                          // iCepts BRB 05.30.07 - If Allocated, select Food or Non-Food :START
        //                                          IF (Cust.Allocation) AND (SalesHeader."Allocated Type" = 0) THEN
        //                                            ERROR(Text50000);
        //                                          // iCepts BRB 05.30.07 - If Allocated, select Food or Non-Food :END
        //  
        //                                          #2..15
        //                                        END;
        //  
        //                           Target=CheckCustBlockage(PROCEDURE 1029) }
        //      { Insertion         ;InsertAfter=InvalidAssignmentErr(Variable 1171);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             Text50000@1000000000 : TextConst 'ENU=Customer is flagged as Allocated\You must change Allocated Type in Custom TAB to Food or Non-Food';
        //                           }
        //                            }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW17.00.00.35026,NAVNA7.00.00.35026;
        //                           ModifiedValue=NAVW17.00.00.35026,NAVNA7.00.00.35026,iCepts1.00 }
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

