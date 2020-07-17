codeunit 50001 ICPSalesPostHandler
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeCheckCustBlockage', '', true, true)]
    local procedure "Sales-Post_OnBeforeCheckCustBlockage"
    (
       SalesHeader: Record "Sales Header";
       CustCode: Code[20];
       var ExecuteDocCheck: Boolean;
       var IsHandled: Boolean
    )
    var
        Customer: Record Customer;

    begin
        if Customer.Get(CustCode) then
            if Customer.Allocation and (SalesHeader."Allocated Type" = SalesHeader."Allocated Type"::" ") then
                Error('Customer is flagged as Allocated.\You must change Allocated Type in Sales Header Custom TAB to Food or Non-Food');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostInvPostBuffer', '', true, true)]
    local procedure "Sales-Post_OnBeforePostInvPostBuffer"
    (
        var GenJnlLine: Record "Gen. Journal Line";
        var InvoicePostBuffer: Record "Invoice Post. Buffer";
        var SalesHeader: Record "Sales Header";
        CommitIsSuppressed: Boolean;
        var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        PreviewMode: Boolean
    )
    begin
        GenJnlLine."Allocated Type" := SalesHeader."Allocated Type";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostCustomerEntry', '', true, true)]
    local procedure "Sales-Post_OnBeforePostCustomerEntry"
    (
        var GenJnlLine: Record "Gen. Journal Line";
        var SalesHeader: Record "Sales Header";
        var TotalSalesLine: Record "Sales Line";
        var TotalSalesLineLCY: Record "Sales Line";
        CommitIsSuppressed: Boolean;
        PreviewMode: Boolean;
        var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"
    )
    begin
        GenJnlLine."Allocated Type" := SalesHeader."Allocated Type";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforeInsertICGenJnlLine', '', true, true)]
    local procedure "Sales-Post_OnBeforeInsertICGenJnlLine"
    (
        var ICGenJournalLine: Record "Gen. Journal Line";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CommitIsSuppressed: Boolean
    )
    begin
        ICGenJournalLine."Allocated Type" := SalesHeader."Allocated Type";
    end;

}