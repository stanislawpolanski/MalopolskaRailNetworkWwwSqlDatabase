﻿CREATE FUNCTION [DataSeedInsertionSchema].[ParseOwners]
(
)
RETURNS @returntable TABLE
(
	Id int,
	Name nvarchar(max)
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadOwnersJson();
    insert into @returntable(Id, Name)
        select * from openjson(@json)
        with(Id int N'$.Id', Name nvarchar(max)  N'$.Name')
    return
END
