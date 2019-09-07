CREATE TRIGGER [DeleteStationsToGeometries]
    ON [dbo].[StationsToGeometries]
    FOR DELETE
    AS
    BEGIN
        delete from Geometries
            where Geometries.Id in (select GeometryId from deleted) 
    END
