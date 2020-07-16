Codeunit 70000044 NASManagement44
{

    trigger OnRun()
    begin

        //  OBJECT Modification NASManagement(Codeunit 44)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09252013D;
        //      Time=155419T;
        //      Modified=Yes;
        //      Version List=NAVW17.00,iCepts1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target=NASManagement(Codeunit 44);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          ParamStr := UPPERCASE(NASID);
        //                                          REPEAT
        //                                            SepPosition := STRPOS(ParamStr,',');
        //                                            IF SepPosition > 0 THEN
        //                                              Parameter := COPYSTR(ParamStr,1,SepPosition - 1)
        //                                            ELSE
        //                                              Parameter := ParamStr;
        //  
        //                                            CASE Parameter OF
        //                                              'JOBQUEUE':
        //                                                CODEUNIT.RUN(CODEUNIT::"Job Queue - NAS Start Up");
        //                                            END;
        //                                            ParamStr := COPYSTR(ParamStr,SepPosition + 1);
        //                                          UNTIL SepPosition = 0;
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          #1..8
        //                                            // iCepts BRB 04.24.07 - Commerce Insight by Stored Procedures :START
        //                                            IF (COPYSTR(Parameter,1,4) = 'NASS') THEN BEGIN
        //                                              CommNAVS.RUN;
        //                                            END;
        //                                            // iCepts BRB 04.24.07 - Commerce Insight by Stored Procedures :END
        //  
        //                                          #9..14
        //                                        END;
        //  
        //                           Target=NASHandler(PROCEDURE 1) }
        //      { Insertion         ;ChangedElements=VariableCollection
        //      {
        //        CommNAVS@1000000000 : Codeunit WebServices;
        //      }
        //       }
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

