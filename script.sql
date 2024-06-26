USE [master]
GO
/****** Object:  Database [LMS]    Script Date: 5/4/2024 10:35:32 PM ******/
CREATE DATABASE [LMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LMS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LMS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LMS] SET  MULTI_USER 
GO
ALTER DATABASE [LMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LMS] SET QUERY_STORE = OFF
GO
USE [LMS]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 5/4/2024 10:35:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](150) NOT NULL,
	[AuthorBio] [nvarchar](130) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 5/4/2024 10:35:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[PublishedDate] [date] NOT NULL,
	[AvailableCopies] [int] NOT NULL,
	[TotalCopies] [int] NOT NULL,
	[ISBN] [nvarchar](50) NOT NULL,
	[AuthorID] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowdBooks]    Script Date: 5/4/2024 10:35:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowdBooks](
	[BorrowID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[BorrowDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BorrowdBooks] PRIMARY KEY CLUSTERED 
(
	[BorrowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 5/4/2024 10:35:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](100) NOT NULL,
	[RegistrationDate] [date] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 5/4/2024 10:35:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Role] [nvarchar](150) NULL,
	[IsMember] [bit] NOT NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [AuthorBio]) VALUES (1, N'Zahir Rayhan', N'Story, Novel Writter')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [AuthorBio]) VALUES (2, N'Munir Chowdhury', N'Drama Writter')
INSERT [dbo].[Authors] ([AuthorID], [AuthorName], [AuthorBio]) VALUES (3, N'Kazi Nazrul Islam', N'Bidrohi Poet')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookID], [Title], [PublishedDate], [AvailableCopies], [TotalCopies], [ISBN], [AuthorID]) VALUES (1, N'Hajar bochor Dhore', CAST(N'2005-01-01' AS Date), 50, 100, N'Something', 1)
INSERT [dbo].[Books] ([BookID], [Title], [PublishedDate], [AvailableCopies], [TotalCopies], [ISBN], [AuthorID]) VALUES (2, N'Kabar', CAST(N'1966-02-01' AS Date), 60, 150, N'Something', 2)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[BorrowdBooks] ON 

INSERT [dbo].[BorrowdBooks] ([BorrowID], [MemberID], [BookID], [BorrowDate], [ReturnDate], [status]) VALUES (1, 1, 1, CAST(N'2024-05-01' AS Date), CAST(N'2024-05-02' AS Date), N'Borrowed')
SET IDENTITY_INSERT [dbo].[BorrowdBooks] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberID], [UserId], [FirstName], [LastName], [Email], [PhoneNumber], [RegistrationDate]) VALUES (1, 2, N'Rumail', N'Islam', NULL, N'01900000000', CAST(N'2024-05-01' AS Date))
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [Email], [FirstName], [LastName], [Password], [Role], [IsMember]) VALUES (1, N'admin@gmail.com', N'Admin', N'Admin', N'Admin_123456', N'Admin', 0)
INSERT [dbo].[UserInfo] ([UserId], [Email], [FirstName], [LastName], [Password], [Role], [IsMember]) VALUES (2, N'rumail@gmail.com', N'Rumail', N'Islam', N'Ru@123456', N'Member', 1)
INSERT [dbo].[UserInfo] ([UserId], [Email], [FirstName], [LastName], [Password], [Role], [IsMember]) VALUES (3, N'mu@gmail.com', N'Munia', N'rahman', N'Mu_123456', NULL, 0)
INSERT [dbo].[UserInfo] ([UserId], [Email], [FirstName], [LastName], [Password], [Role], [IsMember]) VALUES (4, N'ayesha@gmail.com', N'Ayesha ', N'Nodi', N'Ay@123456', NULL, 0)
INSERT [dbo].[UserInfo] ([UserId], [Email], [FirstName], [LastName], [Password], [Role], [IsMember]) VALUES (5, N'ta@gmail.com', N'Tania', N'Rahman', N'Tania_123456', NULL, 0)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
GO
ALTER TABLE [dbo].[UserInfo] ADD  CONSTRAINT [DF_UserInfo_IsMember]  DEFAULT ((0)) FOR [IsMember]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Author]
GO
ALTER TABLE [dbo].[BorrowdBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowdBooks_Books] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BorrowdBooks] CHECK CONSTRAINT [FK_BorrowdBooks_Books]
GO
ALTER TABLE [dbo].[BorrowdBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowdBooks_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[BorrowdBooks] CHECK CONSTRAINT [FK_BorrowdBooks_Member]
GO
USE [master]
GO
ALTER DATABASE [LMS] SET  READ_WRITE 
GO
