CREATE FUNCTION [DataAccess].[StationById]
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    select * from DataAccess.Stations as stations where stations.Id = @Id
)
