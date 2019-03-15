CREATE PROCEDURE [DataSeedInsertionSchema].[InsertSeedRailwayUnitsIntoDatabase]
    @SeedTable DataSeedInsertionSchema.RailwayUnitsInsertionType readonly
AS
    set identity_insert dbo.RailwayUnits on

    merge into dbo.RailwayUnits
        using @SeedTable
            on ([@SeedTable].Id = dbo.RailwayUnits.Id)

            when not matched then
                insert (Id, Name, GeometriesId) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].Name,
                    [@SeedTable].GeometriesId
                )
    ;

    set identity_insert dbo.RailwayUnits off
RETURN 0