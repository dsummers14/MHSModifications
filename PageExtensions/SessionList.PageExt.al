PageExtension 50118 pageextension50118 extends "Session List" 
{
    actions
    {
        addafter("SQL Trace")
        {
            group(Custom)
            {
                action("Kill Session")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Kill Session') then
                          StopSession("Session ID");
                    end;
                }
            }
        }
    }
}

