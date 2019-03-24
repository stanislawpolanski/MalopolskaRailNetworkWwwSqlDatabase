CREATE TABLE [dbo].[StationsToGeometries]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StationId] INT NOT NULL, 
    [GeometryId] INT NULL, 
    [BeginningKmpost] DECIMAL(6, 3) NULL, 
    [CentreKmpost] DECIMAL(6, 3) NOT NULL, 
    [EndingKmpost] DECIMAL(6, 3) NULL, 
    [RailwayId] INT NOT NULL, 
    CONSTRAINT [FK_StationLocationPoints_ToStations] FOREIGN KEY ([StationId]) REFERENCES [Stations]([Id]), 
    CONSTRAINT [FK_StationLocationPoints_ToRailways] FOREIGN KEY ([RailwayId]) REFERENCES [Railways]([Id])
)

GO

CREATE INDEX [IX_StationsToGeometries_RailwayId] ON [dbo].[StationsToGeometries] ([RailwayId])

GO

CREATE INDEX [IX_StationsToGeometries_StationId] ON [dbo].[StationsToGeometries] ([StationId])
