---- Post deployment data insertion
-- geometries
declare @GeometriesSeed DataSeedInsertionSchema.GeometriesInsertionType
insert into @GeometriesSeed
    select * from DataSeedInsertionSchema.ParseGeometries();
    
exec DataSeedInsertionSchema.InsertSeedGeometriesIntoDatabase @GeometriesSeed;

-- owners
declare @OnwersSeed DataSeedInsertionSchema.OwnersInsertionType;
insert into @OnwersSeed
    select * from DataSeedInsertionSchema.ParseOwners();

exec DataSeedInsertionSchema.InsertSeedOwnersIntoDatabase @OnwersSeed;

-- railways
declare @RailwaysSeed DataSeedInsertionSchema.RailwaysInsertionType;
insert into @RailwaysSeed
    select * from DataSeedInsertionSchema.ParseRailways();

exec DataSeedInsertionSchema.InsertSeedRailwaysIntoDatabase @RailwaysSeed;

-- railway units
declare @RailwayUnitsSeed DataSeedInsertionSchema.RailwayUnitsInsertionType;
insert into @RailwayUnitsSeed
    select * from DataSeedInsertionSchema.ParseRailwayUnits();

exec DataSeedInsertionSchema.InsertSeedRailwayUnitsIntoDatabase @RailwayUnitsSeed;

-- Rolling stock
declare @RollingStockSeed DataSeedInsertionSchema.RollingStockInsertionType;
insert into @RollingStockSeed
    select * from DataSeedInsertionSchema.ParseRollingStock();

exec DataSeedInsertionSchema.InsertSeedRollingStockIntoDatabase @RollingStockSeed;

-- Stations
declare @StationsSeed DataSeedInsertionSchema.StationsInsertionType;
insert into @StationsSeed
    select * from DataSeedInsertionSchema.ParseStations();

exec DataSeedInsertionSchema.InsertSeedStationsIntoDatabase @StationsSeed;

-- Stations to geometries
declare @StationsToGeometriesSeed DataSeedInsertionSchema.StationsToGeometriesInsertionType;
insert into @StationsToGeometriesSeed
    select * from DataSeedInsertionSchema.ParseStationsToGeometries();

exec DataSeedInsertionSchema.InsertSeedStationsToGeometriesIntoDatabase @StationsToGeometriesSeed;

-- Types of a Point
declare @TypesOfAPointSeed DataSeedInsertionSchema.TypesOfAPointInsertionType;
insert into @TypesOfAPointSeed
    select * from DataSeedInsertionSchema.ParseTypesOfAPoint()

exec DataSeedInsertionSchema.InsertSeedTypesOfAPointIntoDatabase @TypesOfAPointSeed;