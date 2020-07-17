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
        // iCepts BRB 05.30.07 - Update Allocated Type
        DtldCustLedgEntry."Allocated Type" := GenJournalLine."Allocated Type";
    end;


}