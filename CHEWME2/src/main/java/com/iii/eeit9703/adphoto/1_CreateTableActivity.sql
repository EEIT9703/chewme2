
use CMDB;

go

if exists (select name FROM sysobjects 
                   WHERE type = 'u' AND name = 'activity')

BEGIN

drop table activity;

END
go


create table activity (
actID              int IDENTITY (1,1) not null,  --活動編號
act_name           varchar(50),                  --活動名稱
act_groups         int,                          --成團人數
act_current        int,                          --當前人數
BDate              date,                         --開始日期
EDate              date,                         --結束日期
activity_state     int,                          --活動型態
memId                int not null,                 --創活動的會員id
clubID             int,                          --社團ID

 constraint dept2_primary_key primary key (actID)
 );
 ALTER TABLE activity ADD CONSTRAINT FK_AM_memId FOREIGN KEY (memId) REFERENCES members (memId);
 ALTER TABLE activity ADD CONSTRAINT FK_AC_clubID FOREIGN KEY (clubID) REFERENCES clubs (clubID);

insert into activity values ('九份一日',15,5,'2017-10-10','2017-10-10',0,1,2);
insert into activity values ('九份二日',10,6,'2017-10-12','2017-10-14',0,3,2);
insert into activity values ('九份三日',12,7,'2017-10-13','2017-10-16',0,6,1);



