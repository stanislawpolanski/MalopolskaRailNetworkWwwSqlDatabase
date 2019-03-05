CREATE TABLE [dbo].[StationLocationPoints]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [StationId] INT NOT NULL, 
    [GeometryId] INT NULL, 
    [BeginningKmpost] DECIMAL(6, 3) NULL, 
    [CentreKmpost] DECIMAL(6, 3) NOT NULL, 
    [EndingKmpost] DECIMAL(6, 3) NULL, 
    [RailwayId] INT NOT NULL, 
    CONSTRAINT [FK_StationLocationPoints_ToStations] FOREIGN KEY ([StationId]) REFERENCES [Stations]([Id]), 
    CONSTRAINT [FK_StationLocationPoints_ToRailways] FOREIGN KEY ([RailwayId]) REFERENCES [Railways]([Id])
)
