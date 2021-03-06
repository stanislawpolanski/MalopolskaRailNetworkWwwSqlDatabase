﻿CREATE FUNCTION [DataSeedInsertionSchema].[ParseGeometries]
(
)
RETURNS @returntable TABLE
(
	Id int,
	Value sys.geometry
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.[ReadGeometriesJson]()

    declare @table table
    (
	    Id int,
	    TextValue nvarchar(max)	,
	    SpatialData sys.geometry
    )

    insert into @table (Id, TextValue)
        select * from
	        openjson(@json)
        with (Id int N'$.Id', TextValue nvarchar(max)  N'$.Value')

    update @table 
	    set SpatialData = Geometry::Parse(TextValue)

    insert into @returntable(Id, Value)
        select Id, SpatialData
        from @table

    return
END











