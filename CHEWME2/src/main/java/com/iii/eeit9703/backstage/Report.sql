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

select * from report;
go