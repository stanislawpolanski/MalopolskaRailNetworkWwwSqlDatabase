﻿CREATE TYPE [dbo].[RollingStockInsertionType] AS TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
	[OwnerId] INT NOT NULL, 
    [Name] NVARCHAR(50) NOT NULL 
)
