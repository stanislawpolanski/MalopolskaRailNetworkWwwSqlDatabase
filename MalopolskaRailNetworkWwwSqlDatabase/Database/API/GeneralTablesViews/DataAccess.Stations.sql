CREATE VIEW [DataAccess].[Stations]
    AS SELECT 
        dbo.ObjectsOfInterest.Id,
        dbo.ObjectsOfInterest.OwnerId,
        dbo.ObjectsOfInterest.Name,
		dbo.Stations.TypeOfAStationId
        from dbo.ObjectsOfInterest
		left join dbo.Stations
		    on dbo.ObjectsOfInterest.Id = dbo.Stations.Id
		where dbo.Stations.Id is not null