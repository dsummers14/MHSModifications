Report 50098 "Build Report"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem(Item;Item)
        {
            column(ReportForNavId_6836; 6836)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Cnt += 1;
                Win.Update(3,ROUND(Cnt/TotCnt*10000,1));
                Win.Update(2,StrSubstNo('%1',Cnt) + ' of ' + StrSubstNo('%1',TotCnt));

                if TestLive = Testlive::Test then begin
                  "Reordering Policy" := "reordering policy"::"Fixed Reorder Qty.";
                  "Reorder Quantity" := 1;
                end else begin
                  if "Reordering Policy" = "reordering policy"::"Fixed Reorder Qty." then
                    "Reorder Quantity" := 1;
                end;

                Modify;
            end;

            trigger OnPreDataItem()
            begin
                if TestLive = Testlive::Test then
                  SetFilter("Vendor No.",'V01010|V01019..V01024|V1029..V1033')
                else
                  SetRange("Reordering Policy","reordering policy"::"Fixed Reorder Qty.");
                TotCnt := Count;
                Msg := 'Updating Item Reorder Policy for '+Format(TestLive)+', Please wait...';
                Win.Update(1,Msg);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(TestLive;TestLive)
                {
                    ApplicationArea = Basic;
                    Caption = 'Test or Live';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        Win.Open('Status  #1###################################\' +
                 '        #2###################################\' +
                 '        @3@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    end;

    var
        Win: Dialog;
        TotCnt: Integer;
        Cnt: Integer;
        Prc: Text[250];
        OK: Boolean;
        TestLive: Option Test,Live;
        Msg: Text[250];
}

