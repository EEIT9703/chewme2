
--使用CMDB資料庫
use CMDB;
go

--建立編輯行程表格

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'adphoto')      
BEGIN
drop table adphoto;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go


create table adphoto(
	photo_no	int identity(1,1) PRIMARY KEY,
	name		varchar(30)		, 
	photo		varbinary(max)	NOT NULL

)