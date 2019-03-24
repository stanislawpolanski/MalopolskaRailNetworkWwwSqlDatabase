CREATE TABLE [dbo].[Photos]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FilePath] NVARCHAR(50) NOT NULL, 
    [AdditionDateTime] DATETIME2 NULL, 
    [PhotoDescription] NVARCHAR(500) NULL, 
    CONSTRAINT [CK_Photos_FilePath] CHECK (FilePath LIKE '%.jpg'), 
    CONSTRAINT [AK_Photos_FilePath] UNIQUE ([FilePath]) 
)
