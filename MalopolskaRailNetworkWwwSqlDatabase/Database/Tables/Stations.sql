CREATE TABLE [dbo].[Stations]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [RailwayUnitId] INT NULL, 
    [TypeOfAPointId] INT NULL, 
    CONSTRAINT [FK_Stations_ToRailways] FOREIGN KEY ([RailwayUnitId]) REFERENCES [RailwayUnits]([Id]), 
    CONSTRAINT [FK_Stations_ToTypes] FOREIGN KEY ([TypeOfAPointId]) REFERENCES [TypesOfAPoint]([Id]), 
)
