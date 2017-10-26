use CMDB;
go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'collections')      
BEGIN
DROP TABLE collections;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go

CREATE TABLE collections
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
Alter TABLE collections ADD CONSTRAINT FK_ColM_memId FOREIGN KEY([memId]) REFERENCES members([memId])
END
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'activity')      
BEGIN
--增加外鍵(FK)
Alter TABLE collections ADD CONSTRAINT FK_CA_actID FOREIGN KEY([actID]) REFERENCES activity([actID])
END
go

select * from collections;
go