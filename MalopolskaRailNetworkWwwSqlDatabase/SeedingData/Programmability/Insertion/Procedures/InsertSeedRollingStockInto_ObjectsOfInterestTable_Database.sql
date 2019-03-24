CREATE PROCEDURE [DataSeedInsertionSchema].[InsertSeedRollingStockInto_ObjectsOfInterestTable_Database]
    @SeedTable DataSeedInsertionSchema.ObjectsOfInterestInsertionType readonly
AS
    set identity_insert dbo.ObjectsOfInterest on

    merge into dbo.ObjectsOfInterest
        using @SeedTable
            on ([@SeedTable].Id = dbo.RollingStock.Id)

            when not matched then
                insert (Id, OwnerId, Name) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].OwnerId,
                    [@SeedTable].Name
                )
    ;

    set identity_insert dbo.ObjectsOfInterest off
RETURN 0
