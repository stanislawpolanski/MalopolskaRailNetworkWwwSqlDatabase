---- Post deployment data insertion
-- Types of a Point
declare @TypesOfAPointSeed DataSeedInsertionSchema.TypesOfAPointInsertionType;
insert into @TypesOfAPointSeed
    select * from DataSeedInsertionSchema.ParseTypesOfAPoint()

exec DataSeedInsertionSchema.InsertSeedTypesOfAPointIntoDatabase @TypesOfAPointSeed;

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

-- Photos table seed
declare @PhotosSeed DataSeedInsertionSchema.PhotosInsertionType;
insert into @PhotosSeed
    select * from DataSeedInsertionSchema.ParsePhotos();

exec DataSeedInsertionSchema.InsertSeedPhotosIntoDatabase @PhotosSeed;

-- Photos to objects table
declare @PhotosToObjectsOfInterestSeed DataSeedInsertionSchema.PhotosToObjectsOfInterestInsertionType;
insert into @PhotosToObjectsOfInterestSeed
    select * from DataSeedInsertionSchema.ParsePhotosToObjectsOfInterest();

exec DataSeedInsertionSchema.InsertSeedPhotosToObjectsOfInterestIntoDatabase @PhotosToObjectsOfInterestSeed

-- clear database 
drop procedure DataSeedInsertionSchema.InsertSeedGeometriesIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedOwnersIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedRailwaysIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedRailwayUnitsIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedRollingStockIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedStationsIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedStationsToGeometriesIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedTypesOfAPointIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedPhotosIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedPhotosToObjectsOfInterestIntoDatabase

drop function DataSeedInsertionSchema.ParseGeometries
drop function DataSeedInsertionSchema.ParseRailways
drop function DataSeedInsertionSchema.ParseRollingStock
drop function DataSeedInsertionSchema.ParseOwners
drop function DataSeedInsertionSchema.ParseRailwayUnits
drop function DataSeedInsertionSchema.ParseStations
drop function DataSeedInsertionSchema.ParseStationsToGeometries
drop function DataSeedInsertionSchema.ParseTypesOfAPoint
drop function DataSeedInsertionSchema.ParsePhotos
drop function DataSeedInsertionSchema.ParsePhotosToObjectsOfInterest

drop function DataSeedInsertionSchema.ReadGeometriesJson
drop function DataSeedInsertionSchema.ReadOwnersJson
drop function DataSeedInsertionSchema.ReadRailwaysJson
drop function DataSeedInsertionSchema.ReadRailwayUnitsJson
drop function DataSeedInsertionSchema.ReadRollingStockJson
drop function DataSeedInsertionSchema.ReadStationsJson
drop function DataSeedInsertionSchema.ReadStationsToGeometriesJson
drop function DataSeedInsertionSchema.ReadTypesOfAPointJson
drop function DataSeedInsertionSchema.ReadPhotosJson
drop function DataSeedInsertionSchema.ReadPhotosToObjectsOfInterestJson

use MalopolskaRailNetworkWwwSqlDatabase
drop type DataSeedInsertionSchema.GeometriesInsertionType
drop type DataSeedInsertionSchema.OwnersInsertionType
drop type DataSeedInsertionSchema.RailwaysInsertionType
drop type DataSeedInsertionSchema.RailwayUnitsInsertionType
drop type DataSeedInsertionSchema.RollingStockInsertionType
drop type DataSeedInsertionSchema.StationsInsertionType
drop type DataSeedInsertionSchema.StationsToGeometriesInsertionType
drop type DataSeedInsertionSchema.TypesOfAPointInsertionType
drop type DataSeedInsertionSchema.PhotosInsertionType
drop type DataSeedInsertionSchema.PhotosToObjectsOfInterestInsertionType