CREATE FUNCTION [DataSeedInsertionSchema].[ParseStations]
(
)
RETURNS @returntable TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [OwnerId] INT NOT NULL, 
    [TypeOfAStationId] INT
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
            [TypeOfAStation] INT
            )
    return
END