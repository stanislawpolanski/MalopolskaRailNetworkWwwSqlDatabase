CREATE PROCEDURE [DataSeedInsertionSchema].[Merge_Stations_IntoStations]
    @SeedTable DataSeedInsertionSchema.StationsInsertionType readonly
AS
    merge into dbo.Stations
        using @SeedTable
            on ([@SeedTable].Id = dbo.Stations.Id)

            when not matched then
                insert (Id, TypeOfAStationId) values
                (
                    [@SeedTable].[Id], 
                    [@SeedTable].[TypeOfAStationId]
                )
    ;
RETURN 0