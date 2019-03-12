CREATE PROCEDURE [dbo].[InsertSeedTypesOfAPointIntoDatabase]
    @SeedTable dbo.TypesOfAPointInsertionType readonly
AS
    set identity_insert dbo.TypesOfAPoint on

    merge into dbo.TypesOfAPoint
        using @SeedTable
            on ([@SeedTable].Id = dbo.TypesOfAPoint.Id)

            when not matched then
                insert (Id, AbbreviatedName) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].AbbreviatedName
                )
    ;

    set identity_insert dbo.TypesOfAPoint off
RETURN 0