USE [master]
GO
/****** Object:  Database [J3LP0005_HanaShop]    Script Date: 3/2/2020 10:59:05 PM ******/
CREATE DATABASE [J3LP0005_HanaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3LP0005_HanaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\J3LP0005_HanaShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J3LP0005_HanaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\J3LP0005_HanaShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [J3LP0005_HanaShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3LP0005_HanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3LP0005_HanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3LP0005_HanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J3LP0005_HanaShop] SET QUERY_STORE = OFF
GO
USE [J3LP0005_HanaShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/2/2020 10:59:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[RoleID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountStatus]    Script Date: 3/2/2020 10:59:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/2/2020 10:59:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodAndDrinks]    Script Date: 3/2/2020 10:59:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodAndDrinks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FoodAndDrinks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodStatus]    Script Date: 3/2/2020 10:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_FoodStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 3/2/2020 10:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FoodAndDrinkID] [int] NOT NULL,
	[FoodAndDrinkQuantity] [int] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[InvoiceID] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 3/2/2020 10:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfPurchase] [datetime] NOT NULL,
	[BuyerEmail] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/2/2020 10:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdateFoodHistory]    Script Date: 3/2/2020 10:59:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateFoodHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdatingEmail] [nvarchar](100) NOT NULL,
	[UpdateTypeID] [int] NOT NULL,
	[FoodID] [int] NOT NULL,
 CONSTRAINT [PK_UpdateFoodHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UpdateType]    Script Date: 3/2/2020 10:59:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UpdateType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Email], [Password], [Name], [RoleID], [StatusID]) VALUES (N'admin@gmail.com', N'123', N'Admin', 1, 2)
INSERT [dbo].[Accounts] ([Email], [Password], [Name], [RoleID], [StatusID]) VALUES (N'h3luvj@gmail.com', N'123', N'Thắng Hoàng', 2, 2)
INSERT [dbo].[Accounts] ([Email], [Password], [Name], [RoleID], [StatusID]) VALUES (N'thanghoang.bmt@gmail.com', N'******', N'Thắng Hoàng', 2, 2)
SET IDENTITY_INSERT [dbo].[AccountStatus] ON 

INSERT [dbo].[AccountStatus] ([ID], [Description]) VALUES (1, N'New')
INSERT [dbo].[AccountStatus] ([ID], [Description]) VALUES (2, N'Actived')
INSERT [dbo].[AccountStatus] ([ID], [Description]) VALUES (3, N'Deleted')
SET IDENTITY_INSERT [dbo].[AccountStatus] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Description]) VALUES (1, N'Food')
INSERT [dbo].[Categories] ([ID], [Description]) VALUES (2, N'Drink')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[FoodAndDrinks] ON 

INSERT [dbo].[FoodAndDrinks] ([ID], [Name], [Description], [Price], [Quantity], [CreateDate], [CategoryID], [StatusID], [Image]) VALUES (4, N'Sushi', N'Homemade Sushi is so much cheaper than at the restaurant. Sushi is easy and fun to make at home, and you can put all your favorite ingredients into your perfect custom roll — here’s how!', 100, 499, CAST(N'2020-02-25T20:10:50.000' AS DateTime), 1, 1, N'img/bg-img/insta1.jpg')
INSERT [dbo].[FoodAndDrinks] ([ID], [Name], [Description], [Price], [Quantity], [CreateDate], [CategoryID], [StatusID], [Image]) VALUES (5, N'Coca Cola', N'Great drink!', 2, 992, CAST(N'2020-02-25T22:15:00.000' AS DateTime), 2, 1, N'img/bg-img/CocaCola.png')
INSERT [dbo].[FoodAndDrinks] ([ID], [Name], [Description], [Price], [Quantity], [CreateDate], [CategoryID], [StatusID], [Image]) VALUES (6, N'Hambuger', N'From America', 5, 198, CAST(N'2020-02-26T21:54:59.913' AS DateTime), 1, 1, N'img/Food_02.jpg')
INSERT [dbo].[FoodAndDrinks] ([ID], [Name], [Description], [Price], [Quantity], [CreateDate], [CategoryID], [StatusID], [Image]) VALUES (7, N'Rice', N'From VietNam', 2, 46, CAST(N'2020-02-26T22:02:09.520' AS DateTime), 1, 1, N'img/Food_01.jpg')
INSERT [dbo].[FoodAndDrinks] ([ID], [Name], [Description], [Price], [Quantity], [CreateDate], [CategoryID], [StatusID], [Image]) VALUES (8, N'Pizza', N'Pizza Italy', 15, 200, CAST(N'2020-02-26T22:08:24.690' AS DateTime), 1, 2, N'img/Food_03.png')
INSERT [dbo].[FoodAndDrinks] ([ID], [Name], [Description], [Price], [Quantity], [CreateDate], [CategoryID], [StatusID], [Image]) VALUES (9, N'Pasta', N'From Italy', 19, 14, CAST(N'2020-02-26T22:18:35.337' AS DateTime), 1, 1, N'img/Food_05.jpg')
INSERT [dbo].[FoodAndDrinks] ([ID], [Name], [Description], [Price], [Quantity], [CreateDate], [CategoryID], [StatusID], [Image]) VALUES (12, N'Pepsi', N'PepsiCo', 10, 99, CAST(N'2020-03-02T21:46:47.460' AS DateTime), 2, 1, N'img/Food_06.jpg')
SET IDENTITY_INSERT [dbo].[FoodAndDrinks] OFF
SET IDENTITY_INSERT [dbo].[FoodStatus] ON 

INSERT [dbo].[FoodStatus] ([ID], [Description]) VALUES (1, N'Actived')
INSERT [dbo].[FoodStatus] ([ID], [Description]) VALUES (2, N'Deleted')
SET IDENTITY_INSERT [dbo].[FoodStatus] OFF
SET IDENTITY_INSERT [dbo].[InvoiceDetails] ON 

INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (1, 6, 1, 5, 1)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (2, 7, 1, 2, 2)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (3, 7, 1, 2, 3)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (4, 7, 1, 2, 4)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (5, 6, 1, 5, 5)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (6, 5, 1, 2, 6)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (7, 5, 1, 2, 7)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (8, 5, 1, 2, 8)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (9, 5, 1, 2, 9)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (10, 5, 1, 2, 10)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (11, 5, 1, 2, 11)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (12, 5, 1, 2, 12)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (13, 4, 1, 100, 13)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (14, 9, 2, 38, 13)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (15, 9, 1, 19, 14)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (16, 5, 1, 2, 15)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (17, 7, 1, 2, 16)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (18, 9, 1, 19, 16)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (19, 9, 1, 19, 17)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (20, 9, 1, 19, 18)
INSERT [dbo].[InvoiceDetails] ([ID], [FoodAndDrinkID], [FoodAndDrinkQuantity], [TotalPrice], [InvoiceID]) VALUES (21, 12, 1, 10, 18)
SET IDENTITY_INSERT [dbo].[InvoiceDetails] OFF
SET IDENTITY_INSERT [dbo].[Invoices] ON 

INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (1, CAST(N'2020-03-01T15:03:01.690' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (2, CAST(N'2020-03-02T15:05:00.293' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (3, CAST(N'2020-03-02T15:06:33.170' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (4, CAST(N'2020-03-02T15:07:43.200' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (5, CAST(N'2020-03-02T15:09:01.170' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (6, CAST(N'2020-03-02T15:10:09.477' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (7, CAST(N'2020-03-02T15:12:09.850' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (8, CAST(N'2020-03-02T15:12:46.030' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (9, CAST(N'2020-03-02T15:13:22.840' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (10, CAST(N'2020-03-02T15:14:05.977' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (11, CAST(N'2020-03-02T15:14:44.730' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (12, CAST(N'2020-03-02T15:16:01.980' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (13, CAST(N'2020-03-02T15:16:58.550' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (14, CAST(N'2020-03-02T15:19:08.103' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (15, CAST(N'2020-03-02T15:22:41.430' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (16, CAST(N'2020-03-02T15:26:04.517' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (17, CAST(N'2020-03-02T15:27:24.057' AS DateTime), N'h3luvj@gmail.com')
INSERT [dbo].[Invoices] ([ID], [DateOfPurchase], [BuyerEmail]) VALUES (18, CAST(N'2020-03-02T22:34:37.343' AS DateTime), N'thanghoang.bmt@gmail.com')
SET IDENTITY_INSERT [dbo].[Invoices] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Description]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([ID], [Description]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UpdateFoodHistory] ON 

INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (1, CAST(N'2020-02-27T12:33:09.440' AS DateTime), N'admin@gmail.com', 1, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (2, CAST(N'2020-02-27T12:33:44.757' AS DateTime), N'admin@gmail.com', 2, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (3, CAST(N'2020-02-27T12:34:06.757' AS DateTime), N'admin@gmail.com', 1, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (4, CAST(N'2020-02-27T12:36:33.047' AS DateTime), N'admin@gmail.com', 2, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (5, CAST(N'2020-02-27T12:36:55.430' AS DateTime), N'admin@gmail.com', 1, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (6, CAST(N'2020-02-27T12:37:12.793' AS DateTime), N'admin@gmail.com', 2, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (7, CAST(N'2020-02-27T12:37:20.367' AS DateTime), N'admin@gmail.com', 1, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (8, CAST(N'2020-02-27T12:38:14.520' AS DateTime), N'admin@gmail.com', 2, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (9, CAST(N'2020-02-27T12:38:33.293' AS DateTime), N'admin@gmail.com', 3, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (10, CAST(N'2020-02-27T12:48:41.277' AS DateTime), N'admin@gmail.com', 1, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (11, CAST(N'2020-02-28T09:55:28.293' AS DateTime), N'admin@gmail.com', 2, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (12, CAST(N'2020-02-28T09:58:53.493' AS DateTime), N'admin@gmail.com', 3, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (13, CAST(N'2020-02-28T09:59:00.157' AS DateTime), N'admin@gmail.com', 2, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (14, CAST(N'2020-02-28T10:00:40.133' AS DateTime), N'admin@gmail.com', 2, 8)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (15, CAST(N'2020-02-28T10:03:32.073' AS DateTime), N'admin@gmail.com', 3, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (16, CAST(N'2020-02-28T10:34:30.083' AS DateTime), N'admin@gmail.com', 1, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (17, CAST(N'2020-02-28T10:34:46.547' AS DateTime), N'admin@gmail.com', 2, 9)
INSERT [dbo].[UpdateFoodHistory] ([ID], [UpdateDate], [UpdatingEmail], [UpdateTypeID], [FoodID]) VALUES (18, CAST(N'2020-03-02T22:33:43.167' AS DateTime), N'admin@gmail.com', 1, 12)
SET IDENTITY_INSERT [dbo].[UpdateFoodHistory] OFF
SET IDENTITY_INSERT [dbo].[UpdateType] ON 

INSERT [dbo].[UpdateType] ([ID], [Description]) VALUES (1, N'Updated')
INSERT [dbo].[UpdateType] ([ID], [Description]) VALUES (2, N'Deleted')
INSERT [dbo].[UpdateType] ([ID], [Description]) VALUES (3, N'ReActived')
SET IDENTITY_INSERT [dbo].[UpdateType] OFF
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[AccountStatus] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Status]
GO
ALTER TABLE [dbo].[FoodAndDrinks]  WITH CHECK ADD  CONSTRAINT [FK_FoodAndDrinks_Categorys] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[FoodAndDrinks] CHECK CONSTRAINT [FK_FoodAndDrinks_Categorys]
GO
ALTER TABLE [dbo].[FoodAndDrinks]  WITH CHECK ADD  CONSTRAINT [FK_FoodAndDrinks_FoodStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[FoodStatus] ([ID])
GO
ALTER TABLE [dbo].[FoodAndDrinks] CHECK CONSTRAINT [FK_FoodAndDrinks_FoodStatus]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_FoodAndDrinks] FOREIGN KEY([FoodAndDrinkID])
REFERENCES [dbo].[FoodAndDrinks] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_FoodAndDrinks]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([ID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoices]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Accounts] FOREIGN KEY([BuyerEmail])
REFERENCES [dbo].[Accounts] ([Email])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Accounts]
GO
ALTER TABLE [dbo].[UpdateFoodHistory]  WITH CHECK ADD  CONSTRAINT [FK_UpdateFoodHistory_Accounts] FOREIGN KEY([UpdatingEmail])
REFERENCES [dbo].[Accounts] ([Email])
GO
ALTER TABLE [dbo].[UpdateFoodHistory] CHECK CONSTRAINT [FK_UpdateFoodHistory_Accounts]
GO
ALTER TABLE [dbo].[UpdateFoodHistory]  WITH CHECK ADD  CONSTRAINT [FK_UpdateFoodHistory_FoodAndDrinks] FOREIGN KEY([FoodID])
REFERENCES [dbo].[FoodAndDrinks] ([ID])
GO
ALTER TABLE [dbo].[UpdateFoodHistory] CHECK CONSTRAINT [FK_UpdateFoodHistory_FoodAndDrinks]
GO
ALTER TABLE [dbo].[UpdateFoodHistory]  WITH CHECK ADD  CONSTRAINT [FK_UpdateFoodHistory_UpdateType] FOREIGN KEY([UpdateTypeID])
REFERENCES [dbo].[UpdateType] ([ID])
GO
ALTER TABLE [dbo].[UpdateFoodHistory] CHECK CONSTRAINT [FK_UpdateFoodHistory_UpdateType]
GO
USE [master]
GO
ALTER DATABASE [J3LP0005_HanaShop] SET  READ_WRITE 
GO
