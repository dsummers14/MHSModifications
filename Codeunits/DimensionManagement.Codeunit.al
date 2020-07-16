Codeunit 70000408 DimensionManagement408
{

    trigger OnRun()
    begin

        //  OBJECT Modification DimensionManagement(Codeunit 408)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=11212013D;
        //      Time=143952T;
        //      Modified=Yes;
        //      Version List=NAVW17.00.00.35201,HF1.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target=DimensionManagement(Codeunit 408);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        //                                          DimVal."Dimension Code" := GLSetupShortcutDimCode[FieldNumber];
        //                                          IF ShortcutDimCode <> '' THEN
        //                                            DimVal.GET(DimVal."Dimension Code",ShortcutDimCode);
        //                                          IF NOT CheckDim(DimVal."Dimension Code") THEN
        //                                            ERROR(GetDimErr);
        //                                          IF NOT CheckDimValue(DimVal."Dimension Code",ShortcutDimCode) THEN
        //                                            ERROR(GetDimErr);
        //                                          GetDimensionSet(TempDimSetEntry,DimSetID);
        //                                          IF TempDimSetEntry.GET(TempDimSetEntry."Dimension Set ID",DimVal."Dimension Code") THEN
        //                                            IF TempDimSetEntry."Dimension Value Code" <> ShortcutDimCode THEN
        //                                          #12..16
        //                                            IF TempDimSetEntry.INSERT THEN;
        //                                          END;
        //                                          DimSetID := GetDimensionSetID(TempDimSetEntry);
        //                                        END;
        //  
        //                           ModifiedCode=BEGIN
        //                                          ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        //                                          DimVal."Dimension Code" := GLSetupShortcutDimCode[FieldNumber];
        //                                          IF ShortcutDimCode <> '' THEN BEGIN // iCepts BRB 11.21.13
        //                                              DimVal.GET(DimVal."Dimension Code",ShortcutDimCode);
        //                                            IF NOT CheckDim(DimVal."Dimension Code") THEN
        //                                              ERROR(GetDimErr);
        //                                            IF NOT CheckDimValue(DimVal."Dimension Code",ShortcutDimCode) THEN
        //                                              ERROR(GetDimErr);
        //                                          END; // iCepts BRB 11.21.13
        //                                          #9..19
        //                                        END;
        //  
        //                           Target=ValidateShortcutDimValues(PROCEDURE 127) }
        //      { PropertyModification;
        //                           Property=Version List;
        //                           OriginalValue=NAVW17.00.00.35201;
        //                           ModifiedValue=NAVW17.00.00.35201,HF1.00 }
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

