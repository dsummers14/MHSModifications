Codeunit 57003 InsightTrace
{
    // // iCepts BRB 09.25.06 - Commerce Insight for Navision iCepts1.00


    trigger OnRun()
    begin
    end;

    var
        InsightTraceFile: Record InsightTraceFile;
        NextEntryNo: Integer;
        NextLineNo: Integer;
        LastTime: Time;
        TimeSpan: Decimal;
        DebugFle: File;
        DebugFleNme: Text[250];
        OK: Boolean;
        IsFileNameSet: Boolean;

        procedure WriteTraceDB(Process: Text[255])
    begin
        InsightTraceFile.LockTable;
        if InsightTraceFile.Find('+') then begin
          NextEntryNo := InsightTraceFile."Entry No." + 1;
        end else begin
          NextEntryNo := 1;
        end;

        InsightTraceFile.Init;
        InsightTraceFile."Entry No." := NextEntryNo;
        InsightTraceFile.TraceTxt := Process;
        InsightTraceFile.DteStmp := Today;
        InsightTraceFile.TmeStmp := Time;
        InsightTraceFile.Insert(true);
        Commit;
    end;

        procedure WriteTrace(Txt: Text[250])
    begin
        if not IsFileNameSet then
          OpenTrace('c:\Trace\Trace-' + UserId + '-' +
            DelChr(Format(CurrentDatetime,0,'<Year4><Month,2><Day,2>-<Hours24,2><Minutes,2><Seconds,2>-<Thousands,3>'),'=',':/. ')
            + '.txt', true);

        DebugFle.TextMode(true);
        DebugFle.WriteMode(true);

          if DebugFle.Open(DebugFleNme) then begin
            DebugFle.SEEK(DebugFle.LEN);
            DebugFle.Write(Txt);
          end;
        DebugFle.Close;
    end;

        procedure OpenTrace(FleNme: Text[250];ErseCreateFle: Boolean)
    begin
        IsFileNameSet := false;
        if ErseCreateFle then
          OK := Erase(FleNme);
        DebugFleNme := FleNme;
        DebugFle.TextMode(true);

        if ErseCreateFle then begin
          if not DebugFle.Create(DebugFleNme)  then
            Error(DebugFleNme + '\Trace File not created');
          DebugFle.Close;
        end;

        IsFileNameSet := true;
    end;

        procedure WriteTraceTS(Txt: Text[250])
    var
        sTimeStamp: Text[50];
    begin
        WriteTrace(
          CopyStr(
            Format(CurrentDatetime,0,'<Year4><Month,2><Day,2>-<Hours24,2><Minutes,2><Seconds,2>-<Thousands,3>') +
            ': ' + Txt,
            1,
            MaxStrLen(Txt)
          )
        );
    end;
}

