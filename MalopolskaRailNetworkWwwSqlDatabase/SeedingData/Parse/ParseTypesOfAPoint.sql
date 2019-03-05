CREATE FUNCTION [dbo].[ParseTypesOfAPoint]
(
)
RETURNS @returntable TABLE
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [AbbreviatedName] NVARCHAR(5) NOT NULL
)
AS
BEGIN
    declare @json nvarchar(max) = dbo.ReadTypesOfAPointJson();
    insert into @returntable
        select * from openjson(@json)
        with(	
	        [Id] INT, 
            [AbbreviatedName] NVARCHAR(5)
        )
    return
END