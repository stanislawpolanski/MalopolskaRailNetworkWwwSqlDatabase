CREATE VIEW [DataAccess].[Railways]
    AS SELECT 
        Id,
        Number,
        Name,
        OwnerId,
        GeometryId
        from dbo.Railways
