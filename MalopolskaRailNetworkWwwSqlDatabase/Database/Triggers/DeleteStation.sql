CREATE TRIGGER [DeleteStation]
    ON [dbo].[Stations]
    FOR DELETE
    AS
    BEGIN
        SET NOCOUNT ON

        delete from dbo.StationsToGeometries
        where exists (select 1 from deleted where deleted.Id = dbo.StationsToGeometries.StationId)
    END
