codeunit 50000 ICPGenJnlPostLineHandler
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeInsertDtldCustLedgEntry', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeInsertDtldCustLedgEntry"
    (
        var DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        GenJournalLine: Record "Gen. Journal Line";
        DtldCVLedgEntryBuffer: Record "Detailed CV Ledg. Entry Buffer"
    )
    begin
        DtldCustLedgEntry."Allocated Type" := GenJournalLine."Allocated Type";
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnBeforeCustLedgEntryInsert', '', true, true)]
    local procedure "Gen. Jnl.-Post Line_OnBeforeCustLedgEntryInsert"
    (
        var CustLedgerEntry: Record "Cust. Ledger Entry";
        GenJournalLine: Record "Gen. Journal Line";
        GLRegister: Record "G/L Register"
    )
    begin
        CustLedgerEntry."Allocated Type" := GenJournalLine."Allocated Type";
    end;


}