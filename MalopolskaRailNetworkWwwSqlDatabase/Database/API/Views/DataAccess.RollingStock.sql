CREATE VIEW [DataAccess].[RollingStock]
    AS SELECT 
        dbo.ObjectsOfInterest.Id,
        dbo.ObjectsOfInterest.OwnerId,
        dbo.ObjectsOfInterest.Name
        from dbo.ObjectsOfInterest
		left join dbo.Stations
		    on dbo.ObjectsOfInterest.Id = dbo.Stations.Id
		where dbo.Stations.Id is null
