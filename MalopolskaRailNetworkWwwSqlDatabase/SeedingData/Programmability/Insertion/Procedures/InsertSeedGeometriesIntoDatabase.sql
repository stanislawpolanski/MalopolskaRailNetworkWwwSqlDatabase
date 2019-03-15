CREATE PROCEDURE [dbo].[InsertSeedGeometriesIntoDatabase]
    @SeedTable dbo.GeometriesInsertionType readonly
AS
    set identity_insert dbo.Geometries on

    merge into dbo.Geometries
        using @SeedTable
            on ([@SeedTable].Id = dbo.Geometries.Id)

            when not matched then
                insert (Id, SpatialData) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].SpatialData
                )
    ;

    set identity_insert dbo.Geometries off
RETURN 0
