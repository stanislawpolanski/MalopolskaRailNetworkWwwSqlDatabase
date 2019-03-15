CREATE PROCEDURE [DataSeedInsertionSchema].[InsertSeedStationsIntoDatabase]
    @SeedTable DataSeedInsertionSchema.StationsInsertionType readonly
AS
    set identity_insert dbo.Stations on

    merge into dbo.Stations
        using @SeedTable
            on ([@SeedTable].Id = dbo.Stations.Id)

            when not matched then
                insert (Id, Name, OwnerId, RailwayUnitId, TypeOfAPointId) values
                (
                    [@SeedTable].[Id], 
                    [@SeedTable].[Name], 
                    [@SeedTable].[OwnerId], 
                    [@SeedTable].[RailwayUnitId], 
                    [@SeedTable].[TypeOfAPointId]
                )
    ;

    set identity_insert dbo.Stations off
RETURN 0