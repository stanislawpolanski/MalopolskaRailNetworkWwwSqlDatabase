CREATE TABLE [dbo].[RailwayUnits]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [GeometriesId] INT NOT NULL UNIQUE, 
    CONSTRAINT [FK_RailwayUnits_ToGeometries] FOREIGN KEY ([GeometriesId]) REFERENCES [Geometries]([Id]), 
    CONSTRAINT [AK_RailwayUnits_Name] UNIQUE ([Name]),
	CONSTRAINT [AK_RailwayUnits_GeometriesId] UNIQUE ([GeometriesId])
)
