--�ϥ�CMDB��Ʈw
use CMDB;
go

IF EXISTS (SELECT name FROM sysobjects
                  WHERE type='u' AND name = 'join_activitys')      
BEGIN
drop table join_activitys;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go

create table join_activitys(

mId         int not null,	--�qmembers���o�A�|��ID
actID       int not null,	--�qactivity���o�A����ID

CONSTRAINT [PK_club_member_list] PRIMARY KEY CLUSTERED 
(
[mId],
[actID]
) ON [PRIMARY] )

go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'members')      
BEGIN
--�W�[�~��(FK)
Alter TABLE join_activitys ADD CONSTRAINT FK_CM_mId FOREIGN KEY(mId) REFERENCES members(mId)
END
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'activity')      
BEGIN
--�W�[�~��(FK)
Alter TABLE join_activitys ADD CONSTRAINT FK_CM_actID FOREIGN KEY(actID) REFERENCES activity(actID)
END
go