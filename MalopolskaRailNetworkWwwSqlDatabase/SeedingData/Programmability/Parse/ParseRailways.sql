CREATE FUNCTION [DataSeedInsertionSchema].[ParseRailways]
(
)
RETURNS @returntable TABLE
(
	Id int,
	Number smallint,
    Name nvarchar(100),
    OwnerId int,
    GeometryId int NULL
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadRailwaysJson();
    insert into @returntable(Id, Number, Name, OwnerId, GeometryId)
        select * from openjson(@json)
        with(	
            Id int,
	        Number smallint,
            Name nvarchar(100),
            OwnerId int,
            GeometryId int
            )
    return
END