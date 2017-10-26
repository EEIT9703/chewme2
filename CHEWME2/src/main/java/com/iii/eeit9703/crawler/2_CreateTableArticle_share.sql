--建立分享文表格

use CMDB;
go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'ArticleShare')      
BEGIN
drop table ArticleShare
END
go



create table ArticleShare(
articleID            int  IDENTITY (1,1) not null,
memId                    int,
attractionID     int,
contents          varchar(MAX),
constraint ArticleShare_primary_key primary key (articleID));

go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'attractions')
BEGIN
Alter TABLE ArticleShare ADD CONSTRAINT FK_ASA_attractionID FOREIGN KEY(attractionID) REFERENCES attractions(attractionID)
END
BEGIN
Alter TABLE ArticleShare ADD CONSTRAINT FK_ASM_memId FOREIGN KEY(memId) REFERENCES members(memId)
END
go

insert into ArticleShare values('1','1','風景好美')
insert into ArticleShare values('2','2','好漂亮')
insert into ArticleShare values('3','3','下次一定要再去')
insert into ArticleShare values('4','4','好漂亮')

select * from ArticleShare
