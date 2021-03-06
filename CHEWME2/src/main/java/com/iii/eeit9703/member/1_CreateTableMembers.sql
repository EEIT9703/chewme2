USE CMDB;
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'm_friends_lists')
BEGIN
IF (OBJECT_ID('mfriendslists_foreign_key', 'F') IS NOT NULL)
BEGIN
    Alter TABLE m_friends_lists DROP CONSTRAINT mfriendslists_foreign_key
END
END
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'msg_rooms')
BEGIN
IF (OBJECT_ID('msg_rooms_foreign_key', 'F') IS NOT NULL)
BEGIN
    Alter TABLE msg_rooms DROP CONSTRAINT msg_rooms_foreign_key
END
END
go


IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'members')      
BEGIN
drop table members
END
go


CREATE TABLE members(
memId         int IDENTITY (1,1) not null UNIQUE,
memberId    varchar(30) not null UNIQUE ,
memName       nvarchar(20) not null,
memNickN      nvarchar(20) UNIQUE,
memPwd        varchar(32) not null,
memBirthday   date,
memMail       varchar(50),
memAddr       nvarchar(max),
memPhone      varchar(15),
memIntr       nvarchar(max),
memPhoto      varchar(max),
memStatus     nvarchar(20),
memRole       nvarchar(20),

CONSTRAINT members_primary_key PRIMARY KEY(memId),
);

INSERT INTO members(memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memStatus,memRole) 
VALUES('eeit970301','蔡家華','番薯島小霸王','eeit970301','1990/10/11','eeit970301@gmail.com','台北市大安區和平東路1號','0912-345-678','哇哈哈哈哈','正常','一般會員')
INSERT INTO members(memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memStatus,memRole)  
VALUES('eeit970302','馬立夯','贏馬赫','eeit970302','1973/07/25','eeit970302@gmail.com','基隆市中正區和平東路5號','0987-645-321','我愛騎車旅遊','正常','社團管理員')
INSERT INTO members(memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memStatus,memRole) 
VALUES('eeit970303','陳建志','見仁見智','eeit970303','1970/01/05','eeit970303@gmail.com','台北市中正區館前路257號','0966-555-444','我喜歡爬山','正常','一般會員')
INSERT INTO members(memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memStatus,memRole) 
VALUES('eeit970304','黃一芳','水果茶超好喝','eeit970304','1987/07/08','eeit970304@gmail.com','桃園市歸仁區歸仁路7號','0922-777-789','哪裡有水果茶哪裡去','正常','一般會員')
INSERT INTO members(memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memStatus,memRole) 
VALUES('eeit970305','莊曉癸','鬼頭鬼腦','eeit970305','2002/03/26','eeit970305@gmail.com','新北市新店區中興路246號','0987-948-947','才不告訴膩雷','黑名單','一般會員')
INSERT INTO members(memberId,memName,memNickN,memPwd,memBirthday,memMail,memAddr,memPhone,memIntr,memStatus,memRole) 
VALUES('eeit970306','廖美芽','小新的媽','eeit970306','1985/05/27','eeit970306@gmail.com','高雄市左營區仁愛路42號','0956-565-566','親子旅遊我最行','正常','一般會員')

select * from members;

go