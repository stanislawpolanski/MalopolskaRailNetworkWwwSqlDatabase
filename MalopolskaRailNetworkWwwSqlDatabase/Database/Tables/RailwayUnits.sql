CREATE TABLE [dbo].[RailwayUnits]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [GeometriesId] INT NOT NULL UNIQUE, 
    [OwnerId] INT NOT NULL,
    CONSTRAINT [FK_RailwayUnits_ToGeometries] FOREIGN KEY ([GeometriesId]) REFERENCES [Geometries]([Id]), 
    CONSTRAINT [AK_RailwayUnits_Name] UNIQUE ([Name]),
	CONSTRAINT [AK_RailwayUnits_GeometriesId] UNIQUE ([GeometriesId]), 
    CONSTRAINT [FK_RailwayUnits_ToOwners] FOREIGN KEY ([OwnerId]) REFERENCES [Owners]([Id])
)
