USE [master]
GO
/****** Object:  Database [CMDB]    Script Date: 2017/11/1 上午 09:51:10 ******/
CREATE DATABASE [CMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMData', FILENAME = N'c:\_EEITProject\sqlDB\chewme.mdf' , SIZE = 10240KB , MAXSIZE = 1048576KB , FILEGROWTH = 20%)
 LOG ON 
( NAME = N'chewmeLog', FILENAME = N'c:\_EEITProject\sqlDB\chewme.ldf' , SIZE = 3072KB , MAXSIZE = 512000KB , FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[activity]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
 CONSTRAINT [dept2_primary_key] PRIMARY KEY CLUSTERED 
(
	[actID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[adphoto]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
PRIMARY KEY CLUSTERED 
(
	[photo_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArticleShare]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
 CONSTRAINT [ArticleShare_primary_key] PRIMARY KEY CLUSTERED 
(
	[articleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[attractions]    Script Date: 2017/11/1 上午 09:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[attractions](
	[attractionID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[club_member_list]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[club_photo]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
	[photo] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[photoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clubs]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
	[brief] [varchar](50) NULL,
	[refURL] [varchar](50) NULL,
	[vistors] [int] NULL,
	[vistorsInMonth] [int] NULL,
	[addr] [varchar](50) NULL,
	[clubPic] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[clubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[collect]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[comments]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[countrys]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[countys]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[issues]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[join_activitys]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[m_friends_lists]    Script Date: 2017/11/1 上午 09:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m_friends_lists](
	[memId] [int] NOT NULL,
	[friendId] [int] NOT NULL,
	[fStatus] [nvarchar](20) NULL,
 CONSTRAINT [PK_m_friends_lists] PRIMARY KEY CLUSTERED 
(
	[memId] ASC,
	[friendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[members]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
	[googleId] [char](21) NULL,
 CONSTRAINT [members_primary_key] PRIMARY KEY CLUSTERED 
(
	[memId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[msg_rooms]    Script Date: 2017/11/1 上午 09:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msg_rooms](
	[msgRoomId] [int] NOT NULL,
	[memId] [int] NULL,
 CONSTRAINT [msg_rooms_primary_key] PRIMARY KEY CLUSTERED 
(
	[msgRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[msgs]    Script Date: 2017/11/1 上午 09:51:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[msgs](
	[msgRoomId] [int] NOT NULL,
	[msgNo] [int] NOT NULL,
	[memId] [int] NULL,
	[msg] [text] NULL,
	[msgTime] [timestamp] NOT NULL,
	[msgStatus] [int] NULL,
 CONSTRAINT [msgs_primary_key] PRIMARY KEY CLUSTERED 
(
	[msgNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[questions]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[replys]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[report]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
/****** Object:  Table [dbo].[schedules]    Script Date: 2017/11/1 上午 09:51:10 ******/
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
SET IDENTITY_INSERT [dbo].[activity] ON 

INSERT [dbo].[activity] ([actID], [act_name], [act_groups], [act_current], [BDate], [EDate], [activity_state], [memId], [clubID], [act_photo]) VALUES (1, N'九份一日', 15, 5, CAST(0x633D0B00 AS Date), CAST(0x633D0B00 AS Date), 0, 1, 2, NULL)
INSERT [dbo].[activity] ([actID], [act_name], [act_groups], [act_current], [BDate], [EDate], [activity_state], [memId], [clubID], [act_photo]) VALUES (2, N'九份二日', 10, 6, CAST(0x653D0B00 AS Date), CAST(0x673D0B00 AS Date), 0, 3, 2, NULL)
INSERT [dbo].[activity] ([actID], [act_name], [act_groups], [act_current], [BDate], [EDate], [activity_state], [memId], [clubID], [act_photo]) VALUES (3, N'九份三日', 12, 7, CAST(0x663D0B00 AS Date), CAST(0x693D0B00 AS Date), 0, 6, 1, NULL)
SET IDENTITY_INSERT [dbo].[activity] OFF
SET IDENTITY_INSERT [dbo].[ArticleShare] ON 

INSERT [dbo].[ArticleShare] ([articleID], [memId], [attractionID], [contents]) VALUES (1, 1, 1, N'風景好美')
INSERT [dbo].[ArticleShare] ([articleID], [memId], [attractionID], [contents]) VALUES (2, 2, 2, N'好漂亮')
INSERT [dbo].[ArticleShare] ([articleID], [memId], [attractionID], [contents]) VALUES (3, 3, 3, N'下次一定要再去')
INSERT [dbo].[ArticleShare] ([articleID], [memId], [attractionID], [contents]) VALUES (4, 4, 4, N'好漂亮')
SET IDENTITY_INSERT [dbo].[ArticleShare] OFF
SET IDENTITY_INSERT [dbo].[attractions] ON 

INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (1, N'旺角迷你石頭火鍋', N'新北市', N'餐廳', N'新北市三重區正義南路2-1號', N'886-2-29747815', N'人氣強強滾的旺角食頭火鍋，是三重火鍋界的指標名店之一，沒有事先定位就很難吃到的盛況更是每天上演，在門外排上一、兩個小時也是常有的事，即使是夏天，旺角食頭火鍋依然天天爆滿，因此店家在幾年前從原本的舊址移至現在天台戲院對面的店面。相較於隨處可見的日式涮涮鍋，石頭火鍋的特色是在加入高湯前多了「炒」的動作，也稱作「炒肉式起鍋」，將肉片加入一碟由多種配料製成的炒料，包括洋蔥、蒜頭及麻油等先進行爆香，條味的黃金比例正是美味的來源，炒的時後服務人員細心地立起鍋圍，濃濃的香味竄鼻，快炒至月5分熟後撈起再放入高湯中煮，這道多出來的手續便是傳統石頭火鍋的特色，也是迷人之處。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (2, N'金山肉包王', N'新北市', N'餐廳', N'新北市金山區中山路237號', N'886-2-24985787', N'除了逛老街外，來到金山也是逛北海岸風景區補充體力、美食的中繼站。位於市區中山路上、金山市場外面的「金山肉包王」，以香濃味美的「蔥肉肉包」，25年來奠定了包子店在遊客心中的「包子王」地位。尤其假日時間一到中午，店門前大排長龍的人潮、車潮令人嘆為觀止，所有人都是為了那一粒皮Q肉餡飽滿的肉包而來。金山肉包王從原本一種臺式口味的蔥肉包，一直發展到5種口味，不論蔥肉、滷肉、高麗菜、酸菜、素菜還是紅豆，都十分受到行家的喜愛。經常可見高級轎車停了下來，一買就是幾十顆，掃貨的景象令人咋舌，也不難發覺肉包王的魅力。這兒包子好吃的秘訣，在於中筋麵糰前一天就先低溫發酵，內餡用金山市場內的溫體黑豬肉，加上老闆獨家調味，蒸起來香氣四溢，令人聞香下馬。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (3, N'泰味廚房', N'新北市', N'餐廳', N'新北市板橋區中山路二段42號', N'886-2-82573903', N'提起板橋的平價泰國菜，位於民生路二段的泰味廚房可說是當地老饕們的最愛，南洋風情與巧思妙藝，在餐廳裡除了一般常見的泰國美食，還有難得一見的南洋料理，用餐、宴客都能嚐出主廚的用心。通常消費者耳熟能詳的泰國菜，以椒麻雞、月亮蝦餅、蝦醬空心菜、涼拌海鮮、咖哩飯…等菜色最常見到，由於泰國與滇、緬接鄰，飲食習慣接近，這類型菜色在滇緬餐館也都能發現。不過，泰味廚房的泰式料理則更有南洋風，酸、辣的配料搭得極好，其中椒麻雞、香蘭葉包雞、泰北辣拌豬肉、泰式炒河粉都是這裡的招牌菜，來此必點必嚐。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (4, N'純檸檬泰式小吃', N'新北市', N'餐廳', N'新北市中和區和平街16號', N'886-2-29447693', N'清爽又帶有酸辣的口感，喜歡吃辣的您可在此盡情享用來自泰國的美食饗宴；不敢吃辣的人亦可選擇較輕微的辣度，享受青木瓜等清脆又美味的純粹滋味。推薦菜色:涼拌泡麵、打拋豬肉飯、乾炒河粉、檸檬魚片', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (5, N'黑師傅捲心酥', N'新北市', N'餐廳', N'新北市新莊區頭前路19號', N'886-2-29922348', N'黑師傅捲心酥是由台灣威化企業研發生產, 公司成立於1967年, 原先門替知門食品公司研發製造餅乾生產機器. 後轉生產捲心酥, 源起於老闆到國外度蜜月時, 無意聞吃到custard蛋奶捲心酥, 酥脆的口感以及綿密的香味, 好吃到讓人難以忘懷, 因此激發老闆對美味餅乾的熱情, 加上本身對食品機器製作的絕對自信, 就這樣一股腦的掉進了捲心酥的世界裡。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (6, N'郭金山花生店', N'新北市', N'餐廳', N'新北市瑞芳區基山街30號', N'886-2-24966632', N'目前是網路團購的熱門店家，以泥紅花生酥、原味花生酥著稱，買家都覺得花生大顆又脆、麥芽糖不黏牙，咬下去「喀滋」一聲，滿口鹹甜適中的花生香，是遊九份時不可錯過的伴手好禮！推薦產品：原味花生酥、泥紅花生酥', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (7, N'三姐妹阿給', N'新北市', N'餐廳', N'新北市淡水區真理街2巷1號', N'886-2-26218072', N'切開阿給，滿滿的Q軟粉絲被鮮嫩的豆腐皮所包覆。魚漿餡料滑入口中，滿嘴都是新鮮的美味。歷史傳承的美好滋味隨著粉絲在口中化開，淋上特製的醬料，滋味更顯出色。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (8, N'東道飲食亭', N'新北市', N'餐廳', N'新北市三峽區仁愛街7號', N'886-2-86715692', N'東道是三峽仁愛老街上知名的復古餐廳，老闆雖然很年輕，但老舊的四、五十年家居擺設，老電視、老電影海報、老汽水瓶、轉盤式老電話，一種濃濃的懷舊風油然而生，也勾起許多人的幸福回憶。店外頭有輛非常古味的三輪車，已成為三峽遊客拍照的重要場景。店內最有名的就是香傳千里的排骨飯和焢肉飯，尤其坐在老黑白電視機前吃排骨飯，那種早年和家人一起吃飯的鄉愁又再度被挑起。東道的排骨飯肉大塊、處理得又極細緻，嚴選三峽在地黑豬肉，搭配店內的精緻小菜，吃巧又吃飽，很令人回味。除了排骨飯，人氣香酥雞腿也是東道亭的招牌之一。排骨飯、雞腿飯、焢肉飯等美食外，也有各式麵點，來逛老街絕不能錯過。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (9, N'普羅旺麵包烘培坊', N'新北市', N'餐廳', N'新北市林口區中正路88號', N'886-2-26035156', N'鳳梨酥、鳳黃酥、藝術蛋糕、　中秋月餅、宴會餐點、喜餅禮盒、彌月蛋糕、各式餐盒點心特別推薦：日式三明治、黃金牛角、頂級蛋塔、沖繩黑糖蛋糕、楓糖乳酪', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (10, N'阿妃健康廚房(生食)', N'新北市', N'餐廳', N'新北市永和區中正路470號', N'886-2-29228730', N'冷凍餃子已成為現代忙碌人的方便美食，2009年新北市餃子節拿下最佳人氣獎，以及最佳創意口味獎的冷凍水餃的阿妃健康廚房，早在參加比賽前，就已經是許多媒體關注的寵兒，阿妃強調水餃能兼具口感與高纖維，每顆水餃的餡料都經過了嚴格標準化的程序，包括在肉餡、調味料的比例、水餃皮的手感與功夫，層層步驟都關鍵影響著水餃的口感，重點是堅持不使用含防腐劑的食材，並使用豐富的蔬菜，讓水餃的營養價值更高，也因為這股熱情與堅持，成就了阿妃健康廚房在地經營或比賽中都能擁有亮眼的成績，讓阿妃的水餃成為每個人心中夢幻冷凍水餃。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (11, N'蜜而可藝術蛋糕', N'新北市', N'餐廳', N'新北市新莊區建福路62號', N'886-2-22037577', N'若要大新莊地區民眾舉例自己熟知的蛋糕麵包烘焙坊，在地經營超過１５年的「蜜而可歐式烘焙坊」絕對榜上有名，甚至是大家首屈一指的第一品牌；能擁有廣大消費民眾的肯定與支持，應歸功於「蜜而可歐式烘焙坊」經營者周先生超過３０年始終堅持鑽研糕餅業的熱情，不斷創新研發口味以符合社會潮流，讓店內商品呈現多元且精緻化，無論是養生麵包、藝術蛋糕、傳統糕餅、造型西點等都擁有各自擁戴的忠實族群，值得一提的是，每天下午４點，剛出爐麵包散發熱騰騰的濃郁香氣，總是吸引大批民眾前來選購，「蜜而可歐式烘焙坊」受歡迎程度不言而喻！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (12, N'菁桐老街紅寶礦工食堂', N'新北市', N'餐廳', N'新北市平溪區菁桐老街58號', N'886-9-10012966', N'「紅寶礦工食堂」位於新北市平溪區菁桐老街上，前身為石底礦坑的礦工福利社。「紅寶礦工食堂」主人為重現民國初年的礦採風貌，食堂特別掛上早期礦工採礦實?的超大紀錄照片、菸酒公賣招牌及老電影海報，營造濃濃的復古風情，此外，也推出礦工套餐、鐵路便當、麵茶等古早味經典美食，勾起許多人的回憶！由於，「紅寶礦工食堂」緊鄰菁桐車站，在食堂內用餐，只要往外望，還可看見民國初年沿用至今的老鐵道，若心血來潮，您也可以踏上鐵道，拾階通往石底煤礦遺跡尋古懷舊一番。戀戀菁桐鐵道‧石底礦村‧平溪山城，就從「紅寶礦工食堂」開始。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (13, N'特香齋西餐廳', N'新北市', N'餐廳', N'新北市板橋區中山路一段26號2樓', N'886-2-29590033', N'已有近40年歷史的特香齋原本是板橋知名的糕餅店，後來延伸發展至西餐，在新北市西餐界是美食指標名店之一，在當年也是「新北市」第一家高級西餐廳。知名紅星剪綵和名人雅仕的推薦，逐漸擦亮餐廳的金字招牌。優雅氣氛的用餐環境、獨步全臺的百萬音響，加上主廚用心推陳出新的美味菜色、新鮮食材與口感的堅持，各式排餐光看圖片都令人垂涎。最特別的是特香齋的牛排作法，引進美國Moneatue專業牛肉烤爐，以環繞烤箱華氏1800度的高溫燒烤，肉汁完全鎖住不外流，形成一種特殊軟嫩口感。不論前菜、排餐、點心，店家的用心還曾經獲得臺灣省優良宴席餐廳獎、全國第一屆餐飲評鑑會總金牌獎等獎項。特香齋的德國豬腳皮脆肉嫩，搭配主廚特調的醬料，更能吃出豬腳的美味。 資料來源:新北市美食吃透透九月號', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (14, N'Roliya(羅莉亞)', N'新北市', N'餐廳', N'新北市新店區民權路42巷59弄12號', N'886-2-86650322', N'在新北市也能吃到五星級的義式、歐法料理！位於新店區的Roliya﹝羅莉亞﹞時尚美食特聘晶華飯店義大利廳的聞伯春師傅掌廚，設計多款精緻且美味的異國美食，早期在中和廟口一帶經營便奠定廣大好口碑，如今遷移到新店區，價位更平實、菜色更豐富，帶給附近一帶的居民耳目一新的感受。Roliya希望打破一般餐廳主題的侷限，希望呈現多變化、無國界的精緻料理；特別邀請了五星級飯店義大利廳的師傅駐店服務，就是希望讓顧客知道，想品嚐的異國料理美食，不用大老遠跑到臺北市，新北市也可以擁有這樣的五星級水準。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (15, N'紫藤花藝村', N'新北市', N'餐廳', N'新北市八里區荖阡坑路6鄰69-1號', N'886-2-86303216', N'山間餐坊‧溫馨聚餐座落於新北市八里區觀音山區的紫藤花藝村，由原木、花草、涼傘等元素所營造出的山間小屋形象，給人猶如童話故事一般的溫馨氣氛！紫藤花藝村經營團隊嚮往恬靜的山林田野生活，供作餐廳食材的文旦柚、黃金筍與地瓜葉等均為自家種植，吃得到健康美味！大廚坐鎮、老饕推薦遠離喧囂城市的紫藤花藝村，餐點品質可是有都會等級的高水準！紫藤花藝村主廚曾於知名餐廳任職，擁有十多年專業廚藝的他，精通中菜、海鮮、粵菜等料理，甫開幕，精湛手藝，已受到許多老饕的肯定，值得親嚐！入園資訊：免門票。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (16, N'海堤竹筍餐廳', N'新北市', N'餐廳', N'新北市八里區觀海大道28號', N'886-2-86305688', N'新北市八里區以淡水河沿岸明媚風光聞名！當你騎乘單車暢遊八里左岸時，別忘了一併享受由海堤竹筍餐廳（原左岸竹筍餐廳）提供的八里特色風味餐。海堤竹筍餐廳位於左岸會館旁，經營者林大哥為土生土長的八里孩子，林大哥堅持新鮮就是美味的料理精神來推廣家鄉美食，與八里區農會合作，以當地農特產－黃金綠竹筍為主題推出四季不斷貨的鮮滋味，此外，來自臺北港的活魚、活蝦、?仔魚、孔雀蛤等海鮮也都是桌上佳餚，值得一提的是，料好味美的餐點，價格卻很平易近人，無論親子家庭、旅行團體都能吃得盡興！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (17, N'松品複合式餐飲', N'新北市', N'餐廳', N'新北市新莊區全泰里4鄰新泰路123巷4號', N'886-2-89932911', N'位於新北市新莊區小巷內的松品複合式餐飲，儘管，餐館位置不顯眼，卻發揮巷子內名店功力，每到用餐時段，店內顧客總是絡繹不絕，探究其魅力，年過半百的經營者夫婦絕對功不可沒！松品複合式餐飲供應日式料理、養生火鍋等主題餐點，經營者夫婦秉持與人分享的歡喜心情，不惜成本使用日本進口食材，供應料好實在的超值美食，讓松品複合式餐飲不只飄著飯菜香，還充滿濃濃人情味！在這裡，顧客幾乎不稱呼老闆、老闆娘，年輕學子、上班族都暱稱他們是黃媽媽、黃爸爸，因為，對他們來說，松品複合式餐飲不是餐廳，溫馨氣氛猶如是自己的家。推薦菜色：松阪牛蓋飯，帝王蟹火鍋', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (18, N'京廚園', N'新北市', N'餐廳', N'新北市土城區中央路二段239號', N'886-2-82627799', N'京廚園鍋貼水餃專賣店，位於土城中央路二段，主打自家水餃以及鍋貼，雖然店外觀並不起眼，但老闆自創的餃子口味以及特殊作法的鍋貼，帶點獨特的鍋巴香味與鍋粑清脆口感，這樣的用心也讓京廚園在2009臺北餃子節活動中，一舉拿下「優質餃子館評鑑」，以及成為「網路人氣王票選亞軍」兩大肯定，而這些肯定也代表除了專業評審之外，網友與消費者的口碑認同。「別人欠你的味道，讓京廚園還給你。」這句話象徵了老闆的開店理念，希望來過京廚園的顧客都能對其留下深刻與難忘的回憶，來到土城這個美麗之都，都能感受來自京廚園的好味道。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (19, N'金喜軒牛角麵包總公司', N'新北市', N'餐廳', N'新北市三峽區中華路74-5號', N'886-2-26731141', N'三峽好伴手‧康喜軒金牛角-臺灣素有美食王國之稱，全臺各鄉鎮市都有地方指名的伴手好禮！說起新北市三峽區，金牛角可說是當地美食代表，想要品嚐外酥內Ｑ的金牛角又想了解三峽金牛角文化的民眾，康喜軒金牛角是你不可錯過的寶地！金牛角冰淇淋‧臺灣之光-康喜軒金牛角是三峽在地的麵包烘焙老店，人稱貓王的創始者為了傳承且創新家鄉的金牛角文化，積極投入研發金牛角風味的無限可能，其中金牛角冰淇淋是全臺首創的驕傲產品！ 近年來，康喜軒金牛角將觸角延伸至海外，要讓全球品嚐臺灣之光！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (20, N'呷冰站', N'新北市', N'餐廳', N'新北市三峽區國際一街82號', N'886-2-86726262', N'位於新北市三峽區的呷冰站鄰近臺北大學，經營團隊座右銘是五星級的裝潢、衛生與美味，大學生的份量與價位！以優質產品、平價消費與超值享受為經營理念的呷冰站，經營團隊吃遍全臺特色冰品，精選在地優良農特產品，屏東九如檸檬、臺南愛文芒果、九份阿柑姨手工芋圓、地瓜圓等都是經過挑嘴親友的認可才脫穎而出的食材！嚴選食材外，經營團隊連製冰用水與環境衛生更是講究，多重過濾生成潔淨水、紫外線殺菌燈照射等設備都是經營團隊對消費大眾的負責態度！用心製冰的呷冰站，甫一開幕，立即獲得許多父母的信賴，健康冰品，小朋友吃得更開心！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (21, N'花岩山林民宿', N'新北市', N'住宿', N'新北市三峽區有木里有木路104-1號', N'886-2-26749618', N'原為私人度假俱樂部的「花岩山林」，只為限定的客戶做服務，但因好山好水的口碑不脛而走，在許多友人的慫恿下，度假村主人與他的女兒才把將近六甲土地大肆改造，變成了現在的山林度假村。主題風格，有日式、歐風、希臘、南洋等異國風情，任君挑選！值得一提的是，花岩山林民宿為每一房型都保留了大面積窗戶，巧妙將窗外明媚風光變成房內最美的風景畫！　　營業時間：全年無休　平日: 9時至22時　假日：9時至23時　　假日門票資訊　【用餐】大人100元/人　【烤肉】高中含以上150元/人；國中小學100元/人；幼稚園含以下孩童免費。　　本園區接受刷卡服務，國民旅遊卡：可　假日請預先訂位', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (22, N'雅都旅社', N'新北市', N'住宿', N'新北市板橋區中興路5號2至3樓', N'886-2-29682345', N'雅都旅社位於板橋區，交通便利。　近亞東醫院及湳雅夜市，觀光景點多。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (23, N'君利商務飯店', N'新北市', N'住宿', N'新北市板橋區公園街16號', N'886-2-29562800', N'君利位於新北市政府、板橋車站／高鐵站及捷運府中站旁，為新北市之重要行政及交通樞紐中心。　鄰近板橋車站商圈、遠東集團百貨及知名婚紗街，生活機能多樣且豐富。　面對鬧中取靜的介壽公園，使旅客暫時遠離喧囂，沉澱忙碌的身心。　君利致力於提供實惠超值的住宿品質予國內外商務旅客，提供商務功能，使您辦公無空間限制且像於家中般自在。　舒適典雅的睡眠空間、親切的待客之道更是我們的主要服務核心。　擁有47間別緻客房，以細膩手工、典雅風情打造空間品味；大地色系的內斂裝潢擺設，盼您在繁忙的都會中得到放鬆休憩。　　飯店設施　　‧　餐廳：提供旅客用心烹調之中西式自助早餐。　　‧　商務中心：24小時開放　　‧　健身房：提供專業的健身器材　　‧　自助洗衣室：提供免費自助式洗衣機與烘衣設備　　‧　泊車服務：24小時貼心看顧您的愛車　　‧　預約制免 ', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (24, N'帝苑旅店', N'新北市', N'住宿', N'新北市板橋區文化路1段218號', N'886-2-22572525', N'帝苑時尚旅店位於新北市板橋區文化路一段，捷運板南線新埔站2號出口步行3分鐘可抵達，交通方便，另附設專屬的停車場，凡來消費皆可免費使用，不論您是開車或搭乘大眾運輸工具，我們絕對是您最佳的選擇。除了典雅精緻、溫馨舒適的客房，我們更提供液晶電視、最新的影視娛樂VOD系統及按摩浴缸，讓您能有個舒適充實的休憩時光。除此之外，更提供了商務人士洽商旅遊最需要的無線寬頻上網服務，讓您能迅速接收最新訊息。我們秉持著親切的服務態度，讓您感受賓至如歸的愉悅，以務實的價格，最用心的經營理念，期待與您一起分享我們無微不至的溫馨服務，帝苑旅店的美麗希望能與您一起細細品嘗。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (25, N'正點旅店', N'新北市', N'住宿', N'新北市板橋區文化路一段55號', N'886-2-29684152', N'提供每位蒞臨的旅客，貼心寬敞的旅店空間，除了免費的無線上網wifi設施，我們更以平價時尚與務實的經營理念，提供您最貼心與完善的服務。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (26, N'富康精彩旅店', N'新北市', N'住宿', N'新北市板橋區文化路二段171號2樓至5樓', N'886-2-22556336', N'富康精彩旅店成立於2008年6月，本著熱愛地球珍惜資源的理念，並以環保概念為主軸的設計，全館24間6種不同風格，不論旅遊或洽公的最好選擇，館內處處顯露低調而不凡的品味，讓您有溫馨酣暢的感受，充分擁有「回家」般的自在感受。　　富康精彩旅店是一家綠建築；綠建築的義意在於強調人與自然環境的共存，而不是一味的開發，其結果造成地球溫室效應的氣候變化；建材皆為再生建材，空調與冷卻系統採獨立控制空調符合環保需求；屋內外顏色明亮環保自然採光，空氣流通；全面採用省電燈管，與LED照明設備，浴室配件皆採用　節水設備，採用經過環保認證的產品設備。　　強調以消費「低污染、可回收、省資源」的商品，降低個人消費。讓我們大家一同努力推廣環保概念。以環保為設計主軸，以使用可回收、節能，且經過認證之建材，提供給您符合環保且相對舒適的住宿環境。富 ', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (27, N'馥華飯店', N'新北市', N'住宿', N'新北市板橋區民生路二段251號', N'886-2-22501717', N'公元2000年10月份開始加入新北市旅館市場的『馥華飯店』，在董事長徐陳坤領軍之下，從購地、規劃、起造、裝修，經過了3年多的努力，終於在這世紀轉換的前夕與社會大眾見面。我們期待以「滿足消費者」為經營目標，更相信透過完整而功能性的設備、整潔而明亮的空間以及誠摰的服務便能留住　您；所以，我們將盡力的做到，期待您的光臨。　　本飯店共有精緻客房60間：包括五間馥華雙人套房、五間馥華套房，以及豪華商務套房、精緻商務套房、豪華客房、商務客房、經濟客房各10間；所有客房均配備有獨立的影音播放系統(DVD放影機)、可自行設定的保險箱、二支以上的客房分機、32及37吋液晶電視、冰箱、煮水器、吹風機、控溫空調、網際網路專用插座。每一間客房都經過精心的設計，我們放棄了傳統爭取空間的觀念，讓每一間客房空間都維持在30平方公尺以上，雖然 ', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (28, N'夢綺旅店', N'新北市', N'住宿', N'新北市板橋區西門街20號', N'886-2-29600888', N'位於林家花園古蹟的正對面，有著一座充滿日式禪風的「夢綺商務旅館」，經營已有２０年歷史。白天以渾然天成的綠意點綴整棟建築物，晚間則以耀眼的霓虹吸引過路人。由於近林家花園古蹟，因此秉持打造幽靜、單純的住宿環境，獲得顧客相當好的評價。　夢綺房間雖然規格不大，安靜怡然的環境卻能讓顧客真正達到沉澱心靈的作用。另外一樣特色是，提供自然簡約的禪風，備品齊全，周邊更擁有自然古蹟資源與夜市，便利性與休閒價值高。夢綺的住宿價格卻相當實惠，兼顧了商務人士與親子旅遊的需求，達到更佳的旅遊品質。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (29, N'馥俐商旅', N'新北市', N'住宿', N'新北市板橋區東門街10號', N'886-2-22722625', N'馥俐商旅 I I 館座落於板橋區中心且臨近板橋府中捷運站溫馨優雅的設計，新意與時尚的氛圍，在繁華快速的脈動中，提供齊全的設備及貼心的服務，希望使每位遊人有賓至如歸的享受。　　便捷的交通網路提供您洽公、商務上的效率，繁忙之餘，體驗渡假般的溫馨舒適。讓您在購物、觀光、商務、洽公的旅途中擁有最佳的旅居機能合法安全的住宿空間是馥麗商務旅館給予每一個尊客最真誠的承諾。專業服務的貼心巧思是馥麗商務旅館和每一位貴賓成為永遠朋友的開始。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (30, N'蘭竹大飯店', N'新北市', N'住宿', N'新北市板橋區東門街13號及15 號', N'886-2-29680186', N'住宿時間：下午14:00入住　退房時間：中午12點之前退房　【本店禁煙、禁酒、禁賭】', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (31, N'美莊旅社', N'新北市', N'住宿', N'新北市板橋區東門街3號及5號', N'886-2-29698225', N'美莊旅社一向秉持著『優質享受‧體貼入微』的服務信念，讓顧客有賓至如歸的最佳住房享受，在交通上，旅棧居於樞紐位置，四通八達，多線公車經過，並仳鄰捷運淡水線民權西路站，旅客可利用方便的交通工具，輕鬆到達臺北主要商業區或觀光景點，飯店亦備有詳細旅遊資訊，親切的服務人員亦樂於提供任何訊息。　美莊旅社在設備服務上提供免費無線網路寬頻上網，讓您放心的在悠閒時光中打理好工作，四通八達的交通，不管是洽公或是旅遊都是最便利快速的捷徑。一流的設備，親切的笑容，是美莊旅社給您的第一印象，位於黃金地段，交通便利，購物方便，在喧鬧的都市城鎮中，更能充分享受鬧中取靜的舒適悠閒。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (32, N'悅喜商務飯店', N'新北市', N'住宿', N'新北市板橋區東門街30之2號11、12樓', N'886-2-89658288', N'有一處空間　貼心、人性化的設計規劃　無微不至的體貼與溫暖　讓休憩成為一種最愜意的享受　便捷交通自成一格　四通八達的交通網路　讓移動成為一種沒負擔的樂趣　悅喜的堅持，比你還瞭解你的需求　下塌板橋悅喜飯店　家的感覺隨處可見', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (33, N'百麗旅店', N'新北市', N'住宿', N'新北市板橋區南門街1巷2號', N'886-2-22727398', N'百麗旅店寵愛每位賓客，期待您能盡情享受旅居的美好時光。　簡單中帶流線創意的大廳空間，透過傢飾點綴出躍動的層次，展現出率真的空間性格。　深灰色櫃抬線條給人有沉穩與雋永、搭配別緻的藝品陳設，散發著雅致的氣息。時尚現代感風格室內設計與色調，一系列精心挑選的客房備品，', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (34, N'美錦樂賓館', N'新北市', N'住宿', N'新北市板橋區南雅東路118號', N'886-2-29609933', N'以最經濟化的收費，一秉顧客至上、服務第一為宗旨，務使貴賓舒適便利，歡迎閣下來臺北或北上旅遊、商洽、訪友，敬請下榻於這所溫暖而最富人情味「商旅之家」。美錦樂旅社關注的熱忱，自然洋溢在每個角落，為您設想周到，讓您能得到一晚浪漫的夜晚，深深進入甜美的夢鄉。我們時刻以顧客所需為考量，在不同的需求下我們提供了最合適、最合乎的服務，在未來的日子，美錦樂旅社所有員工更加兢兢業業做好服務，以期待各位先生、女士的蒞臨。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (35, N'新都大旅社', N'新北市', N'住宿', N'新北市板橋區南雅南路1段103號', N'886-2-29689193', N'新都旅社均以誠摯的服務，懇切的款待，舒適的陳設，平實的價格，提供您幽雅寧靜、溫馨醉人的服務，近板橋電信局。新都旅社一向本著以顧客為上的經營理念，實踐誠懇、親切，專業的精神服務每位旅客，溫馨的服務、舒適的空間，是您出門旅遊、洽公的第二個家。　交通便利，以溫馨服務每位旅客，提供您乾淨、舒適的住宿環境，不論是商務洽公或觀光旅遊，一等好旅館都是您最佳的旅宿選擇，專業用心的理念，為出門在外的您打造一個最優質的享受。新都旅社提供您體貼入微、處處關懷的貼心服務，享受溫馨舒適、亦是我們對您不變的承諾。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (36, N'菁鳥旅館', N'新北市', N'住宿', N'新北市板橋區南雅南路一段113號及115號', N'886-2-29669621', N'平價收費、客房溫馨、乾淨整潔。　臨近湳觀光夜市、交通便利。　住宿1000元起，休息400元起，歡迎您的蒞臨。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (37, N'盟園旅社', N'新北市', N'住宿', N'新北市板橋區南雅南路一段1巷15號', N'886-2-89698016', N'盟園大旅社，位於板橋區中心，近南雅夜市，緊臨百貨商圈，是您旅遊、約會、商務最佳選擇。旅社內設備全面裝修翻新，服務人員嚴格訓練，只是為了提供您有個貼心舒適的休息住宿環境，尤其是旅社內風格不同的豪華客房，特別為頂級的洽公人士，戀愛中情侶的設計出舒適的房間氣氛。在交通上，旅棧居於樞紐位置，四通八達，多線公車經過，旅客可利用方便的交通工具，輕鬆到達臺北主要商業區或觀光景點，飯店亦備有詳細旅遊資訊，親切的服務人員亦樂於提供任何訊息。整潔美觀的住宿環境，無論您是出差洽公、或是至此地遊覽名勝，建議您住宿時不訪做個參考！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (38, N'宮賓旅社', N'新北市', N'住宿', N'新北市板橋區南雅南路一段1巷25號', N'886-2-29660889', N'本旅社除了地位適中，交通便捷之外，在客房服通務方面有如24小時客房餐，代訂機票，查詢火車時刻及其它旅遊資訊等，出門在外一切都不比在家，我們深有感觸，所以您在此一如在家，處處溫馨，事事週到，這裡好像您出門在外的另一個家。　宮賓大旅社整潔高雅，舒適明亮，最適合出差居住的好地方，並且高貴不貴，位於市中心,無論是差、洽公或至新北市觀光旅遊，都是您最佳的選擇。關注的熱忱自然洋溢在每個角落，為您設想周到，讓您能得到一晚浪漫的夜晚深深進入甜美的夢鄉。宮賓大旅社交通便利，設備齊全，以溫馨服務每位旅客，提供您乾淨舒適的住宿環境，讓您充分享受愉快與自在。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (39, N'欣芳旅社', N'新北市', N'住宿', N'新北市板橋區南雅南路一段1巷3號', N'886-2-29681381', N'欣芳賓館秉持著『優質享受‧體貼入微』的服務信念，讓顧客有賓至如歸的最佳住房享受，在交通上，旅棧居於樞紐位置，四通八達，多線公車經過，旅客可利用方便的交通工具，輕鬆到達臺北主要商業區或觀光景點，飯店亦備有詳細旅遊資訊，親切的服務人員亦樂於提供任何訊息。欣芳賓館讓您放心的在悠閒時光中打理好工作，四通八達的交通，不管是洽公或是旅遊都是最便利快速的捷徑，以溫馨服務每位旅客，提供您乾淨舒適的住宿環境，讓您出門也有家的感覺，是欣芳賓館所秉持的理念，溫馨的服務、舒適的住宿空間，是您出門在外旅遊、洽公的第二個家。欣芳賓館位於板橋區中心，親切平易近人，服務周到絕對是本旅社給住宿客人最拍胸圃的保證。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (40, N'甜蜜蜜旅館', N'新北市', N'住宿', N'新北市板橋區南雅南路二段28號', N'886-2-29586321', N'甜蜜蜜一流的設備，親切的笑容，是您的第一印象。位於黃金地段，交通便利，購物方便，在喧鬧的都市城鎮中，更能充分享受鬧中取靜的舒適悠閒。當您進入歐鄉旅社的那一刻，您將立即感到櫃檯服務人員親切的招待，即使只是一句小小的問候，都會讓您有賓至如歸的感覺，服務人員的自我期許是『顧客的滿意與讚美，就是我們最大的快樂』。　甜蜜蜜讓您在這裡擁有真正賓至如歸的感受，每一個小細節，嘉麗旅店都鉅細靡遺地設想周到，充滿華麗與典雅而隨著季節改變，所呈現不同的景緻，都能帶給您截然不同的全新感受！是一誠懇親切的合法旅社，擁有便捷的交通與方便的地理環境您可以盡情享受無微不至的服務，精心規劃格調高雅的套房，是您出門在外的最佳選擇。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (41, N'舊金山總督溫泉有限公司', N'新北市', N'景點', N'新北市金山區民生路196號', N'886-2-24082628', N'原名舊金山總督溫泉會館，舊金山總督溫泉的名稱由來，是附近有一座舊的金山海水浴場，加上這裡為日據時期的臺灣總督府（臺北州於昭和13年5月，撥款3萬日元興建。於昭和14年9月竣工，因而命名為「舊金山總督溫泉」）。光復後，國軍以此處為海防要塞，泉源遂廢。軍隊移防後，建物頃廢。直至舊金山總督溫泉團隊投入整建，以原建物為藍圖，盡心竭力尋找舊風格建材，完工後既有新的服務功能，又難得的維護舊建物風格，賦予「新館」溫泉新的生命力。本館溫泉泉水屬於稀有的海底溫泉，除了含有大屯火山山脈特有的硫磺及礦物成份外(沒有濃濃的硫磺味)，因緊鄰海岸，本館溫泉在形成的同時，亦滲透到深層潔淨的海水，因此水中有著淡淡的鹹味，讓人浸泡其中感到無比的清爽舒暢。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (42, N'巨龍山莊', N'新北市', N'景點', N'新北市烏來區新烏路5段60號', N'886-2-26616333', N'依偎在洪荒峽畔的巨龍山莊，建築以紅磚牆砌成，充滿古色古香，且是一家以茶餚主題的餐廳，除以茶餚聞名外，「水世界」溫泉館也頗具知名，大浴池分有捶背、噴絲、單孔、氣泡等各式按摩設備，可享受按摩樂趣。仕女區半露天池，可以邊泡湯邊欣賞洪荒峽畔巨岩嶙峋的景緻；男仕養生池的半露天湯則是欣賞到堰堤水壩的景觀。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (43, N'國際岩湯', N'新北市', N'景點', N'新北市烏來區烏來街22號', N'886-2-26616351', N'國際岩湯採中國式庭園造景，家庭池則採觀音石建材，整體建築規劃及傢具擺設均呈現古樸氣息，大眾池亦提供完善設備，烤箱、氣泡池、冥想池、按摩池、衝擊水柱、蒸汽浴等。『岩湯』集大地之精華孕育而生，含有豐富的天然礦物質，浸泡後感覺神清氣爽精力充沛即保健又養生，另提供以健康為訴求的餐飲，推出低鹽、低脂、低油的低卡路里營養餐，是大台北地區享受泡湯、美食的好地方。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (44, N'小川源溫泉館', N'新北市', N'景點', N'新北市烏來區烏來街32號', N'886-2-26616222', N'成立於1997年，烏來第一家標準溫泉浴場，致力於「讓客戶正確使用溫泉與提供最好的水質」為宗旨，提升溫泉文化、正確使用溫泉，並供應100%純原汁的溫泉，再以專業設備，降溫至適合人體使用，絕不添加一滴山泉水或自來水冷卻，浸泡後效果更佳。使用最純最道地的烏來溫泉，因此內行人莫不趨之若鶩！泡溫泉需建立觀念『要有閒養生，不要有錢看醫生』這是泡溫泉的根本之源。文明病充斥的今日，健身養生有多元的方式，需持之以恆，泡溫泉也需如此。負責人洪榮川先生希望各位客戶能感受到溫泉水質的重要，所以小川源溫泉和玩樂遊憩溫泉、玩水是不同的，每位客戶能來到小川源溫泉能夠大量流汗如同運動般，這樣才不失泡溫泉的目的。FB粉絲團', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (45, N'奇峰石溫泉山莊', N'新北市', N'景點', N'新北市金山區林口28-3號', N'886-2-24080829', N'奇峰石溫泉山莊位於陽金公路4公里處，自民國80年營業至今，是個不論晴雨晨昏、四季皆宜、老少咸宜的好去處！奇峰石溫泉，獲頒「溫泉標章」認證，隸屬大屯山火山群地熱帶，泉水呈弱酸性反應，水質呈灰白色半透明，帶有硫磺味，介於40℃至75℃的中溫溫泉，不能飲用，屬於天然的白硫磺泉（酸性硫酸鹽泉），又名牛奶美人湯，適合大人小孩養生浸浴。冷泉為陽明山天然山泉水，水溫終年20°C以下，水質純淨甘美，無污染。有大眾裸湯池和私人湯屋池可供顧客選擇；本山莊絕不回收溫泉水，且經新北市政府衛生局水質檢驗合格。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (46, N'香草花源溫泉養生館', N'新北市', N'景點', N'新北市萬里區萬里加投18之4號', N'886-2-24987733', N'地中海風情的主題會館，藍天白牆和湛藍的水連天，心嚮往的地中海就在萬里的香草花源溫泉養生館。我們有峇里島風格的熱水SPA、地中海風情的冷水泳池、兒童戲水區、和風溫泉、歐洲露天的熱水SPA芳香療池、高低溫烤箱具備數種功能的蒸氣室。慵懶的陽光照著GLASS HOUSE，徐徐的微風吹拂著你我，讓我們洗滌您心靈的塵囂。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (47, N'阿湯哥溫泉', N'新北市', N'景點', N'新北市烏來區溫泉街75號', N'886-2-26616307', N'烏來為原住民山區，主要以泰雅族為主，處處可見泰雅族文化圖騰，且以溫泉與山櫻花聞名每逢春天形成落櫻繽紛的燦爛世界，且桶後溪及南勢溪可為旅客消暑，溪中有溪哥魚、苦花魚、溪蝦等。烏來區境內之自然植物、天然瀑布溪流，漫步於情人步道及森林步道中，享受大自然之芬多精，可謂人生一大享受。本館位於烏來溫泉街上，竭誠歡迎各方遠道而來的遊客至本館泡湯休憩。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (48, N'伊豆商店', N'新北市', N'景點', N'新北市烏來區溫泉街72號', N'886-2-26616620', N'溫泉成分及泉質類別：碳酸氫鹽泉', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (49, N'永和樂華夜市', N'新北市', N'景點', N'新北市永和區永平路', N'886-2-29282828', N'有卅年攸久歷史的永和樂華夜市，是雙和地區首屈一指的知名夜市，地處永和區中心交通便捷的永平路，不算長的一條街匯集了上百家的小吃攤及成衣店，入夜之後燈火通明有如白晝，絕對可以同時滿足都市人空乏的胃與寂寥的心。距離永和路入口處不遠左手邊的樂華蚵仔煎算是特色之一，歷經兩代的考驗，第二代三兄妹仍能攜手承接父親衣缽，繼續這個小吃的不朽傳奇。蚵仔煎的特別之處，除了精選新鮮的蚵仔，以細嫩的空心菜取代一般蚵仔煎慣用的茼蒿或小白菜，口感更是一絕。此外，這裡的豬血湯採用特調的沙茶調味，不但鮮而不腥，豬血嫩如豆腐的質感，也令人回味無窮。如果你覺得市面上連鎖經營的鍋貼專賣店已算令你稱道，那你一定沒吃過樂華夜市的鍋貼。店中雖然只賣鍋貼及酸辣湯兩樣東西，卻讓老闆從早忙到晚，每天平均賣出上萬個鍋貼，教店中人手個個人仰馬翻。走進店中只見四個大型生鐵平底鍋一字排開，一次可煎製四百個鍋貼，香味撲鼻，聞香不來也難。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (50, N'樹林夜市', N'新北市', N'景點', N'新北市樹林區博愛街', N'886-2-26812106', N'說起樹林夜市的發展源起，得歸功於「有拜有保佑」的地方廟宇─濟安宮。當初因各地慕名到樹林濟安宮朝拜的香客絡繹不絕，才造就了保安街、博愛街、溪北路一帶市集的繁榮。只不過隨著樹林日漸朝向都市型城鎮發展，樹林夜市也轉型為綜合型的夜市，白天當地是現代新穎的商店街當道，到了下午四時以後，小吃攤才開始悄悄地現身，一場令人聞香下馬的喧鬧，一直要持續到午夜十二時灰姑娘的魔法消失為止。與板橋南雅、三重三和或新莊夜市比較起來，樹林夜市的小吃攤不以「量」取勝，花樣及選擇性也不是那麼多，但因有位在樹林火車站旁的地利之便，入夜之後，樹林夜市仍吸引大批晝伏夜出的食客，從四面八方而來，為的不僅僅是填飽肚子，更可感受在人群中呼吸的踏實感。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (51, N'新莊廟街夜市', N'新北市', N'景點', N'新北市新莊區新莊路', N'886-2-29929891', N'提到新莊夜市，最膾炙人口的美食區新莊路214巷，短短的巷道之間，左一口香Ｑ的油飯，右一口赤肉鹹圓仔湯，飽腹之後再來點綠豆湯、冷凍豆花，已覺心滿意足。至於保證吃得到的美食，還有新莊路上武聖廟旁的香菇赤肉羹。別看小店的坪數不大，卻是三代相傳的老店，口感紮實的肉羹堅持以整塊的素肉為材料，令人百吃不膩。此外，同樣位在新莊路上的蝦仁羹，以及紅燒麵、滷味，都各自有擁有死忠的擁護者，老闆的手藝也都是經過千錘百鍊的考驗，不怕貨比貨。另外特別值得一提的是，此外，就跟許多與廟宇相隨的夜市一般，新莊夜市中的慈祐宮與武聖廟，也都具有數百年的歷史，是國家認證的三級古蹟，它不但庇佑了老街小吃攤販的生計，更見證了新莊的百年興衰，逛夜市之餘不妨順道捻柱香，祈求闔家平安，諸事大吉。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (52, N'蘆洲廟口夜市(形象商圈)', N'新北市', N'景點', N'新北市蘆洲區得勝街96號', N'886-2-22811484', N'蘆洲夜市位於新北市蘆洲區，區內的湧蓮寺從清代開始在廟口便有商人聚集形成傳統市集，經四次翻修，成為蘆洲人的信仰中心。蘆洲夜市位處得勝街與成功路交叉口形成十字型商圈，夜市內商家林立，深受當地人熱愛。夜市主軸為成功路與得勝街，兩旁設有商家，中心點為蘆洲湧蓮寺，十分熱鬧。由於以香火鼎盛的湧蓮寺為中心，又稱廟口夜市，街上古厝廟宇及知名小吃、老店林立，主要特色在於是當地居民的生活市集，早、中、晚一日三市，早晨是提供居民充裕的生鮮和民生用品的傳統市場，到了中午與傍晚則成為民眾休閒購物與餐飲的場所，近年在經濟部商業司輔導之下，將商圈特色重新塑造，並製作商圈導覽手冊、商圈網站行銷等，形象更為鮮明。此地也是傳統美食重鎮，聚集不少家傳好幾代的在地小吃，如豆花、肉圓、麵線、滷味、湯圓等，由於傳統小吃切仔麵發源於蘆洲，因此當地切仔麵店特別多。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (53, N'輔大花園觀光夜市', N'新北市', N'景點', N'新北市泰山區中山路2段666號', N'886-2-29023869', N'輔大花園觀光夜市號稱全台北最大的夜市，百貨區除了一般百 貨、服飾、飾品之外也有品牌專櫃進駐，用貨櫃屋的擺設方式，呈現出百貨公司的質感，遊戲區除了有彈珠台、射飛鏢、喊價區、九宮格遊戲、『地震屋』、『小小挖土機』及『4D動感電影院』，還有其他夜市沒有的大型遊樂器材『碰碰車』，美食類不僅有道地的傳統小吃、異國美食，還有許多的特色飲品及甜點，如此多樣化的夜市,吃、喝、玩、樂樣樣都有，保證讓你流連忘返！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (54, N'黃石市場', N'新北市', N'景點', N'新北市板橋區宮口街37號', N'886-2-29693639', N'「黃石市場」迄今已有30餘年，是板橋最具規模的市場。原本只是當地居民採買生鮮食材的傳統市場，近年來卻因為美食小吃累積不少知名度。這裡的小吃既便宜又大碗，讓人大呼過癮！重重疊疊的攤商與店家將圍繞蜿蜒在「黃石市場」的長巷構築成一條風味重地。而這裡也像是個「美食與蔬果肉」攤商的大熔爐，匯聚了台灣各地的農林特產、道地小吃…等，是想體驗台灣傳統市場的必遊景點！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (55, N'鶯歌南雅路夜市', N'新北市', N'景點', N'新北市鶯歌區', N'886-2-26780202', N'鶯歌區的南雅夜市，離陶瓷老街及火車站都不算遠，在遊玩鶯歌半日之後進入黃昏，剛好可以到夜市裡吃晚餐，夜市路標就在電信局大門口對面。夜市裡有一家開了三十年以上的水煎包，堅持皮薄餡實在而美味的特色水煎包，餡料裡的豬肉，也是老闆精挑細選，使用山上的黑豬肉，與堅持選用帶有油脂的三層肉，意外發展出這滷肉水煎包的特色。水煎包攤沒有店名，別忘了仔細搜食。許多美食節目都曾介紹採訪，是值得推薦給大家的鶯歌美食！『南雅夜市搖搖冰』雖然時代變遷，但仍保有其三十年來精心獨特的口味，雖然成本比較高，但為讓消費者喝的安心，堅持全程使用天然水果與逆滲透純水製作，水果現場壓搾，絕對新鮮。保有古早味又健康無負擔的搖搖冰，別忘了暢飲一夏喔!', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (56, N'新北市立十三行博物館', N'新北市', N'景點', N'新北市八里區博物館路200號', N'886-2-26191313', N'本館位於新北市八里區，為北臺灣唯一以考古定位的博物館。本館設立之宗旨係以保存及推廣十三行文化，在全體同仁的努力下，積極推動考古遺址保存、考古教育並促進藝術文化觀光，使神秘的考古學成為公開可獲取的知識，不但是八里的社區博物館、左岸的環境生態博物館，目前積極朝國際考古博物館邁進。位在八里的「十三行博物館」不但是北臺灣唯一的考古博物館，也是新北市第一所榮獲環境教育場域認證的博物館。特色是以輕鬆有趣的互動形式，讓我們知道十三行人在千年以前過的是什麼的生活，很適合親子一同來參觀學習小知識；十三行文化屬於北臺灣地區的鐵器時代，是目前臺灣唯一確定擁有煉鐵技術的史前居民。博物館設有遺址出土各項重要文物常設展、特展廳、考古學習體驗室，詳細介紹了有關十三行文化、圓山文化等臺灣過往的遺跡與背景。參觀完館內，別忘了到博物館頂的「鯨背沙丘」，可以觀海、遠眺淡水漁人碼頭，景觀很棒喔！', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (57, N'凌雲禪寺', N'新北市', N'景點', N'新北市五股區凌雲路三段116號', N'886-2-22913771', N'凌雲禪寺，俗稱五股凌雲寺，位於觀音山內巖，上負懸壁，下臨深谷，形勢雄壯，香火鼎盛，寺貌巍峨，寺內正殿巨型千手千眼觀音神像，是國內最大的室內佛。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (58, N'三芝遊客中心及名人文物館', N'新北市', N'景點', N'新北市三芝區埔坪里埔頭坑164-2號', N'886-2-86355143', N'三芝遊客中心位於群山環繞的山坡地上，全區視野遼闊，除了提供遊客舒適寬敞的休憩空間，也可進行旅遊諮詢、展場介紹與資料索取，方便又多元。名人文物館展示三芝四位名人的生平貢獻，有一代名醫杜聰明、臺灣首位國際作曲家江文也、第一位直選總統李登輝、政治先鋒盧修一，藉著他們的生平故事，彰顯了三芝地靈人傑出名人的好風光。 ', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (59, N'十分瀑布公園', N'新北市', N'景點', N'新北市平溪區乾坑10號', N'886-2-24958605', N'十分瀑布是垂簾型瀑布，岩層傾向與水流方向相反，屬逆斜層特徵，因與北美洲尼加拉瀑布相似，故有台灣尼加拉瀑布的美稱。 氣勢輝弘，水聲隆隆，聲勢浩大，非常壯觀，觀賞此景，令人不禁讚嘆大自然鬼斧神工。水潭上方瀰漫著水氣，若剛好有陽光照射，還會出現一道斜掛在瀑布上的彩虹，所以也有「彩虹淵」的別稱。', NULL)
INSERT [dbo].[attractions] ([attractionID], [name], [county], [type], [address], [tel], [intro], [image]) VALUES (60, N'碧潭風景區', N'新北市', N'景點', N'新北市新店區新店路', N'886-2-29132579', N'「碧潭風景區」就位在捷運新店站附近，由於新店溪流經此地，形成水色橙碧，平靜寬廣的河面，因此取名「碧潭」。碧潭景觀優美，除了有起伏低緩的和美山以及綿延的河濱自行車道，適合情侶、親子一同出遊外，還有歷史悠久的吊橋。來這裡可以走上「碧潭吊橋」俯瞰整片風景區的河岸美景、踩水上腳踏車(天鵝船)遊湖、租自行車沿河岸自行車道欣賞周邊景色、或到充滿浪漫異國風情的「水岸街坊」商店街與愛神邱比特裝置藝術、逗趣3D小彩繪合影。', NULL)
SET IDENTITY_INSERT [dbo].[attractions] OFF
INSERT [dbo].[club_member_list] ([memID], [clubID], [joinTime]) VALUES (1, 1, CAST(0x783D0B00 AS Date))
INSERT [dbo].[club_member_list] ([memID], [clubID], [joinTime]) VALUES (1, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[club_member_list] ([memID], [clubID], [joinTime]) VALUES (2, 1, CAST(0x783D0B00 AS Date))
INSERT [dbo].[club_member_list] ([memID], [clubID], [joinTime]) VALUES (2, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[club_member_list] ([memID], [clubID], [joinTime]) VALUES (3, 1, CAST(0x783D0B00 AS Date))
INSERT [dbo].[club_member_list] ([memID], [clubID], [joinTime]) VALUES (4, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[club_member_list] ([memID], [clubID], [joinTime]) VALUES (6, 2, CAST(0x783D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[clubs] ON 

INSERT [dbo].[clubs] ([clubID], [clubName], [managerId], [locationId], [brief], [refURL], [vistors], [vistorsInMonth], [addr], [clubPic]) VALUES (1, N'chewme旅行社', 1, 1, N'我們是chewme旅行社,希望大家能夠來這結交到好友', N'http://www.chewme.com', 6, 2, N'台北市大安區大安捷運站', NULL)
INSERT [dbo].[clubs] ([clubID], [clubName], [managerId], [locationId], [brief], [refURL], [vistors], [vistorsInMonth], [addr], [clubPic]) VALUES (2, N'建業旅行社', 1, 1, N'建業旅行社,提供重機行程', N'http://www.chianya.com', 2, 1, N'新北市新店區民權路', NULL)
SET IDENTITY_INSERT [dbo].[clubs] OFF
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (1, 1, N'十一月天氣有點冷,還是說這次去墾丁會更好', 1, CAST(0x733D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (2, 1, N'測試', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (3, 1, N'測試div1', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (4, 2, N'測試div2', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (5, 1, N'這個是新的測試', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (6, 1, N'新的測試2', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (7, 1, N'新的測試3', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (8, 1, N'新的測試3', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (9, 1, N'測試4', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (10, 1, N'測試5', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (11, 1, N'測試5', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (12, 1, N'測試5', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (13, 1, N'測試5', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (14, 1, N'測試6', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (15, 1, N'測試6', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (16, 1, N'測試7', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (17, 1, N'測試8', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (18, 1, N'希望是最後測試', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (19, 1, N'希望是最後測試2', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (20, 2, N'測試第二個', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (21, 2, N'測試第二個', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (22, 2, N'測試第二個', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (23, 2, N'測試第三個', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (24, 1, N'應該是成功的吧', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (25, 1, N'成功?', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (26, 1, N'成功???', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (27, 1, N'那我們去墾丁玩吧', 1, CAST(0x773D0B00 AS Date))
INSERT [dbo].[comments] ([commentID], [issueID], [content], [commenterId], [commentDate]) VALUES (28, 1, N'好喔', 1, CAST(0x773D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[comments] OFF
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (10, N'CHA', N'彰化縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (12, N'CYI', N'嘉義市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (13, N'CYQ', N'嘉義縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (6, N'HSQ', N'新竹縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (5, N'HSZ', N'新竹市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (18, N'HUA', N'花蓮縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (17, N'ILA', N'宜蘭縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (1, N'KEE', N'基隆市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (15, N'KHH', N'高雄市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (21, N'KIN', N'金門縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (20, N'LIE', N'連江縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (7, N'MIA', N'苗栗縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (9, N'NAN', N'南投縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (3, N'NWT', N'新北市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (22, N'PEN', N'澎湖縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (16, N'PIF', N'屏東縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (4, N'TAO', N'桃園市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (14, N'TNN', N'臺南市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (2, N'TPE', N'臺北市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (19, N'TTT', N'臺東縣')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (8, N'TXG', N'臺中市')
INSERT [dbo].[countrys] ([queue], [countryID], [countryName]) VALUES (11, N'YUN', N'雲林縣')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (100, N'中正區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (103, N'大同區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (104, N'中山區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (105, N'松山區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (106, N'大安區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (108, N'萬華區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (110, N'信義區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (111, N'士林區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (112, N'北投區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (114, N'內湖區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (115, N'南港區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (116, N'文山區', N'臺北市', N'TPE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (200, N'仁愛區', N'基隆市', N'KEE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (201, N'信義區', N'基隆市', N'KEE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (202, N'中正區', N'基隆市', N'KEE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (203, N'中山區', N'基隆市', N'KEE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (204, N'安樂區', N'基隆市', N'KEE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (205, N'暖暖區', N'基隆市', N'KEE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (206, N'七堵區', N'基隆市', N'KEE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (207, N'萬里區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (208, N'金山區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (209, N'南竿鄉', N'連江縣', N'LIE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (210, N'北竿鄉', N'連江縣', N'LIE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (211, N'莒光鄉', N'連江縣', N'LIE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (212, N'東引鄉', N'連江縣', N'LIE')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (220, N'板橋區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (221, N'汐止區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (222, N'深坑區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (223, N'石碇區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (224, N'瑞芳區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (226, N'平溪區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (227, N'雙溪區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (228, N'貢寮區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (231, N'新店區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (232, N'坪林區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (233, N'烏來區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (234, N'永和區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (235, N'中和區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (236, N'土城區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (237, N'三峽區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (238, N'樹林區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (239, N'鶯歌區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (241, N'三重區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (242, N'新莊區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (243, N'泰山區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (244, N'林口區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (247, N'蘆洲區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (248, N'五股區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (249, N'八里區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (251, N'淡水區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (252, N'三芝區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (253, N'石門區', N'新北市', N'NWT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (260, N'宜蘭市', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (261, N'頭城鎮', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (262, N'礁溪鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (263, N'壯圍鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (264, N'員山鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (265, N'羅東鎮', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (266, N'三星鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (267, N'大同鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (268, N'五結鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (269, N'冬山鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (270, N'蘇澳鎮', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (272, N'南澳鄉', N'宜蘭縣', N'ILA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (300, N'東區', N'新竹市', N'HSZ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (301, N'北區', N'新竹市', N'HSZ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (302, N'竹北市', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (303, N'湖口鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (304, N'新豐鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (305, N'新埔鎮', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (306, N'關西鎮', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (307, N'芎林鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (308, N'寶山鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (309, N'香山區', N'新竹市', N'HSZ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (310, N'竹東鎮', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (311, N'五峰鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (312, N'橫山鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (313, N'尖石鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (314, N'北埔鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (315, N'峨眉鄉', N'新竹縣', N'HSQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (320, N'中壢區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (324, N'平鎮區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (325, N'龍潭區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (326, N'楊梅區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (327, N'新屋區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (328, N'觀音區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (330, N'桃園區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (333, N'龜山區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (334, N'八德區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (335, N'大溪區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (336, N'復興區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (337, N'大園區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (338, N'蘆竹區', N'桃園市', N'TAO')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (350, N'竹南鎮', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (351, N'頭份市', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (352, N'三灣鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (353, N'南庄鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (354, N'獅潭鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (356, N'後龍鎮', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (357, N'通霄鎮', N'苗栗縣', N'MIA')
GO
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (358, N'苑裡鎮', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (360, N'苗栗市', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (361, N'造橋鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (362, N'頭屋鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (363, N'公館鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (364, N'大湖鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (365, N'泰安鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (366, N'銅鑼鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (367, N'三義鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (368, N'西湖鄉', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (369, N'卓蘭鎮', N'苗栗縣', N'MIA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (400, N'市中區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (401, N'市東區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (402, N'市南區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (403, N'市西區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (404, N'市北區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (406, N'北屯區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (407, N'西屯區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (408, N'南屯區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (411, N'太平區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (412, N'大里區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (413, N'霧峰區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (414, N'烏日區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (420, N'豐原區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (421, N'后里區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (422, N'石岡區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (423, N'東勢區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (424, N'和平區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (426, N'新社區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (427, N'潭子區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (428, N'大雅區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (429, N'神岡區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (432, N'大肚區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (433, N'沙鹿區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (434, N'龍井區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (435, N'梧棲區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (436, N'清水區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (437, N'大甲區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (438, N'外埔區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (439, N'大安區', N'臺中市', N'TXG')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (500, N'彰化市', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (502, N'芬園鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (503, N'花壇鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (504, N'秀水鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (505, N'鹿港鎮', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (506, N'福興鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (507, N'線西鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (508, N'和美鎮', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (509, N'伸港鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (510, N'員林市', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (511, N'社頭鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (512, N'永靖鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (513, N'埔心鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (514, N'溪湖鎮', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (515, N'大村鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (516, N'埔鹽鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (520, N'田中鎮', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (521, N'北斗鎮', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (522, N'田尾鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (523, N'埤頭鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (524, N'溪州鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (525, N'竹塘鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (526, N'二林鎮', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (527, N'大城鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (528, N'芳苑鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (530, N'二水鄉', N'彰化縣', N'CHA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (540, N'南投市', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (541, N'中寮鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (542, N'草屯鎮', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (544, N'國姓鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (545, N'埔里鎮', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (546, N'仁愛鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (551, N'名間鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (552, N'集集鎮', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (553, N'水里鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (555, N'魚池鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (556, N'信義鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (557, N'竹山鎮', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (558, N'鹿谷鄉', N'南投縣', N'NAN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (600, N'東區', N'嘉義市', N'CYI')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (601, N'西區', N'嘉義市', N'CYI')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (602, N'番路鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (603, N'梅山鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (604, N'竹崎鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (605, N'里山鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (606, N'中埔鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (607, N'大埔鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (608, N'水上鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (611, N'鹿草鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (612, N'太保市', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (613, N'朴子市', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (614, N'東石鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (615, N'六腳鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (616, N'新港鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (621, N'民雄鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (622, N'大林鎮', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (623, N'溪口鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (624, N'義竹鄉', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (625, N'布袋鎮', N'嘉義縣', N'CYQ')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (630, N'斗南鎮', N'雲林縣', N'YUN')
GO
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (631, N'大埤鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (632, N'虎尾鎮', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (633, N'土庫鎮', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (634, N'褒忠鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (635, N'東勢鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (636, N'臺西鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (637, N'崙背鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (638, N'麥寮鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (640, N'斗六市', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (643, N'林內鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (646, N'古坑鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (647, N'莿桐鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (648, N'西螺鎮', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (649, N'二崙鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (651, N'北港鎮', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (652, N'水林鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (653, N'口湖鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (654, N'四湖鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (655, N'元長鄉', N'雲林縣', N'YUN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (700, N'中西區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (701, N'東區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (702, N'南區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (704, N'北區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (708, N'安平區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (709, N'安南區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (710, N'永康區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (711, N'歸仁區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (712, N'新化區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (713, N'左鎮區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (714, N'玉井區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (715, N'楠西區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (716, N'南化區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (717, N'仁德區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (718, N'關廟區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (719, N'龍崎區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (720, N'官田區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (721, N'麻豆區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (722, N'佳里區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (723, N'西港區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (724, N'七股區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (725, N'將軍區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (726, N'學甲區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (727, N'北門區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (730, N'新營區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (731, N'後壁區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (732, N'白河區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (733, N'東山區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (734, N'六甲區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (735, N'下營區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (736, N'柳營區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (737, N'鹽水區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (741, N'善化區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (742, N'大內區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (743, N'山上區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (744, N'新市區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (745, N'安定區', N'臺南市', N'TNN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (800, N'新興區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (801, N'前金區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (802, N'苓雅區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (803, N'鹽埕區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (804, N'鼓山區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (805, N'旗津區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (806, N'前鎮區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (807, N'三民區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (811, N'楠梓區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (812, N'小港區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (813, N'左營區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (814, N'仁武區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (815, N'大社區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (817, N'東沙群島', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (819, N'南沙群島', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (820, N'岡山區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (821, N'路竹區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (822, N'阿蓮區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (823, N'田寮區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (824, N'燕巢區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (825, N'橋頭區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (826, N'梓官區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (827, N'彌陀區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (828, N'永安區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (829, N'湖內區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (830, N'鳳山區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (831, N'大寮區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (832, N'林園區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (833, N'鳥松區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (840, N'大樹區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (842, N'旗山區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (843, N'美濃區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (844, N'六龜區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (845, N'內門區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (846, N'杉林區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (847, N'甲仙區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (848, N'桃源區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (849, N'那瑪夏區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (851, N'茂林區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (852, N'茄萣區', N'高雄市', N'KHH')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (880, N'馬公市', N'澎湖縣', N'PEN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (881, N'西嶼鄉', N'澎湖縣', N'PEN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (882, N'望安鄉', N'澎湖縣', N'PEN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (883, N'七美鄉', N'澎湖縣', N'PEN')
GO
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (884, N'白沙鄉', N'澎湖縣', N'PEN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (885, N'湖西鄉', N'澎湖縣', N'PEN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (890, N'金沙鎮', N'金門縣', N'KIN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (891, N'金湖鎮', N'金門縣', N'KIN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (892, N'金寧鄉', N'金門縣', N'KIN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (893, N'金城鎮', N'金門縣', N'KIN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (894, N'烈嶼鄉', N'金門縣', N'KIN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (896, N'烏坵鄉', N'金門縣', N'KIN')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (900, N'屏東市', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (901, N'三地門鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (902, N'霧臺鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (903, N'瑪家鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (904, N'九如鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (905, N'里港鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (906, N'高樹鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (907, N'鹽埔鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (908, N'長治鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (909, N'麟洛鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (911, N'竹田鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (912, N'內埔鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (913, N'萬丹鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (920, N'潮州鎮', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (921, N'泰武鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (922, N'來義鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (923, N'萬巒鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (924, N'崁頂鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (925, N'新埤鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (926, N'南州鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (927, N'林邊鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (928, N'東港鎮', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (929, N'琉球鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (931, N'佳冬鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (932, N'新園鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (940, N'枋寮鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (941, N'枋山鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (942, N'春日鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (943, N'獅子鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (944, N'車城鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (945, N'牡丹鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (946, N'恆春鎮', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (947, N'滿州鄉', N'屏東縣', N'PIF')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (950, N'臺東市', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (951, N'綠島鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (952, N'蘭嶼鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (953, N'延平鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (954, N'卑南鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (955, N'鹿野鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (956, N'關山鎮', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (957, N'海端鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (958, N'池上鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (959, N'東河鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (961, N'成功鎮', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (962, N'長濱鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (963, N'太麻里鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (964, N'金峰鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (965, N'大武鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (966, N'達仁鄉', N'臺東縣', N'TTT')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (970, N'花蓮市', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (971, N'新城鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (972, N'秀林鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (973, N'吉安鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (974, N'壽豐鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (975, N'鳳林鎮', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (976, N'光復鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (977, N'豐濱鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (978, N'瑞穗鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (979, N'萬榮鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (981, N'玉里鎮', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (982, N'卓溪鄉', N'花蓮縣', N'HUA')
INSERT [dbo].[countys] ([countyID], [countyName], [countryName], [countryID]) VALUES (983, N'富里鄉', N'花蓮縣', N'HUA')
SET IDENTITY_INSERT [dbo].[issues] ON 

INSERT [dbo].[issues] ([issueID], [clubID], [issueTitle], [issueContent], [proposerID], [issuepic]) VALUES (1, 1, N'第一個在社團裡面的議題', N'', 1, NULL)
INSERT [dbo].[issues] ([issueID], [clubID], [issueTitle], [issueContent], [proposerID], [issuepic]) VALUES (2, 1, N'第二個在社團裡面的議題', N'因為是第二個社團示範一題', 2, NULL)
SET IDENTITY_INSERT [dbo].[issues] OFF
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (1, 1, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (1, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (1, 3, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (2, 1, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (2, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (3, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (4, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (5, 1, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (5, 2, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (6, 1, CAST(0x783D0B00 AS Date))
INSERT [dbo].[join_activitys] ([memId], [actID], [joinTime]) VALUES (6, 3, CAST(0x783D0B00 AS Date))
INSERT [dbo].[m_friends_lists] ([memId], [friendId], [fStatus]) VALUES (1, 3, N'好友')
INSERT [dbo].[m_friends_lists] ([memId], [friendId], [fStatus]) VALUES (1, 4, N'好友')
INSERT [dbo].[m_friends_lists] ([memId], [friendId], [fStatus]) VALUES (1, 5, N'待確認')
INSERT [dbo].[m_friends_lists] ([memId], [friendId], [fStatus]) VALUES (1, 6, N'好友')
SET IDENTITY_INSERT [dbo].[members] ON 

INSERT [dbo].[members] ([memId], [memberId], [memName], [memNickN], [memPwd], [memBirthday], [memMail], [memAddr], [memPhone], [memIntr], [memPhoto], [memStatus], [memRole], [googleId]) VALUES (1, N'eeit970301', N'蔡家華', N'番薯島小霸王', N'eeit970301', CAST(0xDE160B00 AS Date), N'eeit970301@gmail.com', N'台北市大安區和平東路1號', N'0912-345-678', N'哇哈哈哈哈', NULL, N'正常', N'一般會員', NULL)
INSERT [dbo].[members] ([memId], [memberId], [memName], [memNickN], [memPwd], [memBirthday], [memMail], [memAddr], [memPhone], [memIntr], [memPhoto], [memStatus], [memRole], [googleId]) VALUES (2, N'eeit970302', N'馬立夯', N'贏馬赫', N'eeit970302', CAST(0x4FFE0A00 AS Date), N'eeit970302@gmail.com', N'基隆市中正區和平東路5號', N'0987-645-321', N'我愛騎車旅遊', NULL, N'正常', N'社團管理員', NULL)
INSERT [dbo].[members] ([memId], [memberId], [memName], [memNickN], [memPwd], [memBirthday], [memMail], [memAddr], [memPhone], [memIntr], [memPhoto], [memStatus], [memRole], [googleId]) VALUES (3, N'eeit970303', N'陳建志', N'見仁見智', N'eeit970303', CAST(0x3EF90A00 AS Date), N'eeit970303@gmail.com', N'台北市中正區館前路257號', N'0966-555-444', N'我喜歡爬山', NULL, N'正常', N'一般會員', NULL)
INSERT [dbo].[members] ([memId], [memberId], [memName], [memNickN], [memPwd], [memBirthday], [memMail], [memAddr], [memPhone], [memIntr], [memPhoto], [memStatus], [memRole], [googleId]) VALUES (4, N'eeit970304', N'黃一芳', N'水果茶超好喝', N'eeit970304', CAST(0x37120B00 AS Date), N'eeit970304@gmail.com', N'桃園市歸仁區歸仁路7號', N'0922-777-789', N'哪裡有水果茶哪裡去', NULL, N'正常', N'一般會員', NULL)
INSERT [dbo].[members] ([memId], [memberId], [memName], [memNickN], [memPwd], [memBirthday], [memMail], [memAddr], [memPhone], [memIntr], [memPhoto], [memStatus], [memRole], [googleId]) VALUES (5, N'eeit970305', N'莊曉癸', N'鬼頭鬼腦', N'eeit970305', CAST(0x36270B00 AS Date), N'eeit970305@gmail.com', N'新北市新店區中興路246號', N'0987-948-947', N'才不告訴膩雷', NULL, N'黑名單', N'一般會員', NULL)
INSERT [dbo].[members] ([memId], [memberId], [memName], [memNickN], [memPwd], [memBirthday], [memMail], [memAddr], [memPhone], [memIntr], [memPhoto], [memStatus], [memRole], [googleId]) VALUES (6, N'eeit970306', N'廖美芽', N'小新的媽', N'eeit970306', CAST(0x330F0B00 AS Date), N'eeit970306@gmail.com', N'高雄市左營區仁愛路42號', N'0956-565-566', N'親子旅遊我最行', NULL, N'正常', N'一般會員', NULL)
SET IDENTITY_INSERT [dbo].[members] OFF
SET IDENTITY_INSERT [dbo].[questions] ON 

INSERT [dbo].[questions] ([questionId], [clubId], [qTitle], [qcontent], [askerId], [readed]) VALUES (1, 1, N'番薯島小霸王提問', N'你好,我是番薯島小霸王,看到你們的社團感到十分興趣,請問你們大概是多久出團一次呢', 1, 0)
SET IDENTITY_INSERT [dbo].[questions] OFF
SET IDENTITY_INSERT [dbo].[replys] ON 

INSERT [dbo].[replys] ([reqlyId], [questionId], [content], [replyerId], [replyDate], [readed]) VALUES (1, 1, N'回覆:番薯島小霸王你好,感謝你的來信,我們的社團大約每個禮拜都會有一天的出團活動,大約在一個禮拜前就會公布我們的行程及其價格,可以點選參加我們的社團,我們會不定期的寄給你們我們最新行程', 2, CAST(0x733D0B00 AS Date), 1)
INSERT [dbo].[replys] ([reqlyId], [questionId], [content], [replyerId], [replyDate], [readed]) VALUES (2, 1, N'回覆:感謝你,那請問社團有年費或月費的制度嗎?', 1, CAST(0x733D0B00 AS Date), 1)
INSERT [dbo].[replys] ([reqlyId], [questionId], [content], [replyerId], [replyDate], [readed]) VALUES (3, 1, N'回覆:我們的社團並沒有收取任何的年費及月費,我們的費用為每次單次的出團費用?', 2, CAST(0x733D0B00 AS Date), 1)
INSERT [dbo].[replys] ([reqlyId], [questionId], [content], [replyerId], [replyDate], [readed]) VALUES (4, 1, N'回覆:你好,我大概知道了,謝謝?', 1, CAST(0x733D0B00 AS Date), 0)
SET IDENTITY_INSERT [dbo].[replys] OFF
/****** Object:  Index [UQ__members__338F576C6007DF0A]    Script Date: 2017/11/1 上午 09:51:10 ******/
ALTER TABLE [dbo].[members] ADD  CONSTRAINT [UQ__members__338F576C6007DF0A] UNIQUE NONCLUSTERED 
(
	[memId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__members__7FD7CF17531B6104]    Script Date: 2017/11/1 上午 09:51:10 ******/
ALTER TABLE [dbo].[members] ADD  CONSTRAINT [UQ__members__7FD7CF17531B6104] UNIQUE NONCLUSTERED 
(
	[memberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__members__A16874B6960EAE33]    Script Date: 2017/11/1 上午 09:51:10 ******/
ALTER TABLE [dbo].[members] ADD  CONSTRAINT [UQ__members__A16874B6960EAE33] UNIQUE NONCLUSTERED 
(
	[memNickN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[ArticleShare]  WITH CHECK ADD  CONSTRAINT [FK_ArticleShare_attractions] FOREIGN KEY([attractionID])
REFERENCES [dbo].[attractions] ([attractionID])
GO
ALTER TABLE [dbo].[ArticleShare] CHECK CONSTRAINT [FK_ArticleShare_attractions]
GO
ALTER TABLE [dbo].[ArticleShare]  WITH CHECK ADD  CONSTRAINT [FK_ArticleShare_members] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[ArticleShare] CHECK CONSTRAINT [FK_ArticleShare_members]
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
ALTER TABLE [dbo].[m_friends_lists]  WITH CHECK ADD  CONSTRAINT [FK_m_friends_lists_members] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[m_friends_lists] CHECK CONSTRAINT [FK_m_friends_lists_members]
GO
ALTER TABLE [dbo].[m_friends_lists]  WITH CHECK ADD  CONSTRAINT [FK_m_friends_lists_members1] FOREIGN KEY([friendId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[m_friends_lists] CHECK CONSTRAINT [FK_m_friends_lists_members1]
GO
ALTER TABLE [dbo].[msg_rooms]  WITH CHECK ADD  CONSTRAINT [FK_msg_rooms_members] FOREIGN KEY([memId])
REFERENCES [dbo].[members] ([memId])
GO
ALTER TABLE [dbo].[msg_rooms] CHECK CONSTRAINT [FK_msg_rooms_members]
GO
ALTER TABLE [dbo].[msgs]  WITH CHECK ADD  CONSTRAINT [FK_msgs_msg_rooms] FOREIGN KEY([msgRoomId])
REFERENCES [dbo].[msg_rooms] ([msgRoomId])
GO
ALTER TABLE [dbo].[msgs] CHECK CONSTRAINT [FK_msgs_msg_rooms]
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
