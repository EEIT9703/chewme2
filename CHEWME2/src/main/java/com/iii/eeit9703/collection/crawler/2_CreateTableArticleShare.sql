--建立分享文表格  use CMDB; go IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'ArticleShare')      
BEGIN
drop table members
END
go