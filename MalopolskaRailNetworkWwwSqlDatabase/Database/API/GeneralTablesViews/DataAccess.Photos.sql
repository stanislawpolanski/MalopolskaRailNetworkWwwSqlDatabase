﻿CREATE VIEW [DataAccess].[Photos]
    AS SELECT 
        Id,
        FilePath,
        AdditionDateTime,
        PhotoDescription
        from dbo.Photos