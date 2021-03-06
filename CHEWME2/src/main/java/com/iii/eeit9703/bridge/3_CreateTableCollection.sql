use CMDB;
go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'collect')      
BEGIN
alter table [dbo].[collect] drop constraint [PK_collect]

DROP TABLE collect;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go

CREATE TABLE collect
(
memId int NOT NULL,
actID int NOT NULL,
[status] int


CONSTRAINT [PK_collect] PRIMARY KEY CLUSTERED 
(
[memId],
[actID]
) ON [PRIMARY] 
)

go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'members')      
BEGIN
--增加外鍵(FK)
Alter TABLE collect ADD CONSTRAINT FK_CM_mId FOREIGN KEY([memId]) REFERENCES members([memId])
END
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'activity')      
BEGIN
--增加外鍵(FK)
Alter TABLE collect ADD CONSTRAINT FK_CM_actID FOREIGN KEY([actID]) REFERENCES activity([actID])
END
go

select * from collect;
go