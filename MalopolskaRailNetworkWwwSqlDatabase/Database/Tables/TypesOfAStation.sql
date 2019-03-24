CREATE TABLE [dbo].[TypesOfAStation]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [AbbreviatedName] NVARCHAR(5) NOT NULL, 
    CONSTRAINT [AK_TypesOfAStation_Name] UNIQUE ([AbbreviatedName])
)
