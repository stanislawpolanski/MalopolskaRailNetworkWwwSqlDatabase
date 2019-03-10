CREATE TYPE [dbo].[GeometriesInsertionType] AS TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [Value] [sys].[Geometry] NOT NULL
)
