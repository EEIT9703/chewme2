USE CMDB;
GO
 
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'm_friends_lists')      
BEGIN
DROP TABLE m_friends_lists;
END
go



CREATE TABLE m_friends_lists(
memId    int,
friendId    int,
fStatus     nvarchar(20),
CONSTRAINT [PK_m_friends_lists] PRIMARY KEY CLUSTERED 
(
[memId],
[friendId]
) ON [PRIMARY] 
);
IF EXISTS (SELECT name FROM sysobjects
            WHERE type='u' AND name = 'members')      
BEGIN
ALTER TABLE m_friends_lists ADD CONSTRAINT mfriendslists_foreign_key FOREIGN KEY (friendId)REFERENCES members(memId) 
END
BEGIN
ALTER TABLE m_friends_lists ADD CONSTRAINT mf_member_foreign_key FOREIGN KEY (memId)REFERENCES members(memId) 
END


INSERT INTO m_friends_lists(memId,friendId,fStatus) VALUES('1','3','好友')
INSERT INTO m_friends_lists(memId,friendId,fStatus) VALUES('1','4','好友')
INSERT INTO m_friends_lists(memId,friendId,fStatus) VALUES('1','5','待確認')
INSERT INTO m_friends_lists(memId,friendId,fStatus) VALUES('1','6','好友')
