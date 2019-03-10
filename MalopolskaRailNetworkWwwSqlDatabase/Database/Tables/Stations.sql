CREATE TABLE [dbo].[Stations]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [OwnerId] INT NOT NULL, 
    [RailwayUnitId] INT NULL, 
    [TypeOfAPointId] INT NOT NULL, 
    CONSTRAINT [FK_Stations_ToOwners] FOREIGN KEY ([OwnerId]) REFERENCES [Owners]([Id]), 
    CONSTRAINT [FK_Stations_ToRailways] FOREIGN KEY ([RailwayUnitId]) REFERENCES [RailwayUnits]([Id]), 
    CONSTRAINT [FK_Stations_ToTypes] FOREIGN KEY ([TypeOfAPointId]) REFERENCES [TypesOfAPoint]([Id]), 
    CONSTRAINT [AK_Stations_Name] UNIQUE ([Name])
)
