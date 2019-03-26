CREATE FUNCTION [DataAccess].[GeometryById]
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    select * from DataAccess.Geometries as geoms where geoms.Id = @id
)
