CREATE TRIGGER [DeleteStationToGeometries]
    ON [dbo].[StationsToGeometries]
    FOR DELETE
    AS
    BEGIN
        SET NOCOUNT ON

        delete
            from dbo.Geometries
            where exists (select 1 from deleted where deleted.GeometryId = dbo.Geometries.Id)
    END
