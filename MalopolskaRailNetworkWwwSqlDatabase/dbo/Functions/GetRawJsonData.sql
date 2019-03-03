CREATE FUNCTION [dbo].[GetRawJson]
(
)
RETURNS @returntable TABLE
(
	Name nvarchar(max),
	Value nvarchar(max)
)
AS
BEGIN
	insert into @returntable (Name)
	values 
		('Geometries_Dataset.json'),
		('Owners_Dataset.json'),
		('Railways_Dataset.json'),
		('RailwayUnits_Dataset.json'),
		('RollingStock_Dataset.json'),
		('Stations_Dataset.json'),
		('StationsToGeomteries_Dataset.json'),
		('TypesOfAPoint_Dataset.json')
	RETURN
END