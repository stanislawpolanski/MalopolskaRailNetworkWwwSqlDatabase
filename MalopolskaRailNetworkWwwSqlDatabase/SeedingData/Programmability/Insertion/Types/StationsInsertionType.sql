CREATE TYPE [DataSeedInsertionSchema].[StationsInsertionType] AS TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [RailwayUnitId] INT NULL, 
    [TypeOfAPointId] INT NULL
)
