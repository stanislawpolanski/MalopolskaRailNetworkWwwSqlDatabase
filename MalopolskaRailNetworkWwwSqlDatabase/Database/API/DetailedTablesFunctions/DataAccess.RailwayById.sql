CREATE FUNCTION [DataAccess].[RailwayById]
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    select * from DataAccess.Railways as railways where railways.Id = @id
)
