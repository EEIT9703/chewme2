--建立分享文表格

use CMDB;
go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'ArticleShare')      
BEGIN
drop table ArticleShare
END
go


/*
create table ArticleShare(
articleID            int  IDENTITY (1,1) not null constraint ArticleShare_primary_key primary key ,
memId                    int  CONSTRAINT FK_ASM_memId REFERENCES members(memId),
attractionID     int  CONSTRAINT FK_ASA_attractionID  REFERENCES attractions(attractionID) on delete cascade,
contents          varchar(MAX)
);
*/

create table ArticleShare(
articleID            int  IDENTITY (1,1) not null,
memId                    int,
attractionID     int,
contents          varchar(MAX),
memPhoto     varchar(MAX),
constraint ArticleShare_primary_key primary key (articleID));

go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'attractions')
BEGIN
Alter TABLE ArticleShare ADD CONSTRAINT FK_ASA_attractionID FOREIGN KEY(attractionID) REFERENCES attractions(attractionID) on delete cascade
END
BEGIN
Alter TABLE ArticleShare ADD CONSTRAINT FK_ASM_memId FOREIGN KEY(memId) REFERENCES members(memId)
END
go

