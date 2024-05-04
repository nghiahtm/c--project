USE [master]
GO
/****** Object:  Database [QLBanCayCanh]    Script Date: 5/4/2024 9:16:25 PM ******/
CREATE DATABASE [QLBanCayCanh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBanCayCanh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBanCayCanh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBanCayCanh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBanCayCanh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLBanCayCanh] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBanCayCanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBanCayCanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBanCayCanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBanCayCanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBanCayCanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBanCayCanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBanCayCanh] SET  MULTI_USER 
GO
ALTER DATABASE [QLBanCayCanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBanCayCanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBanCayCanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBanCayCanh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBanCayCanh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBanCayCanh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBanCayCanh', N'ON'
GO
ALTER DATABASE [QLBanCayCanh] SET QUERY_STORE = OFF
GO
USE [QLBanCayCanh]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID_Cart] [int] IDENTITY(1,1) NOT NULL,
	[ID_Product] [int] NOT NULL,
	[ID_User] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID_Category] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](100) NULL,
 CONSTRAINT [PK__Category__6DB3A68A6BA00C61] PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryPost]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryPost](
	[ID_CategoryP] [int] IDENTITY(1,1) NOT NULL,
	[CategoryP] [varchar](100) NULL,
 CONSTRAINT [PK__Category__02A5B5D80B9235B9] PRIMARY KEY CLUSTERED 
(
	[ID_CategoryP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID_Contact] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Messagee] [nvarchar](max) NULL,
	[Flag] [int] NOT NULL,
	[Reply] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
	[Updated_at] [datetime] NOT NULL,
	[Updated_by] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Contact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[ID_Favorite] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NOT NULL,
	[ID_Product] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Favorite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lastest]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lastest](
	[ID_Lastest] [int] IDENTITY(1,1) NOT NULL,
	[ID_Product] [int] NOT NULL,
	[ID_User] [int] NOT NULL,
	[Date_Create] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Lastest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_detail]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_detail](
	[ID_Order_detail] [int] IDENTITY(1,1) NOT NULL,
	[ID_Order] [int] NULL,
	[ID_Product] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Order_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID_Order] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NULL,
	[Total_money] [float] NULL,
	[payment_method] [text] NULL,
	[Shipping_fee] [float] NULL,
	[Payment_Status] [bit] NULL,
	[Order_Status] [int] NULL,
	[Date_Order] [datetime] NULL,
	[Date_Payment] [varchar](255) NULL,
 CONSTRAINT [PK__Orders__EC9FA9559C96E701] PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[ID_Post] [int] IDENTITY(1,1) NOT NULL,
	[Post_Name] [text] NULL,
	[Post_Summary] [text] NULL,
	[Content] [text] NULL,
	[Post_image] [char](50) NULL,
	[Date_post] [date] NULL,
	[ID_CategoryP] [int] NULL,
 CONSTRAINT [PK__Post__B41D0E307DFBC280] PRIMARY KEY CLUSTERED 
(
	[ID_Post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_Product] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [varchar](80) NULL,
	[Quantity] [int] NULL,
	[Product_Img] [char](100) NULL,
	[Price] [float] NULL,
	[Sort_desc] [text] NULL,
	[Characteristic] [text] NULL,
	[Meaning] [text] NULL,
	[Care_tips] [text] NULL,
	[ID_Category] [int] NOT NULL,
	[Common_Name] [text] NULL,
	[Scientific_Name] [text] NULL,
	[Plant_family] [text] NULL,
	[Origin] [text] NULL,
 CONSTRAINT [PK__Product__522DE4969D5850AB] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ID_Review] [int] IDENTITY(1,1) NOT NULL,
	[ID_User] [int] NULL,
	[ID_Product] [int] NULL,
	[Comment] [text] NULL,
	[Rating] [int] NULL,
	[Date_R] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Review] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Def]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Def](
	[ID_Role] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](255) NOT NULL,
	[ID_RoleGroup] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_group]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_group](
	[role_group_id] [int] IDENTITY(1,1) NOT NULL,
	[role_group_name] [varchar](50) NOT NULL,
	[role_description] [varchar](255) NULL,
	[ID_Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[role_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Userr]    Script Date: 5/4/2024 9:16:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Userr](
	[ID_User] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [char](30) NULL,
	[Email] [char](40) NULL,
	[Phone] [char](10) NULL,
	[User_Address] [char](40) NULL,
	[User_Password] [char](20) NULL,
	[ID_Role] [int] NULL,
	[Role_Group_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID_Cart], [ID_Product], [ID_User], [Quantity]) VALUES (26, 11, 6, 1)
INSERT [dbo].[Cart] ([ID_Cart], [ID_Product], [ID_User], [Quantity]) VALUES (27, 8, 6, 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (1, N'Tabletop plant')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (2, N'Aquatic plant')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (3, N'Stone lotus, Cactus')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (4, N'Indoor plants')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (5, N'Outdoor plants')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (6, N'Bonsai')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (7, N'Fruit tree')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (8, N'Flower')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (9, N'Accessory items')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryPost] ON 

INSERT [dbo].[CategoryPost] ([ID_CategoryP], [CategoryP]) VALUES (1, N'Knowledge of landscaping')
INSERT [dbo].[CategoryPost] ([ID_CategoryP], [CategoryP]) VALUES (2, N'Landscaping techniques')
INSERT [dbo].[CategoryPost] ([ID_CategoryP], [CategoryP]) VALUES (3, N'Landscaping care')
INSERT [dbo].[CategoryPost] ([ID_CategoryP], [CategoryP]) VALUES (4, N'Landscaping experience')
INSERT [dbo].[CategoryPost] ([ID_CategoryP], [CategoryP]) VALUES (5, N'Design concepts')
SET IDENTITY_INSERT [dbo].[CategoryPost] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID_Contact], [Fullname], [Email], [Messagee], [Flag], [Reply], [Status], [Created_at], [Updated_at], [Updated_by]) VALUES (1, N'huong', N'dinhthihuong912@gmail.com', N'adsfgh', 1, N'123', 0, CAST(N'2024-04-14T21:23:33.057' AS DateTime), CAST(N'2024-04-19T17:33:48.380' AS DateTime), 2)
INSERT [dbo].[Contact] ([ID_Contact], [Fullname], [Email], [Messagee], [Flag], [Reply], [Status], [Created_at], [Updated_at], [Updated_by]) VALUES (2, N'huonggggg', N'sdsfghj@gmail.com', N'2wdsfdgfhhj', 0, NULL, 0, CAST(N'2024-04-16T21:50:26.060' AS DateTime), CAST(N'2024-04-16T21:50:26.060' AS DateTime), 1)
INSERT [dbo].[Contact] ([ID_Contact], [Fullname], [Email], [Messagee], [Flag], [Reply], [Status], [Created_at], [Updated_at], [Updated_by]) VALUES (3, N'Huong dinhhhh', N'fgh@gmail.com', N'sdfghj', 0, NULL, 0, CAST(N'2024-04-17T14:21:32.313' AS DateTime), CAST(N'2024-04-17T14:21:32.313' AS DateTime), 1)
INSERT [dbo].[Contact] ([ID_Contact], [Fullname], [Email], [Messagee], [Flag], [Reply], [Status], [Created_at], [Updated_at], [Updated_by]) VALUES (4, N'sd', N'gh@gmail.com', N'xfcghj', 0, NULL, 0, CAST(N'2024-04-17T14:22:08.683' AS DateTime), CAST(N'2024-04-17T14:22:08.683' AS DateTime), 1)
INSERT [dbo].[Contact] ([ID_Contact], [Fullname], [Email], [Messagee], [Flag], [Reply], [Status], [Created_at], [Updated_at], [Updated_by]) VALUES (5, N'linh', N'df@sdfgh', N'ádfgghjk', 0, NULL, 1, CAST(N'2024-04-28T20:19:21.263' AS DateTime), CAST(N'2024-04-28T20:19:21.263' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (1, 1, 1)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (2, 1, 2)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (3, 1, 3)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (4, 1, 4)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (5, 1, 6)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (6, 1, 8)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (7, 6, 45)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (8, 6, 51)
INSERT [dbo].[Favorites] ([ID_Favorite], [ID_User], [ID_Product]) VALUES (9, 6, 7)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Lastest] ON 

INSERT [dbo].[Lastest] ([ID_Lastest], [ID_Product], [ID_User], [Date_Create]) VALUES (16, 2, 1, CAST(N'2024-04-27T21:15:41.750' AS DateTime))
INSERT [dbo].[Lastest] ([ID_Lastest], [ID_Product], [ID_User], [Date_Create]) VALUES (17, 4, 6, CAST(N'2024-04-27T21:34:10.833' AS DateTime))
INSERT [dbo].[Lastest] ([ID_Lastest], [ID_Product], [ID_User], [Date_Create]) VALUES (18, 1, 1, CAST(N'2024-04-27T21:36:50.187' AS DateTime))
INSERT [dbo].[Lastest] ([ID_Lastest], [ID_Product], [ID_User], [Date_Create]) VALUES (19, 6, 6, CAST(N'2024-04-28T20:04:29.717' AS DateTime))
INSERT [dbo].[Lastest] ([ID_Lastest], [ID_Product], [ID_User], [Date_Create]) VALUES (20, 8, 6, CAST(N'2024-04-28T20:18:52.373' AS DateTime))
INSERT [dbo].[Lastest] ([ID_Lastest], [ID_Product], [ID_User], [Date_Create]) VALUES (21, 10, 6, CAST(N'2024-04-28T20:18:57.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[Lastest] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (14, 1, 334, N'Cash', 334, 0, 4, CAST(N'2024-04-20T12:32:04.277' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (15, 1, 17.5, N'Cash', 17.5, 0, 1, CAST(N'2024-04-03T21:22:22.507' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (16, 1, 8, N'Cash', 8, 1, 3, CAST(N'2024-04-03T21:25:07.637' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (17, 1, 5.5, N'Cash', 5.5, 1, 3, CAST(N'2024-04-03T21:26:48.023' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (18, 1, 7, N'Cash', 7, 0, 2, CAST(N'2024-04-03T21:30:40.077' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (19, 1, 21.5, N'Cash', 21.5, 0, 1, CAST(N'2024-04-04T09:06:10.110' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (20, 1, 5, N'Cash', 5, 0, 0, CAST(N'2024-04-16T21:28:23.237' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (21, 1, 5.5, N'Cash', 5.5, 1, 3, CAST(N'2024-04-16T22:01:22.850' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (22, 1, 149, N'Cash', 149, 0, 0, CAST(N'2024-04-17T14:12:00.853' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (23, 5, 9, N'Cash', 9, 0, 1, CAST(N'2024-04-20T02:59:27.887' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (24, 1, 15, N'Cash', 15, 0, 4, CAST(N'2024-04-20T12:24:48.160' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (25, 1, 7, N'Cash', 7, 0, 0, CAST(N'2024-04-20T12:26:28.733' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (26, 1, 0, N'Cash', 0, 0, 0, CAST(N'2024-04-20T12:29:16.747' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (27, 1, 16, N'Cash', 16, 0, 1, CAST(N'2024-04-20T12:31:04.277' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (28, 1, 9, N'Cash', 9, 1, 3, CAST(N'2024-04-20T12:42:46.007' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (29, 1, 0, N'Cash', 0, 0, 4, CAST(N'2024-04-20T12:46:19.330' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (30, 1, 171, N'Cash', 171, 0, 0, CAST(N'2024-04-20T14:12:29.350' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (31, 1, 0, N'Cash', 0, 0, 4, CAST(N'2024-04-20T14:12:39.143' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (32, 6, 23.5, N'ATM banking', 23.5, 0, 2, CAST(N'2024-04-22T11:38:06.563' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (33, 6, 11, N'ATM banking', 11, 0, 0, CAST(N'2024-04-28T11:35:26.277' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (34, 6, 0, N'ATM banking', 0, 0, 0, CAST(N'2024-04-28T11:35:44.703' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (35, 6, 11, N'Cash', 11, 0, 0, CAST(N'2024-04-28T20:11:25.347' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (36, 1, 14, N'ATM banking', 14, 0, 0, CAST(N'2024-04-29T20:40:56.560' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (37, 1, 0, N'Cash', 0, 0, 0, CAST(N'2024-04-29T20:41:45.423' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (38, 1, 0, N'Cash', 0, 0, 0, CAST(N'2024-04-29T20:41:52.463' AS DateTime), NULL)
INSERT [dbo].[Orders] ([ID_Order], [ID_User], [Total_money], [payment_method], [Shipping_fee], [Payment_Status], [Order_Status], [Date_Order], [Date_Payment]) VALUES (39, 1, 15, N'Cash', 15, 0, 0, CAST(N'2024-05-04T21:11:02.340' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([ID_Post], [Post_Name], [Post_Summary], [Content], [Post_image], [Date_post], [ID_CategoryP]) VALUES (2, N'Top 11 most beautiful and easy-to-care-for office ornamental plants today', N'Employees'' memory increases by 20% and concentration increases by 15% are the great benefits that office plants bring. Do you want to know that secret? The top list of the most beautiful office plants provided below will be all you need.', NULL, N'11cayvanphong.jpg                                 ', CAST(N'2024-02-12' AS Date), 5)
INSERT [dbo].[Post] ([ID_Post], [Post_Name], [Post_Summary], [Content], [Post_image], [Date_post], [ID_CategoryP]) VALUES (3, N'Growth characteristics, feng shui meaning and how to care for Bach Hop Bambo ', N'The Bach Hop Bamboo plant is one of the favorite choices of families for indoor decoration. This is a feng shui ornamental plant with a very good meaning ', NULL, N'179-cay-truc-bach-hop-chau-su.jpg                 ', CAST(N'2024-02-13' AS Date), 3)
INSERT [dbo].[Post] ([ID_Post], [Post_Name], [Post_Summary], [Content], [Post_image], [Date_post], [ID_CategoryP]) VALUES (4, N'What effects does the Polyscias fruticosa plant have? How are tubers and leaves good for health?', N'Polyscias fruticosa is an ornamental plant that is very easy to grow and care for, so it is grown...', N'Polyscias fruticosum has the scientific name Polyscias irmicosa (L.) Harms (Panax fruticosum L), belongs to the Araliaceae family.

In folklore, there are many types of plants named Polyscias fruticosa, however the one used as medicine is small-leaf Polyscias fruticosa, also known as fish salad plant.
Polyscias fruticosa root bark and leaves contain saponins, alcoloids, vitamins B1, B2, B6, vitamin C, 20 amino acids, glycocids, alkaloids, phytosterols, tannins, organic acids, essential oils, many trace elements and 21,10 % road. In the leaves there is also triterpene saponin (1.65%), a genin that has been identified as oleanolic acid.

Polyscias fruticosa leaves, Ho Chi Minh City Ginseng and Medicinal Materials Center under the Institute of Medicinal Materials have isolated 5 compounds. In polyscias fruticosa roots, 5 compounds were also found, but only 3 compounds coincided with substances in the leaves. These three substances have strong antibacterial and anti-cancer effects.', N'dinhlang.jpg                                      ', CAST(N'2024-02-27' AS Date), 1)
INSERT [dbo].[Post] ([ID_Post], [Post_Name], [Post_Summary], [Content], [Post_image], [Date_post], [ID_CategoryP]) VALUES (5, N'
Raspberry chrysanthemums, images, meaning, planting and care.', N'Raspberry chrysanthemum is a symbolic ornamental plant for Tet. Every..', NULL, N'cuc-mam-xoi.jpg                                   ', CAST(N'2024-02-28' AS Date), 1)
INSERT [dbo].[Post] ([ID_Post], [Post_Name], [Post_Summary], [Content], [Post_image], [Date_post], [ID_CategoryP]) VALUES (6, N'Details on how to grow succulents most accurately for beginners', N'The most accurate way to grow succulents for beginners, do you know?', NULL, N'senda.jpg                                         ', CAST(N'2024-02-28' AS Date), 2)
INSERT [dbo].[Post] ([ID_Post], [Post_Name], [Post_Summary], [Content], [Post_image], [Date_post], [ID_CategoryP]) VALUES (7, N'Hydroponic plants and appropriate care', N'Hydroponic plants bring interesting meaning. Let''s learn how to choose..', NULL, N'caythuycanh.jpg                                   ', CAST(N'2024-02-29' AS Date), 4)
INSERT [dbo].[Post] ([ID_Post], [Post_Name], [Post_Summary], [Content], [Post_image], [Date_post], [ID_CategoryP]) VALUES (8, N'Choose ornamental plants suitable for the year of the Horse', N'Choosing bonsai suitable for the year of the Horse is a concern for many people. Have...', NULL, N'cayhoptuoiNgo.jpg                                 ', CAST(N'2024-03-01' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (1, N'Spider plant', 10, N'cay-co-lan-chi.jpg                                                                                  ', 8, N'In feng shui, Spider plant is classified as a lucky ornamental plant, bringing fortune to people. In real life, trees are known as "mythical vacuum cleaners"', N'The orchid plant is a fast-growing evergreen plant that grows in small bushes, 30 - 40 cm tall. Curved green leaves with thin ivory white edges. The leaves are elongated with pointed tips, smooth and shiny. The length of the leaves is from 10 - 40 cm and up to 1.5 cm wide. The orchid plant has small, star-shaped flowers', N'- Spider plant is classified as a lucky ornamental plant, perseverance brings fortune to people
- With beautiful colors, the tree is often used to plant carpets, borders or bushes to decorate gardens, parks, schools, cafes...
- The plant is also grown in pots for tables, grown in water to decorate homes and offices.
- The orchid plant can absorb 95% of carbon dioxide, "consuming" all toxic gases such as CO, NO3 emitted by coal furnaces, electrical equipment, and plastic products. Especially absorbs benzene gas - a carcinogen and absorbs toxic nicotine in cigarette smoke.', N'- Light: Lan Chi Grass belongs to the group of plants that like light or can tolerate partial shade. Natural light can be used, but the plant will burn if grown in direct sunlight.
- Soil: Make sure the soil has good drainage.
- Water: You can use distilled water or rain water, avoid using alum water. Need to water regularly, just enough to avoid leaving the soil wet.
- Temperature: Orchid grass grows perfectly well at an average temperature of about 18 - 24 ° C, suitable for the tropical climate in our country.', 1, N'Spider plant', N'Chlorophytum bichetii', N'Asphodelaceae ', N'Tropical Africa')
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (2, N'Ficus elastica', 45, N'cay-da-bup-do.jpg                                                                                   ', 7, NULL, NULL, NULL, NULL, 1, N'', N'', N'', N'')
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (3, N'China doll', NULL, N'cay-hanh-phuc.jpg                                                                                   ', 9, N'The happy tree is a very popular interior tree today. It is also used for interior and exterior decoration but brings many good feng shui values. Furthermore, this tree also brings diversity in designs and choices for customers.', N'Regarding morphological characteristics, the happiness tree belongs to the woody plant family. When mature, the tree can be 1-3m tall if grown in a natural environment and only 1.4-1.6m if grown indoors. The leaves grow luxuriantly, are green when young and gradually darken as they mature. The special thing is that each branch will produce clusters of 3 leaves forming a very beautiful heart shape.', N'The characteristic green color of the happiness tree represents faith and hope in life. For those who are having difficulties in life, this plant will convey to them a source of positive energy, helping them firmly believe in a better future than is coming.', NULL, 1, N'Happy tree', N'Serpent tree', N'Dinh family', N'Nationwide')
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (4, N'Aroid Palm', NULL, N'cay-kim-tien.jpg                                                                                    ', 5.5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (5, N'Aglaonema Butterfly', NULL, N'cay-van-loc-3.jpg                                                                                   ', 3, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (6, N'Dracaena Surculosa', NULL, N'cay-truc-phu-quy-de-ban.jpg                                                                         ', 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (7, N'The Fiddle Leaf Fig', NULL, N'cay-bang-singapore-thuy-sinh.jpg                                                                    ', 11, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (8, N'Areca catechu', NULL, N'cay-cau-tieu-tram-thuy-sinh.jpg                                                                     ', 5, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (9, N'Money tree', NULL, N'kim-ngan-tim.jpg                                                                                    ', 15, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (10, N'Aglaonema Butterfly', NULL, N'cay-van-loc.jpg                                                                                     ', 13, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (11, N'Aloe vera plant', NULL, N'cay-nha-dam-thuy-sinh.jpg                                                                           ', 7, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (12, N'Dracaena fragrans', NULL, N'cay-phat-tai-bup-sen-thuy-sinh-1.jpg                                                                ', 6, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (13, N'Calathea medallion ', NULL, N'cay-duoi-cong-hong.jpg                                                                              ', 2, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (14, N'Greenovia Dodrentalis', NULL, N'cay-sen-da-bong-hong-xanh.jpg                                                                       ', 9.5, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (15, N'Haworthia cooperi var', NULL, N'cay-sen-da-kim-cuong.jpg                                                                            ', 8, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (16, N'Jelly bean', NULL, N'cay-sen-da-thach-ngoc-xanh-nho.jpg                                                                  ', 3, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (17, N'Succulent', NULL, N'cay-sen-da-thuoc-duoc.jpg                                                                           ', 22, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (18, N'Peruvian Apple Cactus', NULL, N'cay-xuong-rong-thanh-son.jpg                                                                        ', 21, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (19, N'Catus', NULL, N'cay-xuong-rong-trang-nguyen-bui.jpg                                                                 ', 20, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (20, N'Green catus ', NULL, N'cay-xuong-rong-xanh.jpg                                                                             ', 18, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (21, N'Dragon catus', NULL, N'XR-thanh-long.jpg                                                                                   ', 17, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (22, N'Chinese Evergreen', NULL, N'cay-bach-ma-hoang-tu.jpg                                                                            ', 16, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (23, N'Aglaoocma sp', NULL, N'cay-dai-phu-gia.jpg                                                                                 ', 15, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (24, N'Aroid Palm', NULL, N'cay-kim-tien-noi-that.jpg                                                                           ', 12, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (25, N'Golden Pothos', NULL, N'cay-trau-ba-leo-cot.jpg                                                                             ', 11, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (26, N'Ardisia crenata', NULL, N'kim-ngan-luong-noi-that.jpg                                                                         ', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (27, N'Dracaena reflexa.', NULL, N'truc-bach-hop.jpg                                                                                   ', 8, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (28, N'Dumb-cane', NULL, N'van-nien-thanh.jpg                                                                                  ', 7, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (29, N'The Fiddle Leaf Fig', NULL, N'bang-singapore-ngoaitroi.jpg                                                                        ', 6, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (30, N'Bougainvillea tree', NULL, N'bong-giay.jpg                                                                                       ', 5, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (31, N'Golden cane palm', NULL, N'cau-vang.jpg                                                                                        ', 30, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (32, N'Dwarf Date Palm', NULL, N'cay-cau-nga-mi.jpg                                                                                  ', 25, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (33, N'Agave Americana.', NULL, N'cay-dua-nam-my.jpg                                                                                  ', 20, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (34, N'Flamboyant', NULL, N'phuong-vi.jpg                                                                                       ', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (35, N'Lady palm', NULL, N'cay-mat-cat.jpg                                                                                     ', 3, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (36, N'Norfolk island pine bonsai', NULL, N'bonsai-cay-tung.jpg                                                                                 ', 65, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (37, N'Hai Chau Bonsai', NULL, N'bonsai-hai-chau.jpg                                                                                 ', 70, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (38, N'Linh Sam Bonsai', NULL, N'bonsai-linh-sam.jpg                                                                                 ', 80, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (39, N'Trac Day bonsai', NULL, N'bonsai-trac-day.jpg                                                                                 ', 99, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (40, N'DaBonsai', NULL, N'cay-da-bonsai.jpg                                                                                   ', 100, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (41, N'Ngu gia bi Bonsai', NULL, N'cay-ngu-gia-bi-bonsai-de-ban.jpg                                                                    ', 80, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (42, N'Otaheite apple', NULL, N'cay-coc.jpg                                                                                         ', 4, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (43, N'Starfruit tree', NULL, N'cay-khe.jpg                                                                                         ', 3, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (44, N'Periwinkle', NULL, N'cay-hoa-dua-can.jpg                                                                                 ', 5, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (45, N'Blue Jade Vine', NULL, N'cay-mong-cop.jpg                                                                                    ', 2.5, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (46, N'Sky flower', NULL, N'day-cat-dang.jpg                                                                                    ', 10, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (47, N'Gerbera', NULL, N'hoa-dong-tien.jpg                                                                                   ', 12, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (48, N'Rose', NULL, N'hoa-hong-leo.jpg                                                                                    ', 12, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (49, N'Lotus', NULL, N'sen-mini.jpg                                                                                        ', 13, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (50, N'Combretum indicum', NULL, N'cay-su-quan-tu.jpg                                                                                  ', 14, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (51, N'Round composite pots', NULL, N'chau-composite-bau-tron-cp001-2.jpg                                                                 ', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (52, N'Striped composite pots', NULL, N'chau-composite-hinh-trung-van-song-dung-cp004.jpg                                                   ', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (53, N'Terracotta pots 5*5', NULL, N'chau-dat-nung-5x5.jpg                                                                               ', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (54, N'Garden shovel', NULL, N'xeng-lam-vuon.jpg                                                                                   ', NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (55, N'Gravel', 1, N'soi-mau-trang-tri-500gr.jpg                                                                         ', 1000, N'123', NULL, NULL, NULL, 9, NULL, NULL, NULL, N'123')
INSERT [dbo].[Product] ([ID_Product], [Product_Name], [Quantity], [Product_Img], [Price], [Sort_desc], [Characteristic], [Meaning], [Care_tips], [ID_Category], [Common_Name], [Scientific_Name], [Plant_family], [Origin]) VALUES (56, N'Tesst', 2, N'20240421161429239.jpg                                                                               ', 10, N'fgthy', NULL, NULL, NULL, 9, N'Tesst', NULL, NULL, N'frtyu')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role_Def] ON 

INSERT [dbo].[Role_Def] ([ID_Role], [Role_Name], [ID_RoleGroup]) VALUES (2, N'AddProduct', 1)
SET IDENTITY_INSERT [dbo].[Role_Def] OFF
GO
SET IDENTITY_INSERT [dbo].[role_group] ON 

INSERT [dbo].[role_group] ([role_group_id], [role_group_name], [role_description], [ID_Role]) VALUES (1, N'Admin', N'Quy?n admin', NULL)
INSERT [dbo].[role_group] ([role_group_id], [role_group_name], [role_description], [ID_Role]) VALUES (2, N'User', N'Quy?n ngu?i dùng', NULL)
SET IDENTITY_INSERT [dbo].[role_group] OFF
GO
SET IDENTITY_INSERT [dbo].[Userr] ON 

INSERT [dbo].[Userr] ([ID_User], [UserName], [Email], [Phone], [User_Address], [User_Password], [ID_Role], [Role_Group_Id]) VALUES (1, N'Huong                         ', N'dinhthihuong912@gmail.com               ', N'0962601281', N'12345                                   ', N'12345               ', NULL, 2)
INSERT [dbo].[Userr] ([ID_User], [UserName], [Email], [Phone], [User_Address], [User_Password], [ID_Role], [Role_Group_Id]) VALUES (2, N'Admin                         ', N'Admin@gmail.com                         ', N'0962601281', N'12 Hoang Hoa Tham, Ha Noi               ', N'12345               ', NULL, 1)
INSERT [dbo].[Userr] ([ID_User], [UserName], [Email], [Phone], [User_Address], [User_Password], [ID_Role], [Role_Group_Id]) VALUES (5, N'test                          ', N'Huong@gmail.com                         ', N'1223456   ', N'23fgh                                   ', N'123                 ', NULL, 2)
INSERT [dbo].[Userr] ([ID_User], [UserName], [Email], [Phone], [User_Address], [User_Password], [ID_Role], [Role_Group_Id]) VALUES (6, N'Linh                          ', N'Linh@gmail.com                          ', N'12345678  ', N'Lào Cai                                 ', N'12345               ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Userr] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_C_P] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Product] ([ID_Product])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_C_P]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_C_U] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Userr] ([ID_User])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_C_U]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Product] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Product] ([ID_Product])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Product]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Userr] ([ID_User])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[Lastest]  WITH CHECK ADD  CONSTRAINT [FK_L_P] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Product] ([ID_Product])
GO
ALTER TABLE [dbo].[Lastest] CHECK CONSTRAINT [FK_L_P]
GO
ALTER TABLE [dbo].[Lastest]  WITH CHECK ADD  CONSTRAINT [FK_L_U] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Userr] ([ID_User])
GO
ALTER TABLE [dbo].[Lastest] CHECK CONSTRAINT [FK_L_U]
GO
ALTER TABLE [dbo].[Order_detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Orderdetail] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Orders] ([ID_Order])
GO
ALTER TABLE [dbo].[Order_detail] CHECK CONSTRAINT [FK_Order_Orderdetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Userr] ([ID_User])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Category_P] FOREIGN KEY([ID_CategoryP])
REFERENCES [dbo].[CategoryPost] ([ID_CategoryP])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Category_P]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ID_Category])
REFERENCES [dbo].[Category] ([ID_Category])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Product_Review] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Product] ([ID_Product])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Product_Review]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_User_Review] FOREIGN KEY([ID_User])
REFERENCES [dbo].[Userr] ([ID_User])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_User_Review]
GO
ALTER TABLE [dbo].[Role_Def]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroup] FOREIGN KEY([ID_RoleGroup])
REFERENCES [dbo].[role_group] ([role_group_id])
GO
ALTER TABLE [dbo].[Role_Def] CHECK CONSTRAINT [FK_RoleGroup]
GO
ALTER TABLE [dbo].[role_group]  WITH CHECK ADD  CONSTRAINT [fk_role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[role_group] CHECK CONSTRAINT [fk_role]
GO
ALTER TABLE [dbo].[Userr]  WITH CHECK ADD  CONSTRAINT [FK_R_U] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Userr] CHECK CONSTRAINT [FK_R_U]
GO
USE [master]
GO
ALTER DATABASE [QLBanCayCanh] SET  READ_WRITE 
GO
