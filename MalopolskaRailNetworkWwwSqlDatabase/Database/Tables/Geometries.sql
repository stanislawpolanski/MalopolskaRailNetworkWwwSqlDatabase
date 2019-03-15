CREATE TABLE [dbo].[Geometries]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [SpatialData] [sys].[Geometry] NOT NULL
)
