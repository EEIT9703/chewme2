use CMDB;
go
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'report')      
BEGIN
DROP TABLE report;

END                                                                                                                                                                                                                                                                                                                                                                                                                                                    
go

CREATE TABLE report
(
memID int NOT NULL,
actID int NOT NULL,
reportContext varchar,
reportTime datetime
CONSTRAINT [PK_report] PRIMARY KEY CLUSTERED 
(
[memID],
[actID]
) ON [PRIMARY] 
)
go

BEGIN
--增加外鍵(FK)
Alter TABLE report ADD CONSTRAINT FK_CM_mId FOREIGN KEY([mId]) REFERENCES members([mId])
END
go

IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'activity')      
BEGIN
--增加外鍵(FK)
Alter TABLE report ADD CONSTRAINT FK_CM_actID FOREIGN KEY([actID]) REFERENCES activity([actID])
END
go

select * from report;
go