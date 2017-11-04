
use CMDB;
go

IF (OBJECT_ID('FK_PicC_ClubID', 'F') IS NOT NULL)
BEGIN
    Alter TABLE  club_photo drop CONSTRAINT FK_PicC_ClubID
END 

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'club_photo')      
BEGIN
drop table club_photo;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go


create table club_photo(
	photoId  	int identity(1,1) PRIMARY KEY,
	clubId      int CONSTRAINT FK_PicC_ClubID FOREIGN KEY(clubID) REFERENCES clubs(clubID) on delete cascade;
	name		varchar(30)		, 
	photo		varbinary(MAX)	NOT NULL
	
)