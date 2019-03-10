CREATE TYPE [dbo].[RailwaysInsertionType] AS TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
	[Number] SMALLINT NOT NULL, 
    [Name] NVARCHAR(100) NOT NULL, 
    [OwnerId] INT NOT NULL, 
    [GeometryId] INT NULL
)
