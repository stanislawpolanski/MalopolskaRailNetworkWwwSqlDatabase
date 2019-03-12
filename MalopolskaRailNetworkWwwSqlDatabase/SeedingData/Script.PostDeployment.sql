---- Post deployment data insertion
-- geometries
declare @GeometriesSeed dbo.GeometriesInsertionType
insert into @GeometriesSeed
    select * from dbo.ParseGeometries();

exec dbo.InsertSeedGeometriesIntoDatabase @GeometriesSeed;

-- owners
declare @OnwersSeed dbo.OwnersInsertionType;
insert into @OnwersSeed
    select * from dbo.ParseOwners();

exec dbo.InsertSeedOwnersIntoDatabase @OnwersSeed;

-- railways
declare @RailwaysSeed dbo.RailwaysInsertionType;
insert into @RailwaysSeed
    select * from dbo.ParseRailways();

exec dbo.InsertSeedRailwaysIntoDatabase @RailwaysSeed;

-- railway units
declare @RailwayUnitsSeed dbo.RailwayUnitsInsertionType;
insert into @RailwayUnitsSeed
    select * from dbo.ParseRailwayUnits();

exec dbo.InsertSeedRailwayUnitsIntoDatabase @RailwayUnitsSeed;

-- Rolling stock
declare @RollingStockSeed dbo.RollingStockInsertionType;
insert into @RollingStockSeed
    select * from dbo.ParseRollingStock();

exec dbo.InsertSeedRollingStockIntoDatabase @RollingStockSeed;

-- Stations
declare @StationsSeed dbo.StationsInsertionType;
insert into @StationsSeed
    select * from dbo.ParseStations();

exec dbo.InsertSeedStationsIntoDatabase @StationsSeed;

-- Stations to geometries
declare @StationsToGeometriesSeed dbo.StationsToGeometriesInsertionType;
insert into @StationsToGeometriesSeed
    select * from dbo.ParseStationsToGeometries();

exec dbo.InsertSeedStationsToGeometriesIntoDatabase @StationsToGeometriesSeed;

-- Types of a Point
declare @TypesOfAPointSeed dbo.TypesOfAPointInsertionType;
insert into @TypesOfAPointSeed
    select * from dbo.ParseTypesOfAPoint()

exec dbo.InsertSeedTypesOfAPointIntoDatabase @TypesOfAPointSeed;