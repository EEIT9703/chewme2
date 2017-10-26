
--�ϥ�CMDB��Ʈw
use CMDB;
go

--�إ߽s���{���

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'adphoto')      
BEGIN
drop table adphoto;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go


create table adphoto(
	photo_no	int identity(1,1) PRIMARY KEY,
	name		varchar(30)		, 
	photo		varchar(MAX)	NOT NULL
)