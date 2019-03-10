CREATE PROCEDURE [dbo].[InsertSeedGeometriesIntoDatabase]
    @SeedTable dbo.GeometriesInsertionType readonly
AS
    set identity_insert dbo.Geometries on

    merge into dbo.Geometries
        using @SeedTable
            on ([@SeedTable].Id = dbo.Geometries.Id)

            when matched then
                update set
                    dbo.Geometries.Id = [@SeedTable].Id,
                    dbo.Geometries.Value = [@SeedTable].Value

            when not matched then
                insert (Id, Value) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].Value
                )
    ;

    set identity_insert dbo.Geometries off
RETURN 0
