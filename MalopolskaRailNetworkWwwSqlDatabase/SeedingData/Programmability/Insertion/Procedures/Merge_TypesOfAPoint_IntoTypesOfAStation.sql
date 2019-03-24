CREATE PROCEDURE [DataSeedInsertionSchema].[Merge_TypesOfAPoint_IntoTypesOfAStation]
    @SeedTable DataSeedInsertionSchema.TypesOfAStation_InsertionType readonly
AS
    set identity_insert dbo.TypesOfAStation on

    merge into dbo.TypesOfAStation
        using @SeedTable
            on ([@SeedTable].Id = dbo.TypesOfAStation.Id)

            when not matched then
                insert (Id, AbbreviatedName) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].AbbreviatedName
                )
    ;

    set identity_insert dbo.TypesOfAStation off
RETURN 0