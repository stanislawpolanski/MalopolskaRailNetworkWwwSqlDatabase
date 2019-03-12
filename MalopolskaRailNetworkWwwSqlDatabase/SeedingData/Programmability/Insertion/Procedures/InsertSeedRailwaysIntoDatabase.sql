CREATE PROCEDURE [dbo].[InsertSeedRailwaysIntoDatabase]
    @SeedTable dbo.RailwaysInsertionType readonly
AS
    set identity_insert dbo.Railways on

    merge into dbo.Railways
        using @SeedTable
            on ([@SeedTable].Id = dbo.Railways.Id)

            when not matched then
                insert (Id, Number, Name, OwnerId, GeometryId) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].Number,
                    [@SeedTable].Name,
                    [@SeedTable].OwnerId,
                    [@SeedTable].GeometryId
                )
    ;

    set identity_insert dbo.Railways off
RETURN 0