CREATE TYPE [DataSeedInsertionSchema].[TypesOfAStation_InsertionType] AS TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [AbbreviatedName] NVARCHAR(5) NOT NULL
)
