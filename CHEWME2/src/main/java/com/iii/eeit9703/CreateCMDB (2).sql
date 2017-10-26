drop database CMDB
CREATE DATABASE CMDB
on 
PRIMARY(NAME=CMData,
FILENAME='c:\_EEITProject\sqlDB\chewme.mdf',
SIZE=10MB,
MAXSIZE=1GB,
FILEGROWTH=20%)
LOG ON
(NAME=chewmeLog,
FILENAME='c:\_EEITProject\sqlDB\chewme.ldf',
SIZE=3MB,
MAXSIZE=500MB,
FILEGROWTH=1MB)

COLLATE Chinese_Taiwan_Stroke_CI_AS --©w§Ç