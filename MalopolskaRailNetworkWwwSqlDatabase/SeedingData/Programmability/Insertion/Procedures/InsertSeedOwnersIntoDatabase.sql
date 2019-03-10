CREATE PROCEDURE [dbo].[InsertSeedOwnersIntoDatabase]
    @SeedTable dbo.OwnersInsertionType readonly
AS
    set identity_insert dbo.Owners on

    merge into dbo.Owners
        using @SeedTable
            on ([@SeedTable].Id = dbo.Owners.Id)

            when not matched then
                insert (Id, Name) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].Name
                )
    ;

    set identity_insert dbo.Owners off
RETURN 0

--declare @seed dbo.OwnersInsertionType;
--insert into @seed
--select * from dbo.ParseOwners()

--select * from @seed order by Name