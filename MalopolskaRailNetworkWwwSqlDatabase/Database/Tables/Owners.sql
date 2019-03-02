CREATE TABLE [dbo].[Owners]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [AK_Owners_Name] UNIQUE ([Name])
)
