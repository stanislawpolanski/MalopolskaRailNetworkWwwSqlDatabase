CREATE TYPE [DataSeedInsertionSchema].[PhotosInsertionType] AS TABLE
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FilePath] NVARCHAR(50) NOT NULL, 
    [AdditionDateTime] DATETIME2 NULL, 
    [PhotoDescription] NVARCHAR(500) NULL
)
