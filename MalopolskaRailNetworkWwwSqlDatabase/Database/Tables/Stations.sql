CREATE TABLE [dbo].[Stations]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [TypeOfAStationId] INT NULL, 
    CONSTRAINT [FK_Stations_ToTypes] FOREIGN KEY ([TypeOfAStationId]) REFERENCES [TypesOfAStation]([Id]), 
    CONSTRAINT [FK_Stations_ToObjectsOfInterest] FOREIGN KEY ([Id]) REFERENCES [ObjectsOfInterest]([Id]) 
)
