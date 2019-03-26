CREATE FUNCTION [DataAccess].[Railways_ByStationId]
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    select 
	    DataAccess.Railways.Id,
        DataAccess.Railways.Number,
        DataAccess.Railways.Name,
        DataAccess.Railways.OwnerId,
        DataAccess.Railways.GeometryId

	    from DataAccess.Railways
	    left join DataAccess.StationsToGeometries 
		    on DataAccess.Railways.Id = DataAccess.StationsToGeometries.RailwayId
	    left join DataAccess.Stations
	    on DataAccess.StationsToGeometries.StationId = DataAccess.Stations.Id
	    where DataAccess.Stations.Id = @id
)
