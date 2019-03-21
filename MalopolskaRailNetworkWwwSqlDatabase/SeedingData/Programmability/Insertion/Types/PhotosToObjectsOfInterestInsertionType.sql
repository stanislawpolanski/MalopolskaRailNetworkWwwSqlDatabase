CREATE TYPE [DataSeedInsertionSchema].[PhotosToObjectsOfInterestInsertionType] AS TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [PhotoId] INT NOT NULL,
    [ObjectOfInterestId] INT NOT NULL
)
