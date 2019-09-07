CREATE TABLE [dbo].[StationsToGeometries]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [StationId] INT NOT NULL, 
    [GeometryId] INT NULL, 
    [BeginningKmpost] DECIMAL(6, 3) NULL, 
    [CentreKmpost] DECIMAL(6, 3) NOT NULL, 
    [EndingKmpost] DECIMAL(6, 3) NULL, 
    [RailwayId] INT NOT NULL, 
    CONSTRAINT [FK_StationsToGeometries_ToStations] 
        FOREIGN KEY ([StationId]) 
        REFERENCES [Stations]([Id]) 
        on delete cascade, 
    CONSTRAINT [FK_StationsToGeometries_ToRailways] FOREIGN KEY ([RailwayId]) REFERENCES [Railways]([Id]),
    CONSTRAINT [FK_StationsToGeometries_ToGeometries] FOREIGN KEY ([GeometryId]) REFERENCES [Geometries]([Id]), 
    CONSTRAINT [CK_StationsToGeometries_BeginningKmpost_LessOrEqual_CentreKmpost] CHECK (BeginningKmpost is null or BeginningKmpost <= CentreKmpost), 
    CONSTRAINT [CK_StationsToGeometries_CentreKmpost_LessOrEqual_EndingKmpost] CHECK (EndingKmpost is null or CentreKmpost <= EndingKmpost)
)

GO

CREATE INDEX [IX_StationsToGeometries_RailwayId] ON [dbo].[StationsToGeometries] ([RailwayId])

GO

CREATE INDEX [IX_StationsToGeometries_StationId] ON [dbo].[StationsToGeometries] ([StationId])
