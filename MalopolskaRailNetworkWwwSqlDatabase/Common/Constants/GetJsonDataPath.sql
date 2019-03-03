CREATE FUNCTION [dbo].[GetJsonDataPath]
(
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	RETURN (SELECT dbo.GetProjectRootPath()) + '\SeedingData\RawJsonData'
END
