CREATE TRIGGER [On_Stations_WithRailwayUnitId_OnInsertUpdate]
ON [dbo].[StationsToGeometries]
INSTEAD OF INSERT, UPDATE
AS
BEGIN
    -- select geometryId from stations to geometries
    declare @stationGeometryId int null
    select @stationGeometryId = inserted.GeometryId

    declare @unitGeometryId int null
    select @unitGeometryId = inserted.RailwayUnitId
    -- if is not null then (else -> end)
    if(@stationGeometryId is not null)
    begin
       -- select geometry by geometryId from station to geoms.
        declare @unitGeometry sys.Geometry
        select @unitGeometry = DataAccess.Geometries.SpatialData from DataAccess.Geometries
            left join DataAccess.StationsToGeometries on DataAccess.Geometries.Id = DataAccess.StationsToGeometries.EndingKmpost
            where DataAccess.Geometries.Id = @
        -- select railway unit id from stations where station id = insert station id
        -- select railway unit geometry by id
        -- unit.intersection(station geometry) -> if null then raise error
    end
END