sqlcmd -E -i   delete_FK.sql

::create各大項的主表,供之後子表的連接

sqlcmd -E -i   club\1_CreateTableClubs.sql
sqlcmd -E -i   member\1_CreateTableMembers.sql
sqlcmd -E -i   activity\1_CreateTableActivity.sql
sqlcmd -E -i   crawler\1_CreateTableAttractions.sql
sqlcmd -E -i   crawler\2_CreateTableArticleShare.sql

::  create member的子表
sqlcmd -E -i   member\2_CreateTableMFriendsLists.sql
sqlcmd -E -i   member\3_CreateTableMsgRooms_Msgs.sql
:: sqlcmd -E -i   member\4_CreateTableMCalendar.sql




:: create club的子表
sqlcmd -E -i   club\2_CreateTableIssues.sql
sqlcmd -E -i   club\3_CreateTableComments.sql
sqlcmd -E -i   club\4_CreateTableQuestion.sql
sqlcmd -E -i   club\5_CreateTableReplys.sql

:: create1行程編輯器所會用到的地點代碼
sqlcmd -E -i   actEditor\1_CreateTableCountrys.sql
sqlcmd -E -i   actEditor\2_CreateTableCountys.sql
sqlcmd -E -i   actEditor\3_CreateTableSchedules.sql

:: create後台所會用到的表格
sqlcmd -E -i   backstage\Adphoto.sql

:: create bridge的子表
::sqlcmd -E -i   bridge\1_CreateTableClubActivityList.sql
sqlcmd -E -i   bridge\1_CreateTableClubMemberList.sql
sqlcmd -E -i   bridge\2_CreateTableMemJoinActivity.sql
sqlcmd -E -i   bridge\3_CreateTableCollection.sql
sqlcmd -E -i   bridge\4_CreateTableReport.sql


pause