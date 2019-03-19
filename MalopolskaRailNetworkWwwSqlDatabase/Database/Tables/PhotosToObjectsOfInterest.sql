CREATE TABLE [dbo].[PhotosToObjectsOfInterest]
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [ObjectOfInterestId] INT NOT NULL, 
    [PhotoId] INT NOT NULL, 
    CONSTRAINT [FK_PhotosToObjectsOfInterest_ToObjectsOfInterest] FOREIGN KEY ([ObjectOfInterestId]) REFERENCES [Stations]([Id]), 
    CONSTRAINT [FK_PhotosToObjectsOfInterest_ToTablePhotos] FOREIGN KEY ([PhotoId]) REFERENCES [Photos]([Id])
)
