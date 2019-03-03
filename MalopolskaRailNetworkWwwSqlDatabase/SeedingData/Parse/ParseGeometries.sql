--CREATE FUNCTION [dbo].[Function1]
--(
--	@param1 int,
--	@param2 char(5)
--)
--RETURNS @returntable TABLE
--(
--	c1 int,
--	c2 char(5)
--)
--AS
--BEGIN
--	INSERT @returntable
--	SELECT @param1, @param2
--	RETURN
--END

declare @json nvarchar(max) = dbo.ReadGeometryJson()

select * from
	openjson(@json)
	with (
		Id int,
		Value nvarchar(max)
		)