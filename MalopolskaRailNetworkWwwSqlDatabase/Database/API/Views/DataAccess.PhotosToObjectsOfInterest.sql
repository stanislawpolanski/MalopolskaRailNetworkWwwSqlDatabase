CREATE VIEW [DataAccess].[PhotosToObjectsOfInterest]
    AS SELECT 
        Id,
        PhotoId,
        ObjectOfInterestId
        from dbo.PhotosToObjectsOfInterest
