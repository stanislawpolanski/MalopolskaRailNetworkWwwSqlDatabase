CREATE PROCEDURE [dbo].[InsertSeedPhotosToObjectsOfInterestIntoDatabase]
    @SeedTable DataSeedInsertionSchema.PhotosToObjectsOfInterestInsertionType readonly
AS
    set identity_insert dbo.PhotosToObjectsOfInterest on

    merge into dbo.PhotosToObjectsOfInterest
        using @SeedTable
            on ([@SeedTable].Id = dbo.PhotosToObjectsOfInterest.Id)

            when not matched then
                insert (Id, ObjectOfInterestId, PhotoId) values
                (
                    [@SeedTable].Id,
                    [@SeedTable].ObjectOfInterestId,
                    [@SeedTable].PhotoId
                )
    ;

    set identity_insert dbo.PhotosToObjectsOfInterest off
RETURN 0
