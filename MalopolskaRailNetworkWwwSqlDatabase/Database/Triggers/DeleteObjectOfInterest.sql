CREATE TRIGGER [DeleteObjectOfInterest]
    ON [dbo].[ObjectsOfInterest]
    FOR DELETE
    AS
    BEGIN
        SET NOCOUNT ON

        delete from dbo.PhotosToObjectsOfInterest
        where exists (select 1 
            from deleted 
            where deleted.Id = dbo.PhotosToObjectsOfInterest.ObjectOfInterestId)
    END
