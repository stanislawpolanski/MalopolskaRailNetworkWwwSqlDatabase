﻿CREATE TYPE [DataSeedInsertionSchema].[GeometriesInsertionType] AS TABLE
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [SpatialData] [sys].[Geometry] NOT NULL
)
