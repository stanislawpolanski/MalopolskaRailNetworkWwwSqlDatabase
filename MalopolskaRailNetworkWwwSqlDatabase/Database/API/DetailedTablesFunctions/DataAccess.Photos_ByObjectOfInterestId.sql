CREATE FUNCTION [DataAccess].[Photos_ByObjectOfInterestId]
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    select
    DataAccess.Photos.Id,
    DataAccess.Photos.FilePath,
    DataAccess.Photos.AdditionDateTime,
    DataAccess.Photos.PhotoDescription
    from DataAccess.Photos
	left join DataAccess.PhotosToObjectsOfInterest
		on DataAccess.Photos.Id = DataAccess.PhotosToObjectsOfInterest.PhotoId
	where DataAccess.PhotosToObjectsOfInterest.ObjectOfInterestId = @id
)
