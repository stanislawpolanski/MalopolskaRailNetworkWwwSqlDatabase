CREATE FUNCTION [DataSeedInsertionSchema].[ParsePhotos]
(
)
RETURNS @returntable TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [FilePath] NVARCHAR(50) NOT NULL, 
    [AdditionDateTime] DATETIME2 NULL, 
    [PhotoDescription] NVARCHAR(500) NULL
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadPhotosJson();
    insert into @returntable(Id, FilePath, AdditionDateTime, PhotoDescription)
        select * from openjson(@json)
        with(Id int N'$.Id', FilePath nvarchar(50) N'$.FilePath', AdditionDateTime datetime2 N'$.AdditionDateTime', PhotoDescription nvarchar(500) N'$.Description')
    return
END
