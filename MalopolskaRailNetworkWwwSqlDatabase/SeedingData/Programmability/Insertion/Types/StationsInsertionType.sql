CREATE TYPE [DataSeedInsertionSchema].[StationsInsertionType] AS TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [TypeOfAStationId] INT NULL
)
