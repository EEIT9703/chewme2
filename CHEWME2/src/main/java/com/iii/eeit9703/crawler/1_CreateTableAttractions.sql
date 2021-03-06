--建立景點表格
use CMDB;
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'attractions')      
BEGIN
drop table attractions
END
go



create table attractions(
attractionID      int IDENTITY (1,1) not null,
name                   varchar(50),
county                varchar(20),
type                     varchar(20),
address              varchar(100),
tel                         varchar(50),
intro                    varchar(MAX),
image                 varbinary(MAX),
constraint attractions_primary_key primary key (attractionID));
