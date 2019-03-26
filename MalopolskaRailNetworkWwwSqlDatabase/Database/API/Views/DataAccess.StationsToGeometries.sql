CREATE VIEW [DataAccess].[StationsToGeometries]
    AS SELECT 
        Id,
        StationId,
        GeometryId,
        BeginningKmpost,
        CentreKmpost,
        EndingKmpost,
        RailwayId
        from dbo.StationsToGeometries
