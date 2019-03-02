CREATE TABLE [dbo].[RollingStock]
(
	[Id] INT NOT NULL PRIMARY KEY, 
	[OwnerId] INT NOT NULL, 
	[Name] NVARCHAR(50) NOT NULL, 
	CONSTRAINT [FK_RollingStock_ToOwners] FOREIGN KEY ([OwnerId]) REFERENCES [Owners]([Id]), 
    CONSTRAINT [AK_RollingStock_OwnerId_Name] UNIQUE ([OwnerId], [Name])
)
