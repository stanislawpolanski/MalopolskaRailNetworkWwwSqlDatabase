CREATE TYPE [DataSeedInsertionSchema].[StationsInsertionType] AS TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [OwnerId] INT NOT NULL, 
    [RailwayUnitId] INT NULL, 
    [TypeOfAPointId] INT NULL
)
