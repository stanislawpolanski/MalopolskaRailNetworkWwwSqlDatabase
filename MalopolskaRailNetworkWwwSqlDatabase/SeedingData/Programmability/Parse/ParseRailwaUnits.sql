CREATE FUNCTION [DataSeedInsertionSchema].[ParseRailwayUnits]
(
)
RETURNS @returntable TABLE
(
	Id int,
	Name nvarchar(max),
    GeometriesId int
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadRailwayUnitsJson();
    insert into @returntable(Id, Name, GeometriesId)
        select * from openjson(@json)
        with(Id int N'$.Id', Name nvarchar(max)  N'$.Name', GeometriesId int)
    return
END
