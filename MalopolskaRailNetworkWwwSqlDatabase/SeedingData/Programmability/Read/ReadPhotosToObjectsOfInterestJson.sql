﻿CREATE FUNCTION [DataSeedInsertionSchema].[ReadPhotosToObjectsOfInterestJson]
(
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	declare @json nvarchar(max)
	SELECT @json = BulkColumn 
	FROM OPENROWSET
		(BULK 'C:\Users\Dell\source\repos\MalopolskaRailNetworkWwwSqlDatabase\MalopolskaRailNetworkWwwSqlDatabase\SeedingData\RawJson\PhotosToObjects_Dataset.json',
		SINGLE_CLOB) as j
	RETURN  @json
END
