CREATE TYPE [dbo].[RailwayUnitsInsertionType] AS TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [GeometriesId] INT NOT NULL UNIQUE
)
