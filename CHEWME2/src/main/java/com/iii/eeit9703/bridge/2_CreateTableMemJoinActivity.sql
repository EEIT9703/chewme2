--使用CMDB資料庫
use CMDB;
go

IF EXISTS (SELECT name FROM sysobjects
                  WHERE type='u' AND name = 'join_activitys')      
BEGIN
drop table join_activitys;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go

create table join_activitys(

memId         int not null,	--從members取得，會員ID
actID       int not null,	--從activity取得，活動ID

CONSTRAINT [PK_join_activitys] PRIMARY KEY CLUSTERED 
(
[memId],
[actID]
) ON [PRIMARY] )

go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'members')      
BEGIN
--增加外鍵(FK)㰊㰼㰼㰼䠠䅅੄䄀氀琀攀爀 吀䄀䈀䰀䔀 樀漀椀渀开愀挀琀椀瘀椀琀礀猀 䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 䘀䬀开䴀䄀开洀攀洀䤀搀 䘀伀刀䔀䤀䜀一 䬀䔀夀⠀洀䤀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 洀攀洀戀攀爀猀⠀洀攀洀䤀搀⤀ഀ਀㴽㴽㴽਽䄀氀琀攀爀 吀䄀䈀䰀䔀 樀漀椀渀开愀挀琀椀瘀椀琀礀猀 䄀䐀䐀 䌀伀一匀吀刀䄀䤀一吀 䘀䬀开䌀䴀开洀攀洀䤀搀 䘀伀刀䔀䤀䜀一 䬀䔀夀⠀洀攀洀䤀搀⤀ 刀䔀䘀䔀刀䔀一䌀䔀匀 洀攀洀戀攀爀猀⠀洀攀洀䤀搀⤀ഀ਀㸾㸾㸾‾牢湡档✠慭瑳牥‧景栠瑴獰⼺术瑩畨⹢潣⽭䕅呉㜹㌰振敨海㉥朮瑩
END
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'activity')      
BEGIN
--增加外鍵(FK)
Alter TABLE join_activitys ADD CONSTRAINT FK_MA_actID FOREIGN KEY(actID) REFERENCES activity(actID)
END
go