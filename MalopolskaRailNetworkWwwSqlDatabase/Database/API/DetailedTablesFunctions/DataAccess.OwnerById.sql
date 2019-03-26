CREATE FUNCTION [DataAccess].[OwnerById]
(
    @id int
)
RETURNS TABLE
AS
RETURN
(
    select * from DataAccess.Owners as owners where owners.Id = @id
)
