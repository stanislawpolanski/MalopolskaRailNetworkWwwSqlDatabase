CREATE PROCEDURE [dbo].[InsertSeedRollingStockIntoDatabase]
    @SeedTable dbo.RollingStockInsertionType readonly
AS
    set identity_insert dbo.RollingStock on

    merge into dbo.RollingStock
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

    set identity_insert dbo.RollingStock off
RETURN 0
