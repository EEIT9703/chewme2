--建立分享文表格

use CMDB;
go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'article_share')      
BEGIN
drop table article_share
END
go



create table article_share(
articleID            int  IDENTITY (1,1) not null,
mId                    int,
attractionID     int,
contents          varchar(MAX),
constraint article_share_primary_key primary key (articleID));

go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'attractions')
BEGIN
Alter TABLE article_share ADD CONSTRAINT FK_IC_attractionID FOREIGN KEY(attractionID) REFERENCES attractions(attractionID)
END
BEGIN
Alter TABLE article_share ADD CONSTRAINT FK_IC_mId FOREIGN KEY(mId) REFERENCES members(mId)
END
go

insert into article_share values('1','1','風景好美')
insert into article_share values('2','2','好漂亮')
insert into article_share values('3','3','下次一定要再去')
insert into article_share values('4','4','好漂亮')

select * from article_share
