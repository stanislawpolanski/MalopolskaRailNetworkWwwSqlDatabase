﻿CREATE FUNCTION [DataSeedInsertionSchema].[ParsePhotosToObjects]
(
)
RETURNS @returntable TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [PhotoId] INT NOT NULL,
    [ObjectOfInterestId] INT NOT NULL
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadPhotosToObjectsJson();
    insert into @returntable
        select * from openjson(@json)
        with(Id int N'$.Id', PhotoId int N'$.PhotoId', ObjectOfInterestId int N'$.ObjectId')
    return
END