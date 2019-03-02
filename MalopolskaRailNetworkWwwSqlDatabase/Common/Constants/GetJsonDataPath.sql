CREATE FUNCTION [dbo].[GetJsonDataPath]
(
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @RootPath NVARCHAR(150) = (SELECT dbo.GetProjectRootPath()) + '\SeedingData\RawJsonData'
	RETURN @RootPath
END
