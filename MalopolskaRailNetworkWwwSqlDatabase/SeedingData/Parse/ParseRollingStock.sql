CREATE FUNCTION [dbo].[ParseRollingStock]
(
)
RETURNS @returntable TABLE
(
	Id int,
	OwnerId int,
    Name nvarchar(50)
)
AS
BEGIN
    declare @json nvarchar(max) = dbo.ReadRollingStockJson();
    insert into @returntable(Id, OwnerId, Name)
        select * from openjson(@json)
        with(Id int N'$.Id', OwnerId int, Name nvarchar(50))
    return
END
