
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
remark				varchar,
constraint schedules_primary_key primary key(scheduleID));