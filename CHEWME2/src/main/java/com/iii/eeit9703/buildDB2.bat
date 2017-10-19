cd C:\_EEITProject\repository\chewme\CHEWME\src\main\java\com\iii\eeit9703

sqlcmd -E -i buildlist.sql

--  create各大項的主表,供之後子表的連接
:r  .\club\1_CreateTableClubs.sql
:r  .\member\1_CreateTableMembers.sql
:r  .\activity\1_CreatTableActivity.sql
:r  .\crawler\1_CreatTableAttractions.sql
:r  .\crawler\1_CreatTableArticleShare.sql

--  create member的子表
:r  member\2_CreateTableMFriendsLists.sql
:r  member\3_CreateTableMsgRooms&Msgs.sql
:r  member\4_CreateTableMCalendar.sql


-- create club的子表
:r  club\2_CreateTableClubActivityList.sql
:r  club\3_CreateTableClubMemberList.sql
:r  club\4_CreateTableIssues.sql
:r  club\5_CreateTableComments.sql
:r  club\6_CreateTableQuestion.sql
:r  club\7_CreateTableReplys.sql

-- create1行程編輯器所會用到的地點代碼
:r  actEditor\1_CreateTableCountrys.sql

-- create後台所會用到的表格
:r  backstage\Collection.sql
:r  backstage\Report.sql


pause
