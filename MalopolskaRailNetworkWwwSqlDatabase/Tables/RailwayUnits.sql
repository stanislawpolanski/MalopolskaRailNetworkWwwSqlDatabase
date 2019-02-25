CREATE TABLE [dbo].[RailwayUnits]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [GeometriesId] INT NOT NULL UNIQUE, 
    CONSTRAINT [FK_RailwayUnits_ToGeometries] FOREIGN KEY ([GeometriesId]) REFERENCES [Geometries]([Id])
)
