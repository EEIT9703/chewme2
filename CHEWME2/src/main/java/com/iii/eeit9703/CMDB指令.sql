USE [master]
GO
/****** Object:  Database [CMDB]    Script Date: 2017/11/13 下午 03:02:46 ******/
CREATE DATABASE [CMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMData', FILENAME = N'c:\_EEITProject\sqlDB\chewme.mdf' , SIZE = 44480KB , MAXSIZE = 1048576KB , FILEGROWTH = 20%)
 LOG ON 
( NAME = N'chewmeLog', FILENAME = N'c:\_EEITProject\sqlDB\chewme.ldf' , SIZE = 22528KB , MAXSIZE = 512000KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [CMDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CMDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CMDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CMDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CMDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CMDB] SET  MULTI_USER 
GO
ALTER DATABASE [CMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CMDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CMDB', N'ON'
GO
USE [CMDB]
GO
/****** Object:  Table [dbo].[activity]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[activity](
	[actID] [int] IDENTITY(1,1) NOT NULL,
	[act_name] [varchar](50) NULL,
	[act_groups] [int] NULL,
	[act_current] [int] NULL,
	[BDate] [date] NULL,
	[EDate] [date] NULL,
	[activity_state] [int] NULL,
	[memId] [int] NOT NULL,
	[clubID] [int] NULL,
	[act_photo] [varchar](max) NULL,
	[sch_photo] [varchar](max) NULL,
	[act_price] [int] NULL,
	[act_news] [varchar](max) NULL,
 CONSTRAINT [dept2_primary_key] PRIMARY KEY CLUSTERED 
(
	[actID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adphoto]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[adphoto](
	[photo_no] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NULL,
	[photo] [varchar](max) NOT NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[photo_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[allpay]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[allpay](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[orderNumber] [varchar](max) NULL,
	[orderName] [varchar](50) NOT NULL,
	[orderPeople] [int] NULL,
	[orderPrice] [int] NULL,
	[orderTime] [datetime] NULL,
	[orderStatus] [int] NULL,
	[actID] [int] NULL,
	[memId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArticleShare]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArticleShare](
	[articleID] [int] IDENTITY(1,1) NOT NULL,
	[memId] [int] NULL,
	[attractionID] [int] NULL,
	[contents] [varchar](max) NULL,
	[memPhoto] [varchar](max) NULL,
 CONSTRAINT [ArticleShare_primary_key] PRIMARY KEY CLUSTERED 
(
	[articleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attractions]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attractions](
	[attractionID] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[county] [varchar](20) NULL,
	[type] [varchar](20) NULL,
	[address] [varchar](100) NULL,
	[tel] [varchar](50) NULL,
	[intro] [varchar](max) NULL,
	[image] [varbinary](max) NULL,
 CONSTRAINT [attractions_primary_key] PRIMARY KEY CLUSTERED 
(
	[attractionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[club_member_list]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[club_member_list](
	[memID] [int] NOT NULL,
	[clubID] [int] NOT NULL,
	[joinTime] [date] NOT NULL,
 CONSTRAINT [PK_club_member_list] PRIMARY KEY CLUSTERED 
(
	[memID] ASC,
	[clubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[club_photo]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[club_photo](
	[photoId] [int] IDENTITY(1,1) NOT NULL,
	[clubId] [int] NULL,
	[name] [varchar](30) NULL,
	[photo] [varbinary](max) NOT NULL,
 CONSTRAINT [PK__club_pho__547C322DE1D31355] PRIMARY KEY CLUSTERED 
(
	[photoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clubs]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clubs](
	[clubID] [int] IDENTITY(1,1) NOT NULL,
	[clubName] [varchar](50) NOT NULL,
	[managerId] [int] NULL,
	[locationId] [int] NOT NULL,
	[brief] [varchar](max) NULL,
	[refURL] [varchar](100) NULL,
	[vistors] [int] NULL,
	[vistorsInMonth] [int] NULL,
	[addr] [varchar](50) NULL,
	[clubPic] [varbinary](max) NULL,
 CONSTRAINT [PK__clubs__DF4AEA922B900A59] PRIMARY KEY CLUSTERED 
(
	[clubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[collect]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collect](
	[memId] [int] NOT NULL,
	[actID] [int] NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_collect] PRIMARY KEY CLUSTERED 
(
	[memId] ASC,
	[actID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comments](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[issueID] [int] NOT NULL,
	[content] [varchar](50) NULL,
	[commenterId] [int] NULL,
	[commentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[countrys]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[countrys](
	[queue] [int] NULL,
	[countryID] [varchar](5) NOT NULL,
	[countryName] [varchar](10) NULL,
 CONSTRAINT [countrys_primary_key] PRIMARY KEY CLUSTERED 
(
	[countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[countys]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[countys](
	[countyID] [int] NOT NULL,
	[countyName] [varchar](10) NULL,
	[countryName] [varchar](10) NULL,
	[countryID] [varchar](5) NULL,
 CONSTRAINT [countys_primary_key] PRIMARY KEY CLUSTERED 
(
	[countyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[issues]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[issues](
	[issueID] [int] IDENTITY(1,1) NOT NULL,
	[clubID] [int] NOT NULL,
	[issueTitle] [varchar](50) NULL,
	[issueContent] [varchar](300) NULL,
	[proposerID] [int] NULL,
	[issuepic] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[issueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[join_activitys]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[join_activitys](
	[memId] [int] NOT NULL,
	[actID] [int] NOT NULL,
	[joinTime] [date] NOT NULL,
 CONSTRAINT [PK_ join_activitys_list] PRIMARY KEY CLUSTERED 
(
	[memId] ASC,
	[actID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[members]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[members](
	[memId] [int] IDENTITY(1,1) NOT NULL,
	[memberId] [varchar](30) NULL,
	[memName] [nvarchar](20) NOT NULL,
	[memNickN] [nvarchar](20) NULL,
	[memPwd] [varchar](32) NULL,
	[memBirthday] [date] NULL,
	[memMail] [varchar](50) NOT NULL,
	[memAddr] [nvarchar](max) NULL,
	[memPhone] [varchar](15) NULL,
	[memIntr] [nvarchar](max) NULL,
	[memPhoto] [varchar](max) NULL,
	[memStatus] [nvarchar](20) NULL,
	[memRole] [nvarchar](20) NULL,
	[googleId] [char](30) NULL,
 CONSTRAINT [members_primary_key] PRIMARY KEY CLUSTERED 
(
	[memId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__members__338F576C6007DF0A] UNIQUE NONCLUSTERED 
(
	[memId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__members__7FD7CF17531B6104] UNIQUE NONCLUSTERED 
(
	[memberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__members__A16874B6960EAE33] UNIQUE NONCLUSTERED 
(
	[memNickN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[questions]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[questions](
	[questionId] [int] IDENTITY(1,1) NOT NULL,
	[clubId] [int] NOT NULL,
	[qTitle] [varchar](50) NULL,
	[qcontent] [varchar](300) NULL,
	[askerId] [int] NULL,
	[readed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[questionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[replys]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[replys](
	[reqlyId] [int] IDENTITY(1,1) NOT NULL,
	[questionId] [int] NOT NULL,
	[content] [varchar](300) NULL,
	[replyerId] [int] NULL,
	[replyDate] [date] NULL,
	[readed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[reqlyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[report]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report](
	[memId] [int] NOT NULL,
	[actID] [int] NOT NULL,
	[reportContext] [varchar](max) NULL,
	[reportTime] [datetime] NULL,
 CONSTRAINT [PK_report] PRIMARY KEY CLUSTERED 
(
	[memId] ASC,
	[actID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[schedules]    Script Date: 2017/11/13 下午 03:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[schedules](
	[scheduleID] [int] IDENTITY(1,1) NOT NULL,
	[actID] [int] NULL,
	[attractionID] [int] NULL,
	[dayNo] [int] NULL,
	[period] [time](7) NULL,
	[remark] [varchar](max) NULL,
 CONSTRAINT [schedules_primary_key] PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD  CONSTRAINT [FK_activity_clubs] FOREIGN KEY([clubID])
REFERENCES [dbo].[clubs] ([clubID])
GO
ALTER TABLE [dbo].[activity] CHECK CONSTRAINT [FK_activity_clubs]
GO
ALTER TABLE [dbo].[activity]  WITH CHECK ADD  CONSTRAINT [FK_activity_members] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[activity] CHECK CONSTRAINT [FK_activity_members]
GO
ALTER TABLE [dbo].[allpay]  WITH CHECK ADD  CONSTRAINT [FK__allpay__memId__59FA5E80] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[allpay] CHECK CONSTRAINT [FK__allpay__memId__59FA5E80]
GO
ALTER TABLE [dbo].[ArticleShare]  WITH CHECK ADD  CONSTRAINT [FK_ASA_attractionID] FOREIGN KEY([attractionID])
REFERENCES [dbo].[attractions] ([attractionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticleShare] CHECK CONSTRAINT [FK_ASA_attractionID]
GO
ALTER TABLE [dbo].[ArticleShare]  WITH CHECK ADD  CONSTRAINT [FK_ASM_memId] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[ArticleShare] CHECK CONSTRAINT [FK_ASM_memId]
GO
ALTER TABLE [dbo].[club_member_list]  WITH CHECK ADD  CONSTRAINT [FK_club_member_list_clubs] FOREIGN KEY([clubID])
REFERENCES [dbo].[clubs] ([clubID])
GO
ALTER TABLE [dbo].[club_member_list] CHECK CONSTRAINT [FK_club_member_list_clubs]
GO
ALTER TABLE [dbo].[club_member_list]  WITH CHECK ADD  CONSTRAINT [FK_club_member_list_members] FOREIGN KEY([memID])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[club_member_list] CHECK CONSTRAINT [FK_club_member_list_members]
GO
ALTER TABLE [dbo].[club_photo]  WITH CHECK ADD  CONSTRAINT [FK_PicC_ClubID] FOREIGN KEY([clubId])
REFERENCES [dbo].[clubs] ([clubID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[club_photo] CHECK CONSTRAINT [FK_PicC_ClubID]
GO
ALTER TABLE [dbo].[collect]  WITH CHECK ADD  CONSTRAINT [FK_collect_activity] FOREIGN KEY([actID])
REFERENCES [dbo].[activity] ([actID])
GO
ALTER TABLE [dbo].[collect] CHECK CONSTRAINT [FK_collect_activity]
GO
ALTER TABLE [dbo].[collect]  WITH CHECK ADD  CONSTRAINT [FK_collect_members] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[collect] CHECK CONSTRAINT [FK_collect_members]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_issues] FOREIGN KEY([issueID])
REFERENCES [dbo].[issues] ([issueID])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_issues]
GO
ALTER TABLE [dbo].[issues]  WITH CHECK ADD  CONSTRAINT [FK_issues_clubs] FOREIGN KEY([clubID])
REFERENCES [dbo].[clubs] ([clubID])
GO
ALTER TABLE [dbo].[issues] CHECK CONSTRAINT [FK_issues_clubs]
GO
ALTER TABLE [dbo].[join_activitys]  WITH CHECK ADD  CONSTRAINT [FK_join_activitys_activity] FOREIGN KEY([actID])
REFERENCES [dbo].[activity] ([actID])
GO
ALTER TABLE [dbo].[join_activitys] CHECK CONSTRAINT [FK_join_activitys_activity]
GO
ALTER TABLE [dbo].[join_activitys]  WITH CHECK ADD  CONSTRAINT [FK_join_activitys_members] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[join_activitys] CHECK CONSTRAINT [FK_join_activitys_members]
GO
ALTER TABLE [dbo].[questions]  WITH CHECK ADD  CONSTRAINT [FK_questions_clubs] FOREIGN KEY([clubId])
REFERENCES [dbo].[clubs] ([clubID])
GO
ALTER TABLE [dbo].[questions] CHECK CONSTRAINT [FK_questions_clubs]
GO
ALTER TABLE [dbo].[replys]  WITH CHECK ADD  CONSTRAINT [FK_replys_questions] FOREIGN KEY([questionId])
REFERENCES [dbo].[questions] ([questionId])
GO
ALTER TABLE [dbo].[replys] CHECK CONSTRAINT [FK_replys_questions]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_report_activity] FOREIGN KEY([actID])
REFERENCES [dbo].[activity] ([actID])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_report_activity]
GO
ALTER TABLE [dbo].[report]  WITH CHECK ADD  CONSTRAINT [FK_report_members] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[report] CHECK CONSTRAINT [FK_report_members]
GO
ALTER TABLE [dbo].[schedules]  WITH CHECK ADD  CONSTRAINT [FK_schedules_activity] FOREIGN KEY([actID])
REFERENCES [dbo].[activity] ([actID])
GO
ALTER TABLE [dbo].[schedules] CHECK CONSTRAINT [FK_schedules_activity]
GO
ALTER TABLE [dbo].[schedules]  WITH CHECK ADD  CONSTRAINT [FK_schedules_attractions] FOREIGN KEY([attractionID])
REFERENCES [dbo].[attractions] ([attractionID])
GO
ALTER TABLE [dbo].[schedules] CHECK CONSTRAINT [FK_schedules_attractions]
GO
USE [master]
GO
ALTER DATABASE [CMDB] SET  READ_WRITE 
GO
