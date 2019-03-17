CREATE FUNCTION [DataSeedInsertionSchema].[ParseStationsToGeometries]
(
)
RETURNS @returntable TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [StationId] INT NOT NULL, 
    [GeometryId] INT NULL, 
    [BeginningKmpost] DECIMAL(6, 3) NULL, 
    [CentreKmpost] DECIMAL(6, 3) NOT NULL, 
    [EndingKmpost] DECIMAL(6, 3) NULL, 
    [RailwayId] INT NOT NULL
)
AS
BEGIN
    declare @json nvarchar(max) = DataSeedInsertionSchema.ReadStationsToGeometriesJson();
    insert into @returntable
        select * from openjson(@json)
        with(	
	        [Id] INT, 
            [StationId] INT, 
            [GeometriesId] INT, 
            [BeginningKmpost] DECIMAL(6, 3), 
            [CentreKmpost] DECIMAL(6, 3), 
            [EndingKmpost] DECIMAL(6, 3), 
            [RailwayId] INT
            )

        update @returntable
        set [RailwayId] = 10118
        where [RailwayId] = 28 and [GeometryId] is not null
    return
END