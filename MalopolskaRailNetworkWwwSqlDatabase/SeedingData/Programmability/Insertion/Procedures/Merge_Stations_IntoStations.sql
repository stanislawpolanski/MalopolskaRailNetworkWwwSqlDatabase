CREATE PROCEDURE [DataSeedInsertionSchema].[Merge_Stations_IntoStations]
    @SeedTable DataSeedInsertionSchema.StationsInsertionType readonly
AS
    set identity_insert dbo.Stations on

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

    set identity_insert dbo.Stations off
RETURN 0