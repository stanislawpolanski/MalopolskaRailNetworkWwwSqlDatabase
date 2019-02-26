CREATE TABLE [dbo].[Geometries]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Value] [sys].[geography] NOT NULL, 
    CONSTRAINT [AK_Geometries_Value] UNIQUE ([Value])
)
