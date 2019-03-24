CREATE PROCEDURE [dbo].[InsertSeedPhotosIntoDatabase]
    @SeedTable DataSeedInsertionSchema.PhotosInsertionType readonly
AS
    set identity_insert dbo.Photos on

    merge into dbo.Photos
        using @SeedTable
            on ([@SeedTable].Id = dbo.Photos.Id)

            when not matched then
                insert (Id, FilePath, AdditionDateTime, PhotoDescription) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].FilePath,
                    [@SeedTable].AdditionDateTime,
                    [@SeedTable].PhotoDescription
                )
    ;

    set identity_insert dbo.Photos off
RETURN 0
