CREATE TABLE [dbo].[ObjectsOfInterest]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
	[OwnerId] INT NOT NULL, 
	[Name] NVARCHAR(50) NOT NULL, 
	CONSTRAINT [FK_ObjectsOfInterest_ToOwners] 
        FOREIGN KEY ([OwnerId]) 
        REFERENCES [Owners]([Id]), 
    CONSTRAINT [AK_ObjectsOfInterest_OwnerId_Name] UNIQUE ([OwnerId], [Name])
)
