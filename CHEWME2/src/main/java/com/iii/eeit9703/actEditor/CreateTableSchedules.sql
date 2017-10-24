create table schedules(
scheduleID 		int IDENTITY(1,1)not null,
actID					int,
attractionID  	int,
dayNo				int,
period        		time,
remark				varchar,
constraint schedules_primary_key primary key(scheduleID));