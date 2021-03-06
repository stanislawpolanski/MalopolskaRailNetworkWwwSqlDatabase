﻿CREATE TABLE [dbo].[Railways]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
	[Number] SMALLINT NOT NULL, 
    [Name] NVARCHAR(100) NOT NULL, 
    [OwnerId] INT NOT NULL, 
    [GeometryId] INT NULL,
	-- Foreign keys
	CONSTRAINT [FK_Railways_ToOwners] FOREIGN KEY ([OwnerId]) REFERENCES [Owners]([Id]),
    CONSTRAINT [FK_Railways_ToGeometries] FOREIGN KEY ([GeometryId]) REFERENCES [Geometries]([Id]), 
	-- Unique constraints
    CONSTRAINT [AK_Railways_Name] UNIQUE ([Name])
	-- Pair of Number and OwnerId seem to be unique, but it is not. Eg PLK railway 118 - used to be Nowy Targ - Sucha Góra, now it is railway to Kraków Balice.
)

GO

CREATE INDEX [IX_Railways_OwnerId] ON [dbo].[Railways] ([OwnerId])
