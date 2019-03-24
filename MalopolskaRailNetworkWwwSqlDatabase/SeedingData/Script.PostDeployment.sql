---- Post deployment data insertion
-- Types of a Point
declare @TypesOfAStationSeed DataSeedInsertionSchema.TypesOfAStation_InsertionType;
insert into @TypesOfAStationSeed
    select * from DataSeedInsertionSchema.ParseTypesOfAPoint()

exec DataSeedInsertionSchema.Merge_TypesOfAPoint_IntoTypesOfAStation @TypesOfAStationSeed;

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

-- Rolling stock into objects of interest
declare @RollingStockSeed DataSeedInsertionSchema.ObjectsOfInterestInsertionType;
insert into @RollingStockSeed
    select * from DataSeedInsertionSchema.ParseRollingStock();

exec DataSeedInsertionSchema.Merge_RollingStock_IntoObjectsOfInterest @RollingStockSeed;

-- Insert stations into stations
declare @StationsSeed DataSeedInsertionSchema.StationsInsertionType;
insert into @StationsSeed (Id, RailwayUnitId, TypeOfAPointId)
    select Id, RailwayUnitId, TypeOfAPointId from DataSeedInsertionSchema.ParseStations();

exec DataSeedInsertionSchema.Merge_Stations_IntoStations @StationsSeed;

-- Insert stations into objects of interest
declare @Stations_ToObjectsOfInterest_Seed DataSeedInsertionSchema.ObjectsOfInterestInsertionType;
insert into @Stations_ToObjectsOfInterest_Seed (Id, OwnerId, Name)
    select Id, OwnerId, Name from DataSeedInsertionSchema.ParseStations();

exec DataSeedInsertionSchema.Merge_Stations_IntoObjectsOfInterest @Stations_ToObjectsOfInterest_Seed;

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

-- Photos to objects of interest table
declare @PhotosToObjectsOfInterestSeed DataSeedInsertionSchema.PhotosToObjectsOfInterestInsertionType;
insert into @PhotosToObjectsOfInterestSeed
    select * from DataSeedInsertionSchema.ParsePhotosToObjectsOfInterest();

exec DataSeedInsertionSchema.InsertSeedPhotosToObjectsOfInterestIntoDatabase @PhotosToObjectsOfInterestSeed

-- clear database 
drop procedure DataSeedInsertionSchema.InsertSeedGeometriesIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedOwnersIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedRailwaysIntoDatabase
drop procedure DataSeedInsertionSchema.InsertSeedRailwayUnitsIntoDatabase
drop procedure DataSeedInsertionSchema.Merge_RollingStock_IntoObjectsOfInterest
drop procedure DataSeedInsertionSchema.Merge_Stations_IntoStations
drop procedure DataSeedInsertionSchema.Merge_Stations_IntoObjectsOfInterest
drop procedure DataSeedInsertionSchema.InsertSeedStationsToGeometriesIntoDatabase
drop procedure DataSeedInsertionSchema.Merge_TypesOfAPoint_IntoTypesOfAStation
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
drop type DataSeedInsertionSchema.ObjectsOfInterestInsertionType
drop type DataSeedInsertionSchema.StationsInsertionType
drop type DataSeedInsertionSchema.StationsToGeometriesInsertionType
drop type DataSeedInsertionSchema.TypesOfAStation_InsertionType
drop type DataSeedInsertionSchema.PhotosInsertionType
drop type DataSeedInsertionSchema.PhotosToObjectsOfInterestInsertionType