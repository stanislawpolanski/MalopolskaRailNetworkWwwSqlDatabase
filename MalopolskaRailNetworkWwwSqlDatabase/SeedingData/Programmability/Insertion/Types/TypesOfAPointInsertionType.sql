﻿CREATE TYPE [DataSeedInsertionSchema].[TypesOfAPointInsertionType] AS TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [AbbreviatedName] NVARCHAR(5) NOT NULL
)
