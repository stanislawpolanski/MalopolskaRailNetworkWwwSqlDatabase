CREATE FUNCTION [DataAccess].[StationToGeometries_ByStationId]
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    select * from dbo.StationsToGeometries
	    where StationId = @id
)
