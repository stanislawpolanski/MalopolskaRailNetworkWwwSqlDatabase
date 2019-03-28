CREATE TRIGGER [On_Stations_WithRailwayUnitId_OnInsertUpdate]
ON [dbo].[StationsToGeometries]
FOR INSERT, UPDATE
AS
BEGIN
    -- select geometryId from stations to geometries
    -- if is not null then (else -> end)
       -- select geometry by geometryId from station to geoms.
       -- select railway unit id from stations where station id = insert station id
       -- select railway unit geometry by id
       -- unit.intersection(station geometry) -> if null then raise error
END