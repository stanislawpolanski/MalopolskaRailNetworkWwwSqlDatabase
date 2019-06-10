CREATE FUNCTION [DataSeedInsertionSchema].[ParseRailwayUnits]
(
)
RETURNS @returntable TABLE
(
	Id int,
	Name nvarchar(max),
    GeometriesId int,
    OwnerId int
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadRailwayUnitsJson();
    insert into @returntable(Id, Name, GeometriesId, OwnerId)
        select * from openjson(@json)
        with(Id int N'$.Id', Name nvarchar(max)  N'$.Name', GeometriesId int, OwnerId int)
    return
END
