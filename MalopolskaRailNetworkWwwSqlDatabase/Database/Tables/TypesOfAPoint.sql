CREATE TABLE [dbo].[TypesOfAPoint]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [AbbreviatedName] NVARCHAR(5) NOT NULL, 
    CONSTRAINT [AK_TypesOfAPoint_Name] UNIQUE ([AbbreviatedName])
)
