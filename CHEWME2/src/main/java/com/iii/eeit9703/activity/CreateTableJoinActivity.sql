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

mId         int not null,	--從members取得，會員ID
actID       int not null,	--從activity取得，活動ID

CONSTRAINT [PK_club_member_list] PRIMARY KEY CLUSTERED 
(
[mId],
[actID]
) ON [PRIMARY] )

go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'members')      
BEGIN
--增加外鍵(FK)
Alter TABLE join_activitys ADD CONSTRAINT FK_CM_mId FOREIGN KEY(mId) REFERENCES members(mId)
END
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'activity')      
BEGIN
--增加外鍵(FK)
Alter TABLE join_activitys ADD CONSTRAINT FK_CM_actID FOREIGN KEY(actID) REFERENCES activity(actID)
END
go