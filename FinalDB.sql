USE [master]
GO
/****** Object:  Database [Bookstore]    Script Date: 1/11/2021 1:28:46 AM ******/
CREATE DATABASE [Bookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bookstore', FILENAME = N'D:\Programes\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bookstore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bookstore_log', FILENAME = N'D:\Programes\SQL Server 2019\MSSQL15.SQLEXPRESS\MSSQL\DATA\Bookstore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Bookstore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Bookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bookstore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bookstore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bookstore] SET  MULTI_USER 
GO
ALTER DATABASE [Bookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bookstore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bookstore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Bookstore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Bookstore] SET QUERY_STORE = OFF
GO
USE [Bookstore]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Author_ID] [int] NOT NULL,
	[Fname] [varchar](15) NULL,
	[LastName] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[Author_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Book_ID] [int] NOT NULL,
	[BookName] [varchar](50) NULL,
	[Book_Language] [varchar](15) NULL,
	[Genre] [varchar](15) NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[Book_Description] [varchar](150) NULL,
	[Rating] [int] NULL,
	[Author_ID] [int] NULL,
	[Publisher_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[Branch_ID] [int] NOT NULL,
	[Branch_Location] [varchar](30) NULL,
	[Manager_ID] [int] NULL,
	[BranchName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerRating]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerRating](
	[CustomerID] [int] NOT NULL,
	[Book_ID] [int] NOT NULL,
	[Rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [int] NOT NULL,
	[Fname] [varchar](15) NULL,
	[MidName] [varchar](15) NULL,
	[LastName] [varchar](15) NULL,
	[Customer_Address] [varchar](30) NULL,
	[Gender] [char](1) NULL,
	[Customer_Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Emp_ID] [int] NOT NULL,
	[Fname] [varchar](15) NULL,
	[MidName] [varchar](15) NULL,
	[LastName] [varchar](15) NULL,
	[Emp_Address] [varchar](30) NULL,
	[Gender] [char](1) NULL,
	[Salary] [int] NULL,
	[Branch_ID] [int] NULL,
	[Manager_ID] [int] NULL,
	[Emp_Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_Info]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Info](
	[Email] [varchar](50) NOT NULL,
	[PassW] [varchar](25) NOT NULL,
	[UserType] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Publisher_ID] [int] NOT NULL,
	[Publisher_Email] [varchar](50) NULL,
	[PublisherName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Publisher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requests_History]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests_History](
	[Request_ID] [int] NOT NULL,
	[Publisher_ID] [int] NULL,
	[Book_Description] [varchar](50) NULL,
	[Book_Genre] [varchar](50) NULL,
	[Book_language] [varchar](50) NULL,
	[Book_Name] [varchar](50) NULL,
	[Book_Price] [int] NULL,
	[RequestStatues] [varchar](30) NULL,
	[Author_Name] [varchar](30) NULL,
	[Author_LName] [varchar](30) NULL,
	[RequestDate] [date] NULL,
 CONSTRAINT [PK__Requests__E9C5B2932F9424A5] PRIMARY KEY CLUSTERED 
(
	[Request_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_History]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_History](
	[Sales_ID] [int] NOT NULL,
	[SalePrice] [int] NULL,
	[Branch_ID] [int] NULL,
	[Emp_ID] [int] NULL,
	[Customer_ID] [int] NULL,
	[SaleDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sales_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoldBooks]    Script Date: 1/11/2021 1:28:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoldBooks](
	[Sales_ID] [int] NOT NULL,
	[Book_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Sales_ID] ASC,
	[Book_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Authors] ([Author_ID], [Fname], [LastName]) VALUES (1, N'Zakary Willms', N'Kerluke')
INSERT [dbo].[Authors] ([Author_ID], [Fname], [LastName]) VALUES (2, N'Delpha Blanda', N'Schroeder')
INSERT [dbo].[Authors] ([Author_ID], [Fname], [LastName]) VALUES (3, N'Dr. Margarette ', N'Lueilwitz')
INSERT [dbo].[Authors] ([Author_ID], [Fname], [LastName]) VALUES (4, N'Ms. Palma Stros', N'Schaefer')
INSERT [dbo].[Authors] ([Author_ID], [Fname], [LastName]) VALUES (5, N'Caleigh Rath', N'Daniel')
GO
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (1, N'Lord of the rings', N'English', N'Action', 100, 8, N'Best Book ever', 5, 1, 1)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (2, N'Great Gastby', N'French ', N'Romantic', 110, 10, N'Book of wonders', 5, 1, 2)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (3, N' Animal Farm ', N'Arabic', N'Drama', 150, 15, N' attractive for teenagers', 4, 2, 3)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (4, N'Lolita', N'German', N'Horror', 150, 16, N' Book ofadventures ', 4, 3, 3)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (5, N'Watchmen', N'English', N'Science Fiction', 150, 13, N'Best Book for science attached people', 3, 3, 5)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (6, N'Atlas Shrugged', N'English', N'Drama', 225, 4, N'Whatever', 4, 4, 6)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (7, N'The Metamorphosis', N'German', N'Horror', 100, 3, N'Whatever', 5, 4, 7)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (8, N'Angels and Demons', N'English', N'Mystery', 150, 4, N'Whatever', 5, 4, 8)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (9, N'The Origin', N'English', N'Mystery', 150, 4, N'Whatever', 3, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (10, N'The Notebook', N'English', N'Romance', 90, 4, N'Best romance book/movie ever', 2, 5, 10)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (11, N'Idiot Brain', N'English', N'Science', 150, 4, N'Whatever', 0, 5, 6)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (12, N'HarryPotter & The Chamber of Secrets', N'English', N'Science Fiction', 150, 4, N'Whatever', 3, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (13, N'HarryPotter & The Sorcerers Stone', N'English', N'Science Fiction', 150, 4, N'Whatever', 2, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (14, N'HarryPotter & The Prisoner of Azkaban', N'English', N'Science Fiction', 150, 4, N'Whatever', 0, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (15, N'HarryPotter & The Order Of The Phoenix', N'English', N'Science Fiction', 150, 4, N'Whatever', 3, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (16, N'HarryPotter & The Half Blood Prince', N'English', N'Science Fiction', 150, 4, N'Whatever', 2, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (17, N'HarryPotter & The Deathly Hallows', N'English', N'Science Fiction', 150, 4, N'Whatever', 0, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (18, N'HarryPotter & The Goblet Of Fire', N'English', N'Science Fiction', 150, 4, N'Whatever', 0, 5, 9)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (19, N'Beloved', N'English ', N'Action', 110, 13, N'Book of modern English history', 3, 1, 4)
INSERT [dbo].[Books] ([Book_ID], [BookName], [Book_Language], [Genre], [Price], [Quantity], [Book_Description], [Rating], [Author_ID], [Publisher_ID]) VALUES (20, N'On the Road', N'Arabic', N'Action', 150, 14, N' attractive for all children', 1, 2, 1)
GO
INSERT [dbo].[Branches] ([Branch_ID], [Branch_Location], [Manager_ID], [BranchName]) VALUES (0, N'null', NULL, N'Online')
INSERT [dbo].[Branches] ([Branch_ID], [Branch_Location], [Manager_ID], [BranchName]) VALUES (1, N'Wisconsin', 7, N'Port')
INSERT [dbo].[Branches] ([Branch_ID], [Branch_Location], [Manager_ID], [BranchName]) VALUES (2, N'Pennsylvania', 2, N'Lake')
INSERT [dbo].[Branches] ([Branch_ID], [Branch_Location], [Manager_ID], [BranchName]) VALUES (3, N'California', 10, N'North')
INSERT [dbo].[Branches] ([Branch_ID], [Branch_Location], [Manager_ID], [BranchName]) VALUES (4, N'Iowa', 8, N'South')
GO
INSERT [dbo].[CustomerRating] ([CustomerID], [Book_ID], [Rating]) VALUES (1, 1, 4)
INSERT [dbo].[CustomerRating] ([CustomerID], [Book_ID], [Rating]) VALUES (1, 2, 2)
INSERT [dbo].[CustomerRating] ([CustomerID], [Book_ID], [Rating]) VALUES (1, 3, 5)
INSERT [dbo].[CustomerRating] ([CustomerID], [Book_ID], [Rating]) VALUES (2, 1, 4)
INSERT [dbo].[CustomerRating] ([CustomerID], [Book_ID], [Rating]) VALUES (2, 2, 3)
INSERT [dbo].[CustomerRating] ([CustomerID], [Book_ID], [Rating]) VALUES (2, 3, 1)
GO
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (1, N'Stephen', N'Mackenzie Beaha', N'Kuphal', N'4338 Arielle Expressway Apt. 9', N'M', N'aida26@example.org')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (2, N'Piper', N'Declan Wehner J', N'Macejkovic', N'14215 Windler Lakes', N'F', N'dannie15@example.net')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (3, N'River', N'Prof. Carson Pf', N'Mraz', N'01494 Waelchi Extensions Apt. ', N'F', N'demario45@example.net')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (4, N'Estrella', N'Clifford Will', N'Kihn', N'80621 Walker Fords Suite 273', N'M', N'ghayes@example.com')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (5, N'Jose', N'Ms. Lurline Ker', N'Reichel', N'31322 Lockman Forge', N'F', N'grayson.hickle@example.com')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (6, N'Humberto', N'Prof. Edwin Glo', N'Feest', N'0997 Carissa Green Suite 892', N'M', N'lloyd80@example.org')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (7, N'Cody', N'Jamison Bauch', N'Bernier', N'16990 Kathleen Spring Suite 20', N'M', N'qullrich@example.net')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (8, N'Katelin', N'Emma Dooley', N'Flatley', N'8698 Willms Fields', N'F', N'rcronin@example.org')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (9, N'Doug', N'Nakia Beer', N'Kshlerin', N'9375 Batz Light Apt. 836', N'M', N'reinger.claire@example.org')
INSERT [dbo].[Customers] ([Customer_ID], [Fname], [MidName], [LastName], [Customer_Address], [Gender], [Customer_Email]) VALUES (10, N'Beatrice', N'Charlie William', N'Walker', N'044 Pouros Ports Apt. 535', N'F', N'ugoodwin@example.com')
GO
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (1, N'Howard Zieme', N'Omar', N'Volkman', N'728 Roob Parkway Suite 383', N'F', 19236, 3, 10, N'schulist.phoebe@example.net')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (2, N'Nettie Roob II', N'Omar', N'Flatley', N'691 Madonna Park', N'F', 2901, 2, NULL, N'desiree.hansen@example.com')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (3, N'Esther Fritsch ', N'Omar', N'Gusikowski', N'945 Miller Causeway', N'M', 5954, 1, 7, N'dovie.littel@example.com')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (4, N'Shanna Waters', N'Omar', N'Gaylord', N'19088 Auer Green Suite 498', N'F', 21163, 2, 2, N'elisabeth.dicki@example.com')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (7, N'Ms. Mazie Kohle', N'Omar', N'Reilly', N'1368 Shields View', N'F', 22049, 1, NULL, N'betsy.stiedemann@example.com')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (8, N'Torrance Herzog', N'Omar', N'Weimann', N'538 Dooley Pike Suite 535', N'M', 10958, 4, NULL, N'sklein@example.org')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (10, N'Gabrielle Bins ', N'Omar', N'Waelchi', N'59431 Amina Manor Apt. 621', N'F', 1893, 3, NULL, N'lura.wolf@example.org')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (12, N'Marco Lehner', N'Omar', N'Botsford', N'4613 Jonatan Manors', N'M', 5088, 4, 8, N'terry.reymundo@example.com')
INSERT [dbo].[Employees] ([Emp_ID], [Fname], [MidName], [LastName], [Emp_Address], [Gender], [Salary], [Branch_ID], [Manager_ID], [Emp_Email]) VALUES (13, N'Ali', N'Said ', N'ElNaggar', N'Maadi Cario', N'M', 60000, 0, NULL, N'ali@gmail.com')
GO
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'aida26@example.org', N'1361849475', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'ali@gmail.com', N'1234', N'Admin')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'angeline07@example.net', N'582879912', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'betsy.stiedemann@example.com', N'307707817', N'Manager')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'casper.dolly@example.com', N'1066403496', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'cassandra65@example.com', N'1585100342', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'cwilderman@example.com', N'999793265', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'dannie15@example.net', N'1347816296', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'deja86@example.com', N'1156624297', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'demario45@example.net', N'778622247', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'desiree.hansen@example.com', N'389927241', N'Manager')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'dovie.littel@example.com', N'219638213', N'Employee')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'elisabeth.dicki@example.com', N'323893207', N'Employee')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'ghayes@example.com', N'630117790', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'grayson.hickle@example.com', N'1255174634', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'hudson.jamey@example.org', N'731224592', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'jaeden70@example.org', N'1217512295', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'kozey.eva@example.org', N'682762606', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'lauryn.koepp@example.com', N'576487301', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'lloyd80@example.org', N'1219073553', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'lura.wolf@example.org', N'1084346541', N'Manager')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'ova97@example.org', N'516924360', N'Publisher')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'qullrich@example.net', N'259243077', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'rcronin@example.org', N'1105933891', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'reinger.claire@example.org', N'1401525308', N'Customer')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'schulist.phoebe@example.net', N'882602308', N'Employee')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'sklein@example.org', N'569478182', N'Manager')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'terry.reymundo@example.com', N'756754659', N'Employee')
INSERT [dbo].[Login_Info] ([Email], [PassW], [UserType]) VALUES (N'ugoodwin@example.com', N'68921043', N'Customer')
GO
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (1, N'cwilderman@example.com', N'Dr. Leone Nikolaus Sr.')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (2, N'jaeden70@example.org', N'Jaeden Jenkins')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (3, N'lauryn.koepp@example.com', N'Dr. Isaiah Langworth IV')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (4, N'kozey.eva@example.org', N'Chelsie Dach Sr.')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (5, N'deja86@example.com', N'Alexandrine Konopelski')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (6, N'hudson.jamey@example.org', N'Blair Welch')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (7, N'ova97@example.org', N'Alexis Hills')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (8, N'angeline07@example.net', N'Ms. Maggie Raynor')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (9, N'casper.dolly@example.com', N'Marlin Kuhlman')
INSERT [dbo].[Publishers] ([Publisher_ID], [Publisher_Email], [PublisherName]) VALUES (10, N'cassandra65@example.com', N'Travis Johnston')
GO
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (1, 300, 1, 3, NULL, CAST(N'2019-01-02' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (2, 525, 1, 3, NULL, CAST(N'2020-05-15' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (3, 450, 2, 4, NULL, CAST(N'2020-01-29' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (4, 360, 2, 4, NULL, CAST(N'2021-02-15' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (5, 150, 3, 1, NULL, CAST(N'2018-05-03' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (6, 260, 3, 1, NULL, CAST(N'2019-05-04' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (7, 300, 4, 12, NULL, CAST(N'2018-05-01' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (8, 390, 4, 12, NULL, CAST(N'2022-07-13' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (9, 360, 0, NULL, 1, CAST(N'2021-01-11' AS Date))
INSERT [dbo].[Sales_History] ([Sales_ID], [SalePrice], [Branch_ID], [Emp_ID], [Customer_ID], [SaleDate]) VALUES (10, 360, 0, NULL, 2, CAST(N'2021-01-11' AS Date))
GO
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (1, 14, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (1, 15, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (2, 5, 2)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (2, 6, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (3, 7, 3)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (3, 8, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (4, 1, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (4, 2, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (4, 4, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (5, 20, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (6, 3, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (6, 19, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (7, 12, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (7, 13, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (8, 9, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (8, 10, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (8, 11, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (9, 1, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (9, 2, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (9, 3, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (10, 1, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (10, 2, 1)
INSERT [dbo].[SoldBooks] ([Sales_ID], [Book_ID], [Quantity]) VALUES (10, 3, 1)
GO
ALTER TABLE [dbo].[Requests_History] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Sales_History] ADD  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Authors] ([Author_ID])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([Publisher_ID])
REFERENCES [dbo].[Publishers] ([Publisher_ID])
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK__Branches__Manage__398D8EEE] FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[Employees] ([Emp_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK__Branches__Manage__398D8EEE]
GO
ALTER TABLE [dbo].[CustomerRating]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Books] ([Book_ID])
GO
ALTER TABLE [dbo].[CustomerRating]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([Customer_Email])
REFERENCES [dbo].[Login_Info] ([Email])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__Emp_E__3C69FB99] FOREIGN KEY([Emp_Email])
REFERENCES [dbo].[Login_Info] ([Email])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Emp_E__3C69FB99]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK__Employees__Manag__3D5E1FD2] FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[Employees] ([Emp_ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK__Employees__Manag__3D5E1FD2]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Branches] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branches] ([Branch_ID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Branches]
GO
ALTER TABLE [dbo].[Publishers]  WITH CHECK ADD FOREIGN KEY([Publisher_Email])
REFERENCES [dbo].[Login_Info] ([Email])
GO
ALTER TABLE [dbo].[Requests_History]  WITH CHECK ADD  CONSTRAINT [FK__Requests___Publi__412EB0B6] FOREIGN KEY([Publisher_ID])
REFERENCES [dbo].[Publishers] ([Publisher_ID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Requests_History] CHECK CONSTRAINT [FK__Requests___Publi__412EB0B6]
GO
ALTER TABLE [dbo].[Sales_History]  WITH CHECK ADD FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branches] ([Branch_ID])
GO
ALTER TABLE [dbo].[Sales_History]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[Customers] ([Customer_ID])
GO
ALTER TABLE [dbo].[Sales_History]  WITH CHECK ADD FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employees] ([Emp_ID])
GO
ALTER TABLE [dbo].[SoldBooks]  WITH CHECK ADD FOREIGN KEY([Book_ID])
REFERENCES [dbo].[Books] ([Book_ID])
GO
ALTER TABLE [dbo].[SoldBooks]  WITH CHECK ADD FOREIGN KEY([Sales_ID])
REFERENCES [dbo].[Sales_History] ([Sales_ID])
GO
/****** Object:  StoredProcedure [dbo].[Add_Branches]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Add_Branches]
@Branch_ID int ,

@BranchName varchar(50),

@Branch_Location varchar(30),

@Manager_ID int
AS 
Begin
Insert into Branches (Branch_ID,BranchName,Branch_Location,Manager_ID)
Values (@Branch_ID,@BranchName,@Branch_Location,@Manager_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[AddBooks]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[AddBooks]
	@Book_ID  int, 
	@BookName varchar(50),
	@Book_Language varchar(50), 
	@Genre varchar(50),
	@Price int,
	@Quantity int,
	@Book_Description varchar(150),
    @Rating int,
    @Author_ID int ,
    @Publisher_ID int 

AS 
Begin
Insert into Books (Book_ID,BookName,Book_Language,Genre,Price,Quantity,Book_Description ,Rating ,Author_ID ,Publisher_ID )
Values (@Book_ID,@BookName,@Book_Language,@Genre,@Price,@Quantity,@Book_Description ,@Rating ,@Author_ID ,@Publisher_ID)
END
GO
/****** Object:  StoredProcedure [dbo].[AddEmployee]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[AddEmployee]
@Emp_ID int ,
@Fname varchar(15) ,
@MidName varchar(15),
@LastName varchar(15),
@Emp_Address varchar(30) ,
@Gender char,
@Salary int,
/*---------------------------------------------*/
@Branch_ID int,
@Manager_ID int,
@Emp_Email varchar(50)
/*--------------------------------------------*/
AS 
Begin
Insert into Employees (Emp_ID  ,Fname  ,MidName ,LastName ,Emp_Address ,Gender ,Salary ,Branch_ID ,Manager_ID ,Emp_Email )
Values (@Emp_ID  ,@Fname  ,@MidName ,@LastName ,@Emp_Address ,@Gender ,@Salary ,@Branch_ID ,@Manager_ID ,@Emp_Email)
END
GO
/****** Object:  StoredProcedure [dbo].[Delete_Book]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Delete_Book]
@Book_ID  int
AS 
Begin
DELETE FROM Books 
WHERE Book_ID=@Book_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Delete_Branche]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Delete_Branche]
@Branch_ID int
AS 
Begin
DELETE FROM Branches 
WHERE Branch_ID =@Branch_ID 
End
GO
/****** Object:  StoredProcedure [dbo].[Delete_Employee]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Delete_Employee]
@Emp_ID int
AS 
Begin
DELETE FROM Employees 
WHERE Emp_ID=@Emp_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Delete_Sale]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Delete_Sale]
@Sales_ID int
AS 
Begin
DELETE FROM Sales_History 
WHERE Sales_ID =@Sales_ID 
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Emp_Address]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Emp_Address]
	@Emp_ID  int, 
	@Emp_Address varchar(30)

AS 
Begin
Update Employees 
set Emp_Address=@Emp_Address
WHERE Emp_ID =@Emp_ID 
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Emp_BranchID]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Emp_BranchID]
	@Emp_ID  int, 
	@Branch_ID int

AS 
Begin
Update Employees 
set Branch_ID=@Branch_ID
WHERE Emp_ID=@Emp_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Emp_ManagerID]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Emp_ManagerID]
	@Emp_ID  int, 
	@Manager_ID int

AS 
Begin
Update Employees 
set Manager_ID=@Manager_ID
WHERE Emp_ID=@Emp_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Emp_ManagerID_Cascade]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Emp_ManagerID_Cascade]
	@Branch_ID int,
	@Manager_ID int
	

AS 
Begin
Update Employees 
set Manager_ID=@Manager_ID
WHERE Branch_ID=@Branch_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Emp_Salary]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Emp_Salary]
	@Emp_ID  int, 
	@Salary int

AS 
Begin
Update Employees 
set Salary=@Salary
WHERE Emp_ID=@Emp_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Manager_Branches]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Manager_Branches]
@Branch_ID int,
@Manager_ID int
AS 
Begin
Update  Branches
set Manager_ID=@Manager_ID
Where Branch_ID=@Branch_ID
END
GO
/****** Object:  StoredProcedure [dbo].[Edit_Name_Branches]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Name_Branches]
@Branch_ID int ,

@BranchName varchar(50)

AS 
Begin
Update  Branches
set BranchName=@BranchName
Where Branch_ID=@Branch_ID
END
GO
/****** Object:  StoredProcedure [dbo].[Edit_Price_Books]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Price_Books]
	@Book_ID  int, 
	@Price int

AS 
Begin
Update Books 
set Price=@Price
WHERE Book_ID=@Book_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Quantity_Books]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Quantity_Books]
	@Book_ID  int, 
	@Quantity int

AS 
Begin
Update Books 
set Quantity=@Quantity
WHERE Book_ID=@Book_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Edit_Rating_Books]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Edit_Rating_Books]
	@Book_ID  int, 
	@Rating int

AS 
Begin
Update Books 
set Rating=@Rating
WHERE Book_ID=@Book_ID
End
GO
/****** Object:  StoredProcedure [dbo].[Get_Emp_BranchID]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Get_Emp_BranchID]
	@Emp_ID int

AS 
Begin
Select Branch_ID From Employees 
WHERE Emp_ID=@Emp_ID
End
GO
/****** Object:  StoredProcedure [dbo].[GetIDFromEmail]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[GetIDFromEmail](@EMAIL varchar(50) )
AS
BEGIN

	Select Customers.Customer_ID
	From Customers join Login_Info on Customer_Email = Email
	where Customer_Email =  @EMAIL


END
GO
/****** Object:  StoredProcedure [dbo].[GetPassWFromEmail]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[GetPassWFromEmail](@EMAIL varchar(50) )
AS
BEGIN

	Select PassW
	From Login_Info
	where Email =  @EMAIL


END
GO
/****** Object:  StoredProcedure [dbo].[InsertAuthor]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertAuthor]
	-- Add the parameters for the stored procedure here


	@Authorid int,
	@Authorfname varchar(50),
	@Authorlname varchar(50)

	 
	
AS
BEGIN
INSERT INTO Authors(Author_ID,Fname,LastName)
Values (@Authorid,@Authorfname,@Authorlname)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertnewCustomer]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertnewCustomer]
	-- Add the parameters for the stored procedure here


	
	@Cust_ID int,
	@Cust_Fname varchar(50),
	@Cust_Mname varchar(50)	,
	@Cust_Lname varchar(50),
	@Cust_Adress varchar(50),
	@Cust_Gender char(16),
	@Cust_Email varchar(16)
	
	
	

	 
	
AS
BEGIN
INSERT INTO Customers(Customer_ID,Fname,MidName,LastName,Customer_Address,Gender,Customer_Email)
Values (@Cust_ID,@Cust_Fname,@Cust_Mname,@Cust_Lname,@Cust_Adress,@Cust_Gender,@Cust_Email)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertnewPublisher]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertnewPublisher]
	-- Add the parameters for the stored procedure here


	
	@Pub_Id int,
	@Pub_Email varchar(50),
	@Pub_name varchar (50)
	
	

	 
	
AS
BEGIN
INSERT INTO Publishers(Publisher_ID,Publisher_Email,PublisherName)
Values (@Pub_Id,@Pub_Email,@Pub_name)
END
GO
/****** Object:  StoredProcedure [dbo].[Insertnewuser]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insertnewuser]
	-- Add the parameters for the stored procedure here


	
	@UserEmail varchar(50),
	@UserPassword  varchar(50),
	@Usert varchar(50)
	

	 
	
AS
BEGIN
INSERT INTO Login_Info(Email,PassW,UserType)
Values (@UserEmail,@UserPassword,@Usert)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRequest]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertRequest]
	-- Add the parameters for the stored procedure here


	@BookDescription varchar(50),
	@BookName varchar(50),
	@BookGenre  varchar(50),
	@BookLanguage varchar(50),
	@BookPrice int,
	@PublisherID int,
	@Requestid int,
	@Authorfname varchar(50),
	@Authorlname varchar(50)

	 
	
AS
BEGIN
INSERT INTO Requests_History(Request_ID,Publisher_ID,Book_Description,Book_Name,Book_Genre,Book_language,Book_Price,Author_Name,Author_LName,RequestStatues)
Values (@Requestid,@PubLisherID,@BookDescription,@BookName,@BookGenre,@BookLanguage,@BookPrice,@Authorfname,@Authorlname ,'Pending')
END
GO
/****** Object:  StoredProcedure [dbo].[InsertRequeststatus]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertRequeststatus]
	-- Add the parameters for the stored procedure here


	
	@Requestid int,
	@RequestStatus varchar(50)
	

	 
	
AS
BEGIN
INSERT INTO Request_Status(Request_ID,RequestStatus)
Values (@Requestid,@RequestStatus)
END
GO
/****** Object:  StoredProcedure [dbo].[Process_Pending_Request]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Process_Pending_Request]
@Request_ID int ,
@RequestStatues varchar(30)
AS 
Begin
Update Requests_History 
set RequestStatues=@RequestStatues
where Request_ID=@Request_ID
End
GO
/****** Object:  StoredProcedure [dbo].[ShowCustomerBoughtBooks]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[ShowCustomerBoughtBooks](@Sale_ID AS INT)
As
BEGIN
	
	Select BookName , Author_ID , Book_Language , Book_Description
	FROM SoldBooks join Books on Books.Book_ID = SoldBooks.Book_ID
	Where SoldBooks.Sales_ID = @Sale_ID
		

END
GO
/****** Object:  StoredProcedure [dbo].[ShowCustomerSalesHistory]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[ShowCustomerSalesHistory](@CustomerID AS INT)
As
BEGIN
	
	Select Books.Book_ID,Sales_History.Sales_ID , Books.BookName , Books.Price , SoldBooks.Quantity
	From
	Sales_History join SoldBooks on Sales_History.Sales_ID = SoldBooks.Sales_ID join  Books on SoldBooks.Book_ID = Books.Book_ID
	Where Sales_History.Customer_ID = @CustomerID

END
GO
/****** Object:  StoredProcedure [dbo].[ShowCustomerSearch]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[ShowCustomerSearch](
			@Name AS VARCHAR(MAX) ,
			@AUTHOR AS VARCHAR(MAX) = NULL ,
			@GENRE AS VARCHAR(MAX) = NULL  ,
			@LANG AS VARCHAR(MAX) = NULL ,
			@PUBLISHER AS VARCHAR(MAX) = NULL ,
			@SortBy as varchar(max) = NULL,
			@SortOrder as varchar(1) = 'A'
			)
As
BEGIN
	
	Select Book_ID , BookName , Authors.Fname , Authors.LastName , Book_Language , Price , Quantity ,Rating
	FROM 

		Books join Authors on Books.Author_ID = Authors.Author_ID
		JOIN
		Publishers on Books.Publisher_ID = Publishers.Publisher_ID

	WHERE 
		BookName like '%' + @Name + '%' AND
		(@AUTHOR IS NULL OR (Authors.Fname + ' ' + Authors.LastName) LIKE '%' + @AUTHOR +'%') AND
		(@PUBLISHER IS NULL OR Publishers.PublisherName LIKE '%' + @PUBLISHER +'%') AND 
		(@GENRE IS NULL OR Books.Genre LIKE '%' + @GENRE + '%') AND
		(@LANG IS NULL OR Books.Book_Language LIKE '%' + @LANG + '%') AND
		Quantity != 0



		

END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePassword]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[UpdatePassword](@EMAIL varchar(50) , @PassW varchar(25) )
AS
BEGIN
	
	Update Login_Info
	Set PassW = @PassW where Email = @EMAIL

END
GO
/****** Object:  StoredProcedure [dbo].[View_Emp_BranchID]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[View_Emp_BranchID]
	@Manager_ID int

AS 
Begin
Select Branch_ID From Branches 
WHERE Manager_ID=@Manager_ID 
End
GO
/****** Object:  StoredProcedure [dbo].[View_Emp_ManagerID]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[View_Emp_ManagerID]
	@Branch_ID int

AS 
Begin
Select Manager_ID From Branches 
WHERE Branch_ID=@Branch_ID 
End
GO
/****** Object:  StoredProcedure [dbo].[View_Pending_Request]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[View_Pending_Request]
AS 
Begin
Select * From Requests_History 
WHERE RequestStatues='Pending'
End
GO
/****** Object:  StoredProcedure [dbo].[View_Purchase_History]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[View_Purchase_History]
AS 
Begin
Select Sales_History.Sales_ID,BookName,SalePrice,Branch_ID,Emp_ID,SoldBooks.Book_ID,SoldBooks.Quantity,Customer_ID
 From (Sales_History FULL OUTER JOIN SoldBooks  ON Sales_History.Sales_ID=SoldBooks.Sales_ID JOIN Books ON Books.Book_ID=SoldBooks.Book_ID)
End
GO
/****** Object:  StoredProcedure [dbo].[View_Request_status]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[View_Request_status]
	@Branch_ID int

AS 
Begin
Select * From Request_Status 
WHERE Branch_ID=@Branch_ID
End
GO
/****** Object:  StoredProcedure [dbo].[ViewPublisherRequests]    Script Date: 1/11/2021 1:28:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ViewPublisherRequests]
	-- Add the parameters for the stored procedure here
	@PublisherId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
    FROM Requests_History Rh
    where rh.Publisher_ID=@PublisherId;
END
GO
USE [master]
GO
ALTER DATABASE [Bookstore] SET  READ_WRITE 
GO
