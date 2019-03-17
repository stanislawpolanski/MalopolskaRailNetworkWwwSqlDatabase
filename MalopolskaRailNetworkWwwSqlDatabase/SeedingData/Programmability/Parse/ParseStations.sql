CREATE FUNCTION [DataSeedInsertionSchema].[ParseStations]
(
)
RETURNS @returntable TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [OwnerId] INT NOT NULL, 
    [RailwayUnitId] INT NULL, 
    [TypeOfAPointId] INT
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadStationsJson();
    insert into @returntable
        select * from openjson(@json)
        with(	
	        [Id] INT, 
            [Name] NVARCHAR(50), 
            [OwnerId] INT, 
            [RailwayUnitId] INT, 
            [TypeOfAPoint] INT
            )
    return
END