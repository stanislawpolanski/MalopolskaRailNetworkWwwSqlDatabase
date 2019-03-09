CREATE FUNCTION [dbo].[ParseGeometries]
(
)
RETURNS @returntable TABLE
(
	Id int,
	Value sys.geometry
)
AS
BEGIN
    declare @json nvarchar(max) = dbo.ReadGeometryJson()

    declare @table table
    (
	    Id int,
	    TextValue nvarchar(max)	,
	    Value sys.geometry
    )

    insert into @table (Id, TextValue)
        select * from
	        openjson(@json)
        with (Id int N'$.Id', TextValue nvarchar(max)  N'$.Value')

    update @table 
	    set Value = geometry::Parse(TextValue)

    insert into @returntable(Id, Value)
        select Id, Value
        from @table

    return
END











