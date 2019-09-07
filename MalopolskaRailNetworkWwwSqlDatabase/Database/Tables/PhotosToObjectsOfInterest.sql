CREATE TABLE [dbo].[PhotosToObjectsOfInterest]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [PhotoId] INT NOT NULL,
    [ObjectOfInterestId] INT NOT NULL, 
    CONSTRAINT [FK_PhotosToObjectsOfInterest_ToObjectsOfInterest] 
        FOREIGN KEY ([ObjectOfInterestId]) 
        REFERENCES [ObjectsOfInterest]([Id])
        on delete cascade, 
    CONSTRAINT [FK_PhotosToObjectsOfInterest_ToTablePhotos] 
        FOREIGN KEY ([PhotoId]) 
        REFERENCES [Photos]([Id]), 
    CONSTRAINT [AK_PhotosToObjectsOfInterest_ObjectOfInterestIdPhotoId] 
        UNIQUE ([PhotoId], [ObjectOfInterestId])
)
