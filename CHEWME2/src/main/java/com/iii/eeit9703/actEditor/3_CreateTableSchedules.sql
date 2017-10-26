--建立行程時程表

use CMDB;
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'schedules')      
BEGIN
drop table schedules;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go

create table schedules(
scheduleID 		int IDENTITY(1,1)not null,
actID					int,
attractionID  	int,
dayNo				int,
period        		time,
remark				varchar(MAX),
constraint schedules_primary_key primary key(scheduleID));

go

BEGIN
Alter TABLE schedules ADD CONSTRAINT FK_SA_actID FOREIGN KEY(actID) REFERENCES activity(actID)
END
BEGIN
Alter TABLE schedules ADD CONSTRAINT FK_SA_attractionID FOREIGN KEY(attractionID) REFERENCES attractions(attractionID)
END

