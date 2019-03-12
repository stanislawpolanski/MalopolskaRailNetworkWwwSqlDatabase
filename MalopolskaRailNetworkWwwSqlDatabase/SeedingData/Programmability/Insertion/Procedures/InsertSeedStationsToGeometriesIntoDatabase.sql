CREATE PROCEDURE [dbo].[InsertSeedStationsToGeometriesIntoDatabase]
    @SeedTable dbo.StationsToGeometriesInsertionType readonly
AS
    set identity_insert dbo.StationsToGeometries on

    merge into dbo.StationsToGeometries
        using @SeedTable
            on ([@SeedTable].Id = dbo.StationsToGeometries.Id)

            when not matched then
                insert (Id, StationId, GeometryId, BeginningKmpost, CentreKmpost, EndingKmpost, RailwayId) values
                (
                    [@SeedTable].[Id], 
                    [@SeedTable].[StationId], 
                    [@SeedTable].[GeometryId], 
                    [@SeedTable].[BeginningKmpost], 
                    [@SeedTable].[CentreKmpost], 
                    [@SeedTable].[EndingKmpost], 
                    [@SeedTable].[RailwayId]
                )
    ;

    set identity_insert dbo.StationsToGeometries off
RETURN 0