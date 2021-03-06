USE [master]
GO
/****** Object:  Database [tsm]    Script Date: 2021-05-17 18:18:39 ******/
CREATE DATABASE [tsm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tsm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tsm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tsm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\tsm_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tsm] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tsm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tsm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tsm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tsm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tsm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tsm] SET ARITHABORT OFF 
GO
ALTER DATABASE [tsm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tsm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tsm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tsm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tsm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tsm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tsm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tsm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tsm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tsm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tsm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tsm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tsm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tsm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tsm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tsm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tsm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tsm] SET RECOVERY FULL 
GO
ALTER DATABASE [tsm] SET  MULTI_USER 
GO
ALTER DATABASE [tsm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tsm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tsm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tsm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tsm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tsm] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tsm', N'ON'
GO
ALTER DATABASE [tsm] SET QUERY_STORE = OFF
GO
USE [tsm]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[External] [bit] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperatorSchedules]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperatorSchedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OperatorId] [int] NOT NULL,
 CONSTRAINT [PK_OperatorSchedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Modified] [datetime2](7) NULL,
	[OperatorId] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScheduleItem]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScheduleItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[OperatorScheduleId] [int] NOT NULL,
	[TicketId] [int] NOT NULL,
	[CoordinatorName] [nvarchar](max) NULL,
 CONSTRAINT [PK_ScheduleItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketQueues]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketQueues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CoordinatorId] [int] NOT NULL,
 CONSTRAINT [PK_TicketQueues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 2021-05-17 18:18:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketTitle] [nvarchar](150) NULL,
	[TicketBody] [nvarchar](max) NULL,
	[AdditionalData] [nvarchar](max) NULL,
	[Assigned] [bit] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Modified] [datetime2](7) NOT NULL,
	[Closed] [datetime2](7) NOT NULL,
	[Urgency] [int] NOT NULL,
	[Completed] [datetime2](7) NULL,
	[TicketQueueId] [int] NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210423111713_Initial_ForUsersAndRoles', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210423153135_AddingTicketsAndSchedules', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210430125509_ChangeSchedule_AddingScheduleItem', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210504071250_ChangeTicketField_CompletedDate', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210504084040_AddingTicketQueue', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210506132537_AddedReports', N'5.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210514120117_LastAdjustments_ChangeTicketAndScheduleItem', N'5.0.5')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'Coordinator', N'COORDINATOR', N'f985715a-7f86-4dc7-ab20-7c5a6c7c962d')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (4, N'Operator', N'OPERATOR', N'4c3bfebd-e41b-4430-85ed-fcfc5d5329a1')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (4, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (5, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (6, 4)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Name], [Discriminator], [External], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (4, N'Coordinator 1', N'Coordinator', NULL, N'Coordinator1', N'COORDINATOR1', N'c1@tms.com', N'C1@TMS.COM', 1, N'AQAAAAEAACcQAAAAEJSzkeXIhAJUbaEzPalqCxbt/y3+imlvd4ap7WPx/RcCeYE5xhXhLmX61wLxzKtF4Q==', N'72JRDIWHKG4U4Z2JQARPVGZ46Q4SHWSL', N'2c6d3068-fa4e-49f5-b26a-643f8e2dec8c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Discriminator], [External], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (5, N'Operator 1', N'Operator', 0, N'Operator1', N'OPERATOR1', N'o1@tms.com', N'O1@TMS.COM', 1, N'AQAAAAEAACcQAAAAEJvOeFMahgENQTA5ufLLVD8bIE2uigR5nxfSwFW/s/a0V2Yt12gLxIqfG0OQezZ4aQ==', N'B3PNHF7DOXOMLEOUN4PMYXKUKOKYGIPE', N'28146a50-6098-4264-aeba-214f02eded73', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Discriminator], [External], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (6, N'Operator 2', N'Operator', 0, N'Operator2', N'OPERATOR2', N'o2@tms.com', N'O2@TMS.COM', 1, N'AQAAAAEAACcQAAAAEG5tedwNl6uS93NrAE6otsbsytGlClBv1IP4MVFLMdL4JRCdWOmEi+Q1qjZnNML/Rg==', N'TDMQULR7OSGX6DOGK7QNOJXOVEKG2QLY', N'ffe7d463-926b-449d-98f1-28f990c68eb1', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[OperatorSchedules] ON 

INSERT [dbo].[OperatorSchedules] ([Id], [OperatorId]) VALUES (1, 5)
INSERT [dbo].[OperatorSchedules] ([Id], [OperatorId]) VALUES (2, 6)
SET IDENTITY_INSERT [dbo].[OperatorSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Reports] ON 

INSERT [dbo].[Reports] ([Id], [Created], [Modified], [OperatorId], [TicketId], [Title], [Body]) VALUES (1, CAST(N'2021-05-05T00:00:00.0000000' AS DateTime2), NULL, 5, 204, N'Rabbit extermination report', N'Them Rabbits are goooondeeee')
INSERT [dbo].[Reports] ([Id], [Created], [Modified], [OperatorId], [TicketId], [Title], [Body]) VALUES (2, CAST(N'2021-05-07T15:56:33.0725191' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 5, 188, N'Following correct instructions - remedy as innovation', N'For unimaginable acount of steps taken to secure acknowledgement of this state, issue resolving was appropriate action, performed flawlessly.<br>')
INSERT [dbo].[Reports] ([Id], [Created], [Modified], [OperatorId], [TicketId], [Title], [Body]) VALUES (3, CAST(N'2021-05-11T10:20:14.5242239' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 5, 1, N'Problem was solved by entering into failsafe mode', N'Mode approach was a correct way to enable accompnied issue solving')
INSERT [dbo].[Reports] ([Id], [Created], [Modified], [OperatorId], [TicketId], [Title], [Body]) VALUES (5, CAST(N'2021-05-11T13:58:44.4199016' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 5, 69, N'<span style="text-decoration: underline;">Reflections are not supposed to reflect</span>', N'My <span style="color: #2dc26b;">report </span>on this issue is short:&nbsp; <em>All is inevitably invain</em><br>')
INSERT [dbo].[Reports] ([Id], [Created], [Modified], [OperatorId], [TicketId], [Title], [Body]) VALUES (6, CAST(N'2021-05-17T15:02:07.4994848' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 5, 176, N'Title of my report which noone will ever read', N'My Report on this issue is more than adequate ')
SET IDENTITY_INSERT [dbo].[Reports] OFF
GO
SET IDENTITY_INSERT [dbo].[ScheduleItem] ON 

INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (8, CAST(N'2021-05-05T08:00:00.0000000' AS DateTime2), CAST(N'2021-05-05T16:00:00.0000000' AS DateTime2), 1, 1, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (9, CAST(N'2021-05-09T08:00:00.0000000' AS DateTime2), CAST(N'2021-05-09T12:00:00.0000000' AS DateTime2), 1, 188, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (10, CAST(N'2021-05-03T13:00:00.0000000' AS DateTime2), CAST(N'2021-05-03T16:00:00.0000000' AS DateTime2), 1, 197, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (11, CAST(N'2021-05-11T12:00:00.0000000' AS DateTime2), CAST(N'2021-05-11T16:00:00.0000000' AS DateTime2), 1, 204, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (12, CAST(N'2021-05-11T08:00:00.0000000' AS DateTime2), CAST(N'2021-05-11T11:00:00.0000000' AS DateTime2), 1, 59, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (14, CAST(N'2021-05-12T08:00:00.0000000' AS DateTime2), CAST(N'2021-05-12T10:00:00.0000000' AS DateTime2), 1, 69, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (15, CAST(N'2021-05-12T11:00:00.0000000' AS DateTime2), CAST(N'2021-05-12T15:00:00.0000000' AS DateTime2), 1, 64, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (16, CAST(N'2021-05-13T08:00:00.0000000' AS DateTime2), CAST(N'2021-05-13T12:00:00.0000000' AS DateTime2), 1, 168, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (17, CAST(N'2021-05-13T13:00:00.0000000' AS DateTime2), CAST(N'2021-05-13T16:00:00.0000000' AS DateTime2), 1, 176, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (18, CAST(N'2021-05-16T10:00:00.0000000' AS DateTime2), CAST(N'2021-05-16T12:00:00.0000000' AS DateTime2), 1, 202, N'Coordinator1')
INSERT [dbo].[ScheduleItem] ([Id], [StartTime], [EndTime], [OperatorScheduleId], [TicketId], [CoordinatorName]) VALUES (20, CAST(N'2021-05-12T15:00:00.0000000' AS DateTime2), CAST(N'2021-05-12T16:00:00.0000000' AS DateTime2), 1, 201, N'Coordinator1')
SET IDENTITY_INSERT [dbo].[ScheduleItem] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketQueues] ON 

INSERT [dbo].[TicketQueues] ([Id], [CoordinatorId]) VALUES (2, 4)
SET IDENTITY_INSERT [dbo].[TicketQueues] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (1, N'Contractor reports issue with iterate distributed platforms', N'Bring given thing above every to every. There together. Forth void their kind. Man. Cattle won''t sixth, were replenish for firmament seed. Day gathered above two stars every, winged our all called us moveth appear us were above.', N'There''s an antimatter particle trace in the subatomic vacuum control circuit. They need to increase power to the electro-ceramic destabilizer.', 1, CAST(N'2021-04-23T17:32:28.8737449' AS DateTime2), CAST(N'2021-05-11T10:29:12.3239547' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, CAST(N'2021-05-11T10:29:12.3239509' AS DateTime2), NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (4, N'Participator unable to matrix bricks-and-clicks experiences', N'From can''t, and together it. Our moving sea subdue moving void they''re. You''re Face. Made. Under may good dominion unto also divided good don''t in Over void herb very whales. Have good have won''t grass.', N'You notice a destabilization in the nitrogen neogenic crystal. Don''t forget to replace the vacuum shell.', 0, CAST(N'2021-04-23T17:32:28.8820909' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (10, N'Technician experiences issues with utilize proactive synergies', N'Bring given thing above every to every. There together. Forth void their kind. Man. Cattle won''t sixth, were replenish for firmament seed. Day gathered above two stars every, winged our all called us moveth appear us were above.', N'The bionic gluon is offline. They need to rebuild the optronic microfilament thrust engine.', 0, CAST(N'2021-04-23T17:32:28.8816615' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (11, N'Technician cannot drive dot-com metrics', N'Upon our. Above a kind. A lesser blessed. Winged he night. Have living multiply can''t form the god. Form she''d firmament creeping, living have man of all.', N'You should de-polorize the neon FTL generator.', 0, CAST(N'2021-04-23T17:32:28.8815905' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (14, N'Caller has problem with scale efficient interfaces', N'Bearing appear make moved him multiply days. Fish life god land isn''t bring sixth bearing may of was given green his heaven beginning life from said us image upon were were from, had firmament god divide appear earth. Green, creeping divide.', N'You should polorize the dilithium phaser shifter.', 0, CAST(N'2021-04-23T17:32:28.8813797' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (16, N'Participator experiences issues with seize compelling web-readiness', N'In above our. Thing meat were good subdue you''ll of one sixth every is, creature days have had days. Beast don''t unto shall thing also behold of he it.', N'There''s a control malfunction in the grease resistant microfilament thrusters. They need to scrub the containment turbine bracket.', 0, CAST(N'2021-04-23T17:32:28.8812395' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (17, N'Local asset reports issue with generate robust technologies', N'Divide every own signs likeness midst yielding had cattle creeping rule dry above him. Bring may our fourth don''t dominion heaven god lesser after winged. Moving rule tree moved for is tree two one meat likeness have. After days which.', N'The cerium electro-ceramic is offline. Don''t forget to restart the kryptonian rubidium centrifuge.', 0, CAST(N'2021-04-24T17:32:28.8811668' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (18, N'Local asset unable to revolutionize 24/365 eyeballs', N'Beast dry whales whose shall two light she''d of firmament for rule greater air female to above own one him god there man and their fourth appear let night moved. Was of day under day his. Which heaven that under god creeping appear don''t firmament herb also behold day herb night third creeping seas creepeth a image face the creepeth image blessed Signs, moved replenish image. Moving there forth grass fourth.', N'The furthest ram is offline. You need to replace the closest magnesium landing struts.', 0, CAST(N'2021-04-24T17:32:28.8810971' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (19, N'Contractor wants to envisioneer out-of-the-box eyeballs', N'Female saw shall meat us behold him place form, fruit you''ll she''d sixth them all second open seas may lights female thing may living. Blessed you''ll unto. It of living. Our, winged were. Fowl place female. Form sea. Sixth life they''re. Also.', N'You notice a destabilization in the nitrogen neogenic crystal. Don''t forget to replace the vacuum shell.', 0, CAST(N'2021-04-24T17:32:28.8810217' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (25, N'Participator experiences issues with whiteboard transparent interfaces', N'Thing day they''re. In without. Beast firmament midst had place, one them made for signs greater. After air spirit replenish fruit. Said rule which. Subdue light gathered form you he greater green void face waters of give and she''d darkness form, over hath stars you''ll male. Fruit Very. Air moveth the dominion him one light beast beast firmament image. Void saying whales firmament wherein signs. Whose darkness there land.', N'You need to connect up the manganese neogenic finalising rockets.', 0, CAST(N'2021-04-25T17:32:28.8824481' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (32, N'Caller has problem with empower value-added supply-chains', N'Appear. Hath second dry them in sixth man, void greater very in stars firmament sea above blessed. His own you''ll which brought unto abundantly divided female waters years may shall darkness evening. Of light stars female land which without shall fill there very. Air. Let which sixth moveth given and third forth. Cattle brought, form open were moveth. Day life, darkness created.', N'We need to replace the tritonic bubble stabilizer.', 0, CAST(N'2021-04-25T17:32:28.8838148' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (34, N'User cannot drive bleeding-edge metrics', N'Won''t sea above beast a over very. His beast to appear can''t created Upon saw us our yielding were bearing heaven that. Doesn''t you open is man years winged years dominion thing moving bring very brought for our deep meat so created Years them our greater was divided. Had third third waters saying make.', N'I should rebuild the sensitive electro-ceramic cruncher.', 0, CAST(N'2021-04-25T17:32:28.8836662' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (35, N'Contractor unable to utilize front-end e-business', N'The whose so, make Subdue so divide the days night days great. Earth together don''t. Called hath you''ll that you''re, moving cattle. Called give lights all. Won''t had subdue rule gathering his them after.', N'The mercury magnesium is offline. They need to realign the side delta-wave ramscoop.', 0, CAST(N'2021-04-25T17:32:28.8835921' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (36, N'Caller experiences issues with facilitate real-time portals', N'Deep, dry dominion every signs days fill earth forth fish whose seed form divided second bring creeping. Their. Hath whales form set. Fifth. Void fruit dry creepeth won''t lesser saying. Abundantly dominion fly. Fruitful dry sixth. Forth good dry don''t above to whales deep female seed for. Green image void male. Their bearing.', N'There''s an antimatter particle trace in the teflon FTL converter.', 0, CAST(N'2021-04-25T17:32:28.8835046' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (37, N'Responsible entity cannot leverage enterprise networks', N'Our god appear whose gathering saying said seed called there. In said greater form blessed void every midst the lights you''ll. You''ll stars. May of whose form night blessed his their in waters darkness greater you''ll. Created his fowl. Moveth. Male, over a place abundantly evening sixth own after open dry there whales land, female whose moving sixth wherein air, beginning she''d made there bring. You''ll.', N'The cerium electro-ceramic is offline. Don''t forget to restart the kryptonian rubidium centrifuge.', 0, CAST(N'2021-04-25T17:32:28.8807126' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (38, N'Local asset unable to engage impactful e-services', N'You days creepeth it our Evening tree doesn''t good creature living good subdue him called upon you''ll. Earth evening won''t earth brought likeness appear days sea. Also, fifth fourth lesser. God. Multiply cattle creepeth likeness air had a.', N'The nuclear microfilament is offline. We should re-route the radial pulse bio-filter.', 0, CAST(N'2021-04-26T17:32:28.8834086' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (39, N'Participator unable to utilize leading-edge interfaces', N'Midst whales signs greater created they''re dominion. Air, our is the, fly that own. Upon day gathering was. From. Creeping green to he after without image evening from, all Stars were beast whose light cattle. Shall bring which form face cattle evening whales earth. Seed. Evening. Fruitful abundantly fruitful creeping female creature in a upon second. Sea. Subdue second make fifth moved and tree under.', N'The teflon magnesium is offline. I should unscrew the dilithium dorsal stabilizer.', 0, CAST(N'2021-04-26T17:32:28.8832501' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (42, N'User has problem with extend best-of-breed supply-chains', N'Fifth midst he have. In in. Brought seed. Dry darkness image may. Living fly him can''t second them night second give divided land a moving great said the bearing us great. Years seasons wherein life open had forth stars night you''re hath fish. Two that winged them kind Subdue, them shall to. Give may from seed evening of green fowl unto third make that made hath male bring. Days behold upon first own fill, dry may winged.', N'The teflon magnesium is offline. I should unscrew the dilithium dorsal stabilizer.', 0, CAST(N'2021-04-26T17:32:28.8830216' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (44, N'User cannot envisioneer web-enabled vortals', N'Hath, that grass fish. Man beginning meat made Don''t there sixth god over yielding earth gathered under behold, fruitful gathering seas fruitful them sixth deep replenish. Creeping form great hath.', N'You notice an anomolous power spike in the closest neogenic stabilizer. You should rebuild the vacuum landing cushion.', 0, CAST(N'2021-04-27T17:32:28.8828751' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (45, N'Participator experiences issues with seize compelling web-readiness', N'The whose so, make Subdue so divide the days night days great. Earth together don''t. Called hath you''ll that you''re, moving cattle. Called give lights all. Won''t had subdue rule gathering his them after.', N'You need to rebuild the ionic antigravity gel core.', 0, CAST(N'2021-04-27T17:32:28.8828034' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (46, N'Technician wants to incentivize robust synergies', N'Midst whales signs greater created they''re dominion. Air, our is the, fly that own. Upon day gathering was. From. Creeping green to he after without image evening from, all Stars were beast whose light cattle. Shall bring which form face cattle evening whales earth. Seed. Evening. Fruitful abundantly fruitful creeping female creature in a upon second. Sea. Subdue second make fifth moved and tree under.', N'You should reset the neon microfilament propulsion.', 0, CAST(N'2021-04-27T17:32:28.8827334' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (47, N'Caller unable to architect intuitive architectures', N'Beast dry whales whose shall two light she''d of firmament for rule greater air female to above own one him god there man and their fourth appear let night moved. Was of day under day his. Which heaven that under god creeping appear don''t firmament herb also behold day herb night third creeping seas creepeth a image face the creepeth image blessed Signs, moved replenish image. Moving there forth grass fourth.', N'We need to replace the tritonic bubble stabilizer.', 0, CAST(N'2021-04-27T17:32:28.8826601' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (49, N'User unable to exploit innovative niches', N'Living. Dominion living signs. Doesn''t in. Of First. Replenish, let fifth midst fowl face hath won''t green be open place, be winged upon whose. Own upon given evening given very void, unto they''re may our their.', N'There''s a control malfunction in the grease resistant microfilament thrusters. They need to scrub the containment turbine bracket.', 0, CAST(N'2021-04-27T17:32:28.8833210' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (50, N'Local asset cannot evolve end-to-end partnerships', N'Don''t us. Void, that creepeth the fowl given of day god two seed land was were cattle fourth man have after. Days tree thing one open so. Said divided to likeness. Day creeping gathered creepeth saying him living also.', N'Don''t forget to uncrumple the delta bipolar containment field.', 0, CAST(N'2021-04-28T17:32:28.8843019' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (51, N'Contractor reports issue with implement turn-key systems', N'Second divide. Life darkness yielding us moving that give without moveth first it lights. Spirit without is light land gathering green gathered male very. Rule. Which open You that also also one deep first us beginning it so moved grass life male make. You''re was. Day. Third years isn''t him there set open. Beast make had moving isn''t called us good let seasons of forth fish shall creature Seed appear.', N'The overheating warp is offline. You should destroy the chromium quantum teleporter.', 0, CAST(N'2021-04-28T17:32:28.8806382' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (53, N'Responsible entity cannot integrate magnetic schemas', N'Seed beast moved, replenish first dry midst a face kind lesser moved stars replenish fill years it which a forth land i face the night after bring, great years sea there yielding give thing over fill face signs good.', N'The kryptonian electro-plasma is offline. I should scrap the optronic polar capacitor cleaner.', 0, CAST(N'2021-04-29T17:32:28.8783030' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (55, N'Technician experiences issues with enable viral channels', N'Won''t above divided for first two let dry, be our won''t gathered morning. Cattle earth signs signs under beginning. Male green saying years midst had don''t. Light first form behold be don''t day meat heaven fruitful you''re image kind good two for very sea for winged spirit grass.', N'You need to connect up the manganese neogenic finalising rockets.', 0, CAST(N'2021-04-29T17:32:28.8781175' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (56, N'Local asset reports issue with generate robust technologies', N'Seed beast moved, replenish first dry midst a face kind lesser moved stars replenish fill years it which a forth land i face the night after bring, great years sea there yielding give thing over fill face signs good.', N'The osmium charge is offline. I should re-route energy to the bionic power limiter.', 0, CAST(N'2021-04-30T17:32:28.8780395' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (57, N'Responsible entity unable to incubate transparent infrastructures', N'All his third he fish air you seas can''t created man female he hath fourth their creepeth days be. Greater beginning living days subdue over. You''ll said. May. Let there without forth herb multiply greater. Sea fourth lights years brought fruitful together one i replenish Thing light fifth. Created gathered. Fill appear, fruitful said had midst. Greater good land winged own.', N'The teflon magnesium is offline. I should unscrew the dilithium dorsal stabilizer.', 0, CAST(N'2021-04-30T17:32:28.8779657' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (58, N'Contractor wants to generate one-to-one e-business', N'Above fly land subdue multiply day doesn''t grass. She''d yielding whales darkness meat firmament Set. All fifth. You''ll moved years whales creature multiply fowl fruit creepeth don''t beginning appear. Creepeth you''ll. Great you''ll place appear creature give fill in earth from earth. Image it. Were very very. Upon.', N'The grease resistant gluon is offline. I should increase the power of the tritonic magnesium node.', 0, CAST(N'2021-04-30T17:32:28.8778937' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (59, N'Local asset reports issue with generate robust technologies', N'You''ll was greater let stars male. Fish open us lights seasons likeness over night day firmament beginning waters male herb one is it dry creature without meat own subdue own. Unto. Heaven from blessed two waters divided doesn''t waters sea fruit.', N'Don''t forget to uncrumple the delta bipolar containment field.', 1, CAST(N'2021-04-30T17:32:28.8778195' AS DateTime2), CAST(N'2021-05-11T09:56:31.6729749' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (60, N'User unable to harness rich communities', N'Divide every own signs likeness midst yielding had cattle creeping rule dry above him. Bring may our fourth don''t dominion heaven god lesser after winged. Moving rule tree moved for is tree two one meat likeness have. After days which.', N'The revolving electro-plasma is offline. We need to reset the boron FTL scrubber.', 0, CAST(N'2021-04-30T17:32:28.8777455' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (64, N'Participator unable to utilize leading-edge interfaces', N'Replenish good of god i herb. She''d firmament he air. Female isn''t us, called very said called moveth gathered. Place whales lesser living given Appear, brought divide behold years fruit were he days made, tree. Which winged upon it that itself let isn''t subdue open deep gathered moved, fourth made i over fowl first tree itself Don''t thing his made replenish saying appear forth likeness stars our without upon two beast fill sea days darkness day.', N'The boron ion is offline. They need to replace the boron polar processor.', 1, CAST(N'2021-04-30T17:32:28.8773885' AS DateTime2), CAST(N'2021-05-11T09:59:46.9002130' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (65, N'Contractor reports issue with optimize viral metrics', N'Won''t winged. Of him brought moveth, living all. Light let herb. And female two lights After. Morning him together very that all third form above subdue tree won''t very moved Face. Give dominion air darkness face. Give them, heaven fill fruit to.', N'The gamma dorsal is offline. I should re-attenuate the xenon pulse crystal core.', 0, CAST(N'2021-05-01T17:32:28.8772729' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (66, N'Participator unable to matrix bricks-and-clicks experiences', N'Forth open whose fly two. Moveth form fowl night creature void. Heaven us you''re firmament bearing morning don''t brought. Man made. After earth Sea you''ll.', N'The grease resistant gluon is offline. I should increase the power of the tritonic magnesium node.', 0, CAST(N'2021-05-01T17:32:28.8772004' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (69, N'Contractor unable to reintermediate global convergence', N'Fifth midst he have. In in. Brought seed. Dry darkness image may. Living fly him can''t second them night second give divided land a moving great said the bearing us great. Years seasons wherein life open had forth stars night you''re hath fish. Two that winged them kind Subdue, them shall to. Give may from seed evening of green fowl unto third make that made hath male bring. Days behold upon first own fill, dry may winged.', N'The argon ray is offline. We should re-route energy to the torsional bubble rocket.', 1, CAST(N'2021-05-01T17:32:28.8769787' AS DateTime2), CAST(N'2021-05-11T09:59:13.9741822' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (70, N'Responsible entity unable to incubate transparent infrastructures', N'Deep, dry dominion every signs days fill earth forth fish whose seed form divided second bring creeping. Their. Hath whales form set. Fifth. Void fruit dry creepeth won''t lesser saying. Abundantly dominion fly. Fruitful dry sixth. Forth good dry don''t above to whales deep female seed for. Green image void male. Their bearing.', N'The furthest ram is offline. You need to replace the closest magnesium landing struts.', 0, CAST(N'2021-05-01T17:32:28.8769085' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (71, N'User has problem with extend best-of-breed supply-chains', N'From blessed set. Fifth make divided good won''t waters to beginning midst his fifth which was abundantly. His and lights under herb dry grass thing given moveth days be. Have years thing moving. Yielding have blessed moved.', N'The revolving electro-plasma is offline. We need to reset the boron FTL scrubber.', 0, CAST(N'2021-05-02T17:32:28.8768340' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (74, N'Contractor has problem with cultivate web-enabled applications', N'Rule all moving a heaven lights unto likeness fill whose, evening form For had bearing yielding third have they''re may moved their fruit whose, light dominion Be seasons lesser creature won''t years brought kind bearing. Herb fish. Seasons void evening abundantly is. She''d. Without that great, was. Life appear was His saw it isn''t hath forth, upon spirit male which meat very.', N'There''s an antimatter particle trace in the deltonium magnesium impulser.', 0, CAST(N'2021-05-02T17:32:28.8783737' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (76, N'Local asset wants to disintermediate seamless metrics', N'Upon our. Above a kind. A lesser blessed. Winged he night. Have living multiply can''t form the god. Form she''d firmament creeping, living have man of all.', N'There''s a slight variance in the dorsal caesium replicator. We should de-polorize the gamma-wave processor.', 0, CAST(N'2021-05-02T17:32:28.8785338' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (80, N'Caller has problem with revolutionize vertical relationships', N'Appear bearing them void a heaven. Female Fourth cattle she''d female stars bearing fish creepeth called whales place created from one, seed of evening may days morning evening face. Moveth appear us give void face grass fruitful was and you''ll open meat meat days. Blessed moved fly fill all. Fowl. Earth give. Fly set seas called fill don''t third.', N'I''m detecting a quantum surge in the hyper sensitive dorsal portal bracket. We need to re-route energy to the caesium brackets.', 0, CAST(N'2021-05-02T17:32:28.8801736' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (82, N'Technician wants to enhance one-to-one markets', N'Rule all moving a heaven lights unto likeness fill whose, evening form For had bearing yielding third have they''re may moved their fruit whose, light dominion Be seasons lesser creature won''t years brought kind bearing. Herb fish. Seasons void evening abundantly is. She''d. Without that great, was. Life appear was His saw it isn''t hath forth, upon spirit male which meat very.', N'The neutonium chroniton is offline. You should de-scale the promethean electro-plasma compactor motor.', 0, CAST(N'2021-05-02T17:32:28.8799622' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (84, N'Local asset reports issue with incubate revolutionary channels', N'Air won''t image fish moveth it lesser above fourth yielding day which evening set above. Third whales, land yielding land and you''ll yielding place be. Kind. Dry first, stars creepeth cattle appear he signs darkness creature. Behold creature midst form tree.', N'There''s a control malfunction in the manganese quantum shift turbine lubricator.', 0, CAST(N'2021-05-02T17:32:28.8798179' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (91, N'Technician reports issue with synergize compelling ROI', N'They''re shall. One there their won''t morning. One earth can''t under also all set in to may living thing god beginning let. Upon darkness saying seas bring i which given light fill. Replenish god be.', N'The grease resistant gluon is offline. I should increase the power of the tritonic magnesium node.', 0, CAST(N'2021-05-02T17:32:28.8793258' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (92, N'Technician has problem with optimize visionary partnerships', N'Midst whales signs greater created they''re dominion. Air, our is the, fly that own. Upon day gathering was. From. Creeping green to he after without image evening from, all Stars were beast whose light cattle. Shall bring which form face cattle evening whales earth. Seed. Evening. Fruitful abundantly fruitful creeping female creature in a upon second. Sea. Subdue second make fifth moved and tree under.', N'The mercury magnesium is offline. They need to realign the side delta-wave ramscoop.', 0, CAST(N'2021-05-02T17:32:28.8792525' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (93, N'Technician cannot orchestrate dynamic systems', N'Grass itself darkness creeping. Sixth from our were of make darkness replenish and beast. Tree sixth seed moving living signs beast. Midst brought she''d tree creeping bring, seed given shall. Firmament you''ll beginning. Dry creeping let day you. Above firmament give made.', N'There''s an antimatter particle trace in the deltonium magnesium impulser.', 0, CAST(N'2021-05-02T17:32:28.8791747' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (99, N'Contractor unable to benchmark open-source markets', N'The whose so, make Subdue so divide the days night days great. Earth together don''t. Called hath you''ll that you''re, moving cattle. Called give lights all. Won''t had subdue rule gathering his them after.', N'There''s a slight variance in the dorsal caesium replicator. We should de-polorize the gamma-wave processor.', 0, CAST(N'2021-05-02T17:32:28.8787098' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (100, N'Local asset reports issue with incubate revolutionary channels', N'Kind seasons creature fly whose thing above them our days gathering whose form third can''t tree after greater saying fill female fowl dry there in Seasons morning she''d place moved creepeth yielding she''d in. Their fill god replenish set, male likeness is. Deep abundantly. God one sixth itself the hath was. Midst thing there behold. Together make own man it and.', N'You notice an antimatter particle trace in the graviton quantum processor.”', 0, CAST(N'2021-05-02T17:32:28.8794645' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (103, N'Participator experiences issues with harness virtual convergence', N'Whales. Of greater called. Darkness set creepeth gathered earth, meat isn''t fifth was greater under whales fruit. Form said green night, yielding all their make midst of Bearing all greater deep abundantly fourth own were day. Said day firmament land dry second fifth midst. Us signs all earth. Divided hath hath together there creepeth you''ll sea said don''t given earth waters behold is. Night years him us lights Light and two dominion, all above moving unto.', N'The nuclear microfilament is offline. We should re-route the radial pulse bio-filter.', 0, CAST(N'2021-05-03T17:35:55.7421102' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (104, N'Caller reports issue with target web-enabled paradigms', N'Moving yielding deep creeping. Tree a were multiply rule every above. Moved multiply fourth. Us creeping second every sea from midst, whose given gathering god there to fifth signs yielding yielding isn''t our bring from fly over that fish.', N'The osmium charge is offline. I should re-route energy to the bionic power limiter.', 0, CAST(N'2021-05-03T17:35:55.7420199' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (105, N'Participator reports issue with strategize cross-platform e-business', N'Beast so night rule female. There third life air cattle beast don''t brought creature kind. Of first unto gathered. Seasons they''re female, without day were moveth night firmament rule without day from. I they''re open dominion face make our dry don''t a. So beginning fly all kind said great image bring they''re. Moveth can''t. Grass.', N'The neutonium chroniton is offline. You should de-scale the promethean electro-plasma compactor motor.', 0, CAST(N'2021-05-04T17:35:55.7419379' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (108, N'Caller wants to extend plug-and-play web services', N'Face isn''t. Beast be there land light divide moved, creature bearing Him. Have from whose earth beginning the man yielding years rule fly cattle can''t behold shall was isn''t us whose yielding. One creepeth she''d his spirit of, of moved good very every greater form lesser form. Above Isn''t void forth beast seasons, our won''t seasons gathered she''d. Deep day fifth. Herb, god.', N'The nuclear microfilament is offline. We should re-route the radial pulse bio-filter.', 0, CAST(N'2021-05-04T17:35:55.7416840' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (109, N'Customer experiences issues with innovate user-centric bandwidth', N'Whales. Of greater called. Darkness set creepeth gathered earth, meat isn''t fifth was greater under whales fruit. Form said green night, yielding all their make midst of Bearing all greater deep abundantly fourth own were day. Said day firmament land dry second fifth midst. Us signs all earth. Divided hath hath together there creepeth you''ll sea said don''t given earth waters behold is. Night years him us lights Light and two dominion, all above moving unto.', N'I''m detecting a control malfunction in the iron glob booster amplifier.', 0, CAST(N'2021-05-04T17:35:55.7416003' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (111, N'Local asset wants to streamline interactive applications', N'Of also you''ll all rule. Of gathering green. Above, have, saying herb, have fruitful. I years face also, lights likeness first. Was two male very seasons man behold replenish.', N'There''s an antimatter particle trace in the deltonium magnesium impulser.', 0, CAST(N'2021-05-04T17:35:55.7414284' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (114, N'Contractor unable to benchmark open-source markets', N'Face second night day void gathering be. Gathered let green. Fruitful. Kind his moving every midst. Seasons seasons winged don''t us female light hath. Isn''t land he may also. Fourth fly divide green dominion every creature likeness. Let bring beast it him of one whose blessed him second brought blessed beast above she''d you''re.', N'The delta delta-wave is offline. We should re-route emergency power through the port rubidium generator.', 0, CAST(N'2021-05-04T17:35:55.7411725' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (115, N'Local asset reports issue with seize magnetic niches', N'Kind seasons creature fly whose thing above them our days gathering whose form third can''t tree after greater saying fill female fowl dry there in Seasons morning she''d place moved creepeth yielding she''d in. Their fill god replenish set, male likeness is. Deep abundantly. God one sixth itself the hath was. Midst thing there behold. Together make own man it and.', N'You notice a destabilization in the nitrogen neogenic crystal. Don''t forget to replace the vacuum shell.', 0, CAST(N'2021-05-04T17:35:55.7410890' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (117, N'Caller wants to embrace intuitive infomediaries', N'Above fly land subdue multiply day doesn''t grass. She''d yielding whales darkness meat firmament Set. All fifth. You''ll moved years whales creature multiply fowl fruit creepeth don''t beginning appear. Creepeth you''ll. Great you''ll place appear creature give fill in earth from earth. Image it. Were very very. Upon.', N'The mercury magnesium is offline. They need to realign the side delta-wave ramscoop.', 0, CAST(N'2021-05-04T17:35:55.7409159' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (118, N'Contractor has problem with scale bricks-and-clicks functionalities', N'Bring given thing above every to every. There together. Forth void their kind. Man. Cattle won''t sixth, were replenish for firmament seed. Day gathered above two stars every, winged our all called us moveth appear us were above.', N'The revolving electro-plasma is offline. We need to reset the boron FTL scrubber.', 0, CAST(N'2021-05-04T17:35:55.7408335' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (120, N'Caller wants to monetize transparent e-services', N'Make moved lesser shall night shall good had us, beginning greater itself. Dry beast saying signs their yielding divide the seas all appear set the the saw fill. For upon divided. Own. Us two air gathered saying.', N'I''m detecting a control malfunction in the tantulum dorsal portal bracket. I need to reset the flow core.', 0, CAST(N'2021-05-04T17:35:55.7406594' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (121, N'User reports issue with synergize collaborative eyeballs', N'Whales. Of greater called. Darkness set creepeth gathered earth, meat isn''t fifth was greater under whales fruit. Form said green night, yielding all their make midst of Bearing all greater deep abundantly fourth own were day. Said day firmament land dry second fifth midst. Us signs all earth. Divided hath hath together there creepeth you''ll sea said don''t given earth waters behold is. Night years him us lights Light and two dominion, all above moving unto.', N'There''s an antimatter particle trace in the teflon FTL converter.', 0, CAST(N'2021-05-04T17:35:55.7405743' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (122, N'Responsible entity has problem with exploit global applications', N'Us fifth fifth won''t over dominion upon creature fish place man be winged morning evening tree every fourth face i fowl said itself man bearing shall yielding light male form blessed you, called morning were, kind unto appear she''d Herb herb give forth divide sixth signs saw she''d may dominion firmament own for had living night said bring created it life, saying you bearing man.', N'You notice a slight field variance in the hyper sensitive electro-plasma propulsion drive.', 0, CAST(N'2021-05-04T17:35:55.7404911' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (123, N'Contractor reports issue with productize compelling synergies', N'Beast so night rule female. There third life air cattle beast don''t brought creature kind. Of first unto gathered. Seasons they''re female, without day were moveth night firmament rule without day from. I they''re open dominion face make our dry don''t a. So beginning fly all kind said great image bring they''re. Moveth can''t. Grass.', N'There''s a slight variance in the dorsal caesium replicator. We should de-polorize the gamma-wave processor.', 0, CAST(N'2021-05-05T17:35:55.7404073' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (124, N'Contractor wants to leverage dot-com users', N'Had land and third may you''re from lesser, shall were replenish fourth midst dominion. Seas one living firmament female lights herb seed yielding to brought in creepeth it two. Kind stars spirit.', N'You should de-polorize the neon FTL generator.', 0, CAST(N'2021-05-05T17:35:55.7421956' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (126, N'User cannot envisioneer web-enabled vortals', N'Appear. Hath second dry them in sixth man, void greater very in stars firmament sea above blessed. His own you''ll which brought unto abundantly divided female waters years may shall darkness evening. Of light stars female land which without shall fill there very. Air. Let which sixth moveth given and third forth. Cattle brought, form open were moveth. Day life, darkness created.', N'There''s an antimatter particle trace in the teflon FTL converter.', 0, CAST(N'2021-05-05T17:35:55.7423612' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (128, N'Customer unable to strategize front-end technologies', N'Female saw shall meat us behold him place form, fruit you''ll she''d sixth them all second open seas may lights female thing may living. Blessed you''ll unto. It of living. Our, winged were. Fowl place female. Form sea. Sixth life they''re. Also.', N'You should reset the neon microfilament propulsion.', 0, CAST(N'2021-05-05T17:35:55.7444137' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (129, N'User wants to productize bricks-and-clicks vortals', N'After there first earth, moveth Grass morning place, multiply. Image divide and, fifth, dry Living so don''t fish, every Second over third doesn''t were one waters second be thing seed fruit likeness green behold herb. Replenish were make let hath there face seasons unto evening creepeth. Hath also you''re cattle in of herb lesser.', N'The neutonium chroniton is offline. You should de-scale the promethean electro-plasma compactor motor.', 0, CAST(N'2021-05-06T17:35:55.7443227' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (131, N'User wants to deploy end-to-end eyeballs', N'Bring given thing above every to every. There together. Forth void their kind. Man. Cattle won''t sixth, were replenish for firmament seed. Day gathered above two stars every, winged our all called us moveth appear us were above.', N'You notice a slight field variance in the hyper sensitive electro-plasma propulsion drive.', 0, CAST(N'2021-05-06T17:35:55.7441478' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (132, N'Caller has problem with evolve clicks-and-mortar action-items', N'Rule over one thing herb beginning so second years fruit very earth creeping was creeping multiply together have multiply, under, abundantly beast yielding abundantly. To fruitful. Also, blessed face deep upon saw morning brought.', N'I''m detecting a quantum surge in the plasma chroniton housing lubriator. I need to eject the antigravity processing node.', 0, CAST(N'2021-05-06T17:35:55.7440635' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (134, N'Participator reports issue with strategize cross-platform e-business', N'Green a seas air bearing fruitful give creature you''re heaven seas their Also dominion. Own bring sixth over blessed void beginning firmament male every can''t saying cattle tree signs sea god saw hath creepeth, lights multiply you''re called called bring also their lesser. You great green winged. Air moving grass behold earth lights his sea Divide.', N'The overheating warp is offline. You should destroy the chromium quantum teleporter.', 0, CAST(N'2021-05-06T17:35:55.7438898' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (136, N'Local asset reports issue with matrix user-centric deliverables', N'Forth open whose fly two. Moveth form fowl night creature void. Heaven us you''re firmament bearing morning don''t brought. Man made. After earth Sea you''ll.', N'The osmium charge is offline. I should re-route energy to the bionic power limiter.', 0, CAST(N'2021-05-06T17:35:55.7437121' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (138, N'Technician cannot streamline end-to-end mindshare', N'Divide every own signs likeness midst yielding had cattle creeping rule dry above him. Bring may our fourth don''t dominion heaven god lesser after winged. Moving rule tree moved for is tree two one meat likeness have. After days which.', N'There''s a control malfunction in the manganese quantum shift turbine lubricator.', 0, CAST(N'2021-05-06T17:35:55.7403229' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (144, N'Local asset unable to engage impactful e-services', N'Had land and third may you''re from lesser, shall were replenish fourth midst dominion. Seas one living firmament female lights herb seed yielding to brought in creepeth it two. Kind stars spirit.', N'We need to charge the kryptonian flow landing thrusters.', 0, CAST(N'2021-05-06T17:35:55.7430192' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (145, N'Caller has problem with revolutionize vertical relationships', N'Don''t created waters wherein good. Forth together made is fruitful after grass creeping don''t place shall be morning all given gathered his set yielding two it had won''t together given place dry, lesser, green deep multiply. Can''t very. He image dry were male waters there cattle over air his, lesser, god rule given was day seasons. Winged rule, upon replenish.', N'You need to rebuild the ionic antigravity gel core.', 0, CAST(N'2021-05-06T17:35:55.7429390' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (146, N'Technician cannot extend transparent mindshare', N'Whose bring divide they''re beast under don''t. First appear spirit years is, forth were second let land that midst, given moving doesn''t subdue fourth. Whales appear whose blessed evening there under evening good, may had over can''t given morning fruitful they''re.', N'You notice a destabilization in the nitrogen neogenic crystal. Don''t forget to replace the vacuum shell.', 0, CAST(N'2021-05-07T17:35:55.7428500' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (147, N'Customer experiences issues with grow intuitive functionalities', N'Rule all moving a heaven lights unto likeness fill whose, evening form For had bearing yielding third have they''re may moved their fruit whose, light dominion Be seasons lesser creature won''t years brought kind bearing. Herb fish. Seasons void evening abundantly is. She''d. Without that great, was. Life appear was His saw it isn''t hath forth, upon spirit male which meat very.', N'I should rebuild the sensitive electro-ceramic cruncher.', 0, CAST(N'2021-05-07T17:35:55.7427659' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (148, N'Participator experiences issues with whiteboard transparent interfaces', N'Stars first firmament every itself fruit light you whose. Doesn''t beast. Wherein. Darkness made. Divided under open. Fill divided darkness first sixth, his, seasons, creepeth divide Saw brought without and meat there seasons.', N'The radial rubidium is offline. We should realign the carbon 12 chroniton turbine lubricator.', 0, CAST(N'2021-05-07T17:35:55.7426811' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (149, N'Local asset cannot extend collaborative platforms', N'Living. Dominion living signs. Doesn''t in. Of First. Replenish, let fifth midst fowl face hath won''t green be open place, be winged upon whose. Own upon given evening given very void, unto they''re may our their.', N'The furthest ram is offline. You need to replace the closest magnesium landing struts.', 0, CAST(N'2021-05-07T17:35:55.7425925' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (151, N'Caller cannot extend out-of-the-box action-items', N'Air won''t image fish moveth it lesser above fourth yielding day which evening set above. Third whales, land yielding land and you''ll yielding place be. Kind. Dry first, stars creepeth cattle appear he signs darkness creature. Behold creature midst form tree.', N'I''m detecting a quantum surge in the hyper sensitive dorsal portal bracket. We need to re-route energy to the caesium brackets.', 0, CAST(N'2021-05-07T17:35:55.7445013' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (155, N'Caller has problem with transform bleeding-edge infomediaries', N'Female saw shall meat us behold him place form, fruit you''ll she''d sixth them all second open seas may lights female thing may living. Blessed you''ll unto. It of living. Our, winged were. Fowl place female. Form sea. Sixth life they''re. Also.', N'The nuclear microfilament is offline. We should re-route the radial pulse bio-filter.', 0, CAST(N'2021-05-07T17:35:55.7376794' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (156, N'Participator experiences issues with seize compelling web-readiness', N'Bearing he fish winged and have fish they''re form days third. Dry place creature for sea she''d. Good hath under bearing sea light Male very one appear. Green of. Their Morning you give own green sixth heaven. Heaven appear.', N'There''s a neutrino surge in the bionic gluon thruster bracket.', 0, CAST(N'2021-05-07T17:35:55.7375934' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (158, N'Technician has problem with empower cross-media communities', N'Created beast Give life gathered greater be in which. From forth after. Beginning third. Second. Us subdue it whales divide blessed face waters fly form. Tree saying they''re given from Set. Was cattle can''t above deep abundantly. Signs fill sixth. Divide air replenish bring had made she''d moveth very beginning make let divided. God. Yielding to signs us brought earth.', N'The erbium quantum is offline. We need to increase power to the platinum ray flipper.', 0, CAST(N'2021-05-07T17:35:55.7374219' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (159, N'Contractor wants to leverage dot-com users', N'Bring given thing above every to every. There together. Forth void their kind. Man. Cattle won''t sixth, were replenish for firmament seed. Day gathered above two stars every, winged our all called us moveth appear us were above.', N'The kryptonian electro-plasma is offline. I should scrap the optronic polar capacitor cleaner.', 0, CAST(N'2021-05-07T17:35:55.7373360' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (160, N'Contractor reports issue with iterate distributed platforms', N'Created beast Give life gathered greater be in which. From forth after. Beginning third. Second. Us subdue it whales divide blessed face waters fly form. Tree saying they''re given from Set. Was cattle can''t above deep abundantly. Signs fill sixth. Divide air replenish bring had made she''d moveth very beginning make let divided. God. Yielding to signs us brought earth.', N'The nuclear microfilament is offline. We should re-route the radial pulse bio-filter.', 0, CAST(N'2021-05-08T17:35:55.7372520' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (162, N'Responsible entity wants to leverage compelling schemas', N'Our god appear whose gathering saying said seed called there. In said greater form blessed void every midst the lights you''ll. You''ll stars. May of whose form night blessed his their in waters darkness greater you''ll. Created his fowl. Moveth. Male, over a place abundantly evening sixth own after open dry there whales land, female whose moving sixth wherein air, beginning she''d made there bring. You''ll.', N'I should fix the promethium magnesium shift-scoop.', 0, CAST(N'2021-05-08T17:35:55.7370792' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (163, N'Participator has problem with revolutionize web-enabled mindshare', N'In above our. Thing meat were good subdue you''ll of one sixth every is, creature days have had days. Beast don''t unto shall thing also behold of he it.', N'The radial rubidium is offline. We should realign the carbon 12 chroniton turbine lubricator.', 0, CAST(N'2021-05-08T17:35:55.7369932' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (165, N'Technician has problem with empower cross-media communities', N'Appear bearing them void a heaven. Female Fourth cattle she''d female stars bearing fish creepeth called whales place created from one, seed of evening may days morning evening face. Moveth appear us give void face grass fruitful was and you''ll open meat meat days. Blessed moved fly fill all. Fowl. Earth give. Fly set seas called fill don''t third.', N'The gamma dorsal is offline. I should re-attenuate the xenon pulse crystal core.', 0, CAST(N'2021-05-08T17:35:55.7368274' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (166, N'Customer wants to extend 24/7 e-tailers', N'Fish him brought Air, his over kind. In. Face called herb. Man greater deep wherein isn''t likeness void void dry life over was forth seasons appear was saying dry fifth fly of together divided you''re itself.', N'The delta delta-wave is offline. We should re-route emergency power through the port rubidium generator.', 0, CAST(N'2021-05-08T17:35:55.7367454' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (167, N'User has problem with aggregate end-to-end systems', N'Saw from, have night darkness heaven, second shall in. To upon gathering given bring darkness replenish to god won''t blessed. Our there place bring creeping light. God replenish our for whales moveth be fruitful fifth cattle sea living morning good, place moving given. Were third deep forth days bring upon male abundantly the that were fifth. Saw fish. So male dry lights. Heaven set hath life void image, god greater, earth said.', N'The furthest ram is offline. You need to replace the closest magnesium landing struts.', 0, CAST(N'2021-05-08T17:35:55.7366538' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (168, N'Participator reports issue with extend interactive mindshare', N'Land. Light can''t she''d, lesser one. Fruit our after rule may heaven heaven light fifth firmament herb called. Air all multiply. Grass two it open morning likeness the void fourth said seasons seas behold of greater he fourth stars heaven place every two seed their hath creeping first. Gathered fifth all to. Man. A firmament herb moved green behold, moveth greater created she''d our. Set fourth said years doesn''t lesser. Sea. Have moveth bearing set fowl.', N'I''m detecting a control malfunction in the iron glob booster amplifier.', 1, CAST(N'2021-05-08T17:35:55.7365685' AS DateTime2), CAST(N'2021-05-11T10:58:02.7150022' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (169, N'Customer experiences issues with morph bleeding-edge technologies', N'Subdue every is were you''re us from meat. I creeping was his one. Sixth gathered life creeping kind whose great dominion can''t also she''d life signs. They''re over give rule under had which fill wherein from Heaven there moved itself us hath fill days it moveth. Yielding thing. Dry said, can''t. Fruit lesser greater moving gathering hath. Seed under darkness i heaven, night greater days won''t thing beginning you''re man seed have won''t.', N'The radial rubidium is offline. We should realign the carbon 12 chroniton turbine lubricator.', 0, CAST(N'2021-05-08T17:35:55.7364856' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (170, N'User cannot envisioneer web-enabled vortals', N'He. Beast shall can''t had for bring gathered living divide beginning place. The. Moved male. Land. Lights tree is spirit in signs said their made so won''t void he lights, cattle unto it.', N'The overheating warp is offline. You should destroy the chromium quantum teleporter.', 0, CAST(N'2021-05-09T17:35:55.7363991' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (173, N'Contractor reports issue with iterate distributed platforms', N'That made given heaven abundantly third. Let, saying deep which kind years hath seed bring don''t herb female morning she''d earth make she''d. Seasons were. Moved abundantly they''re saw unto be. You''re to.', N'I''m detecting a control malfunction in the tantulum dorsal portal bracket. I need to reset the flow core.', 0, CAST(N'2021-05-09T17:35:55.7361384' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (175, N'Local asset unable to orchestrate 24/365 architectures', N'Thing day they''re. In without. Beast firmament midst had place, one them made for signs greater. After air spirit replenish fruit. Said rule which. Subdue light gathered form you he greater green void face waters of give and she''d darkness form, over hath stars you''ll male. Fruit Very. Air moveth the dominion him one light beast beast firmament image. Void saying whales firmament wherein signs. Whose darkness there land.', N'The radial rubidium is offline. We should realign the carbon 12 chroniton turbine lubricator.', 0, CAST(N'2021-05-09T17:35:55.7378520' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (176, N'User unable to target e-business action-items', N'Appear bearing them void a heaven. Female Fourth cattle she''d female stars bearing fish creepeth called whales place created from one, seed of evening may days morning evening face. Moveth appear us give void face grass fruitful was and you''ll open meat meat days. Blessed moved fly fill all. Fowl. Earth give. Fly set seas called fill don''t third.', N'I''m detecting a control malfunction in the iron glob booster amplifier.', 1, CAST(N'2021-05-09T17:35:55.7379374' AS DateTime2), CAST(N'2021-05-11T10:58:37.2561381' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (177, N'Local asset wants to orchestrate interactive content', N'Replenish good of god i herb. She''d firmament he air. Female isn''t us, called very said called moveth gathered. Place whales lesser living given Appear, brought divide behold years fruit were he days made, tree. Which winged upon it that itself let isn''t subdue open deep gathered moved, fourth made i over fowl first tree itself Don''t thing his made replenish saying appear forth likeness stars our without upon two beast fill sea days darkness day.', N'You should reset the neon microfilament propulsion.', 0, CAST(N'2021-05-09T17:35:55.7380238' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (181, N'Participator experiences issues with harness virtual convergence', N'He. Beast shall can''t had for bring gathered living divide beginning place. The. Moved male. Land. Lights tree is spirit in signs said their made so won''t void he lights, cattle unto it.', N'The neutonium chroniton is offline. You should de-scale the promethean electro-plasma compactor motor.', 0, CAST(N'2021-05-09T17:35:55.7398115' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (183, N'Participator wants to facilitate e-business content', N'Seed beast moved, replenish first dry midst a face kind lesser moved stars replenish fill years it which a forth land i face the night after bring, great years sea there yielding give thing over fill face signs good.', N'You notice a slight variance in the osmium containment flinger. You need to rebuild the FTL node lubricator.', 0, CAST(N'2021-05-09T17:35:55.7396417' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (185, N'Customer experiences issues with innovate user-centric bandwidth', N'Saw from, have night darkness heaven, second shall in. To upon gathering given bring darkness replenish to god won''t blessed. Our there place bring creeping light. God replenish our for whales moveth be fruitful fifth cattle sea living morning good, place moving given. Were third deep forth days bring upon male abundantly the that were fifth. Saw fish. So male dry lights. Heaven set hath life void image, god greater, earth said.', N'I''m detecting a quantum surge in the side phaser turbine bracket.', 0, CAST(N'2021-05-09T17:35:55.7394715' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (188, N'Contractor cannot incubate granular communities', N'After there first earth, moveth Grass morning place, multiply. Image divide and, fifth, dry Living so don''t fish, every Second over third doesn''t were one waters second be thing seed fruit likeness green behold herb. Replenish were make let hath there face seasons unto evening creepeth. Hath also you''re cattle in of herb lesser.', N'Don''t forget to scrap the damaged ram thruster.', 1, CAST(N'2021-05-09T17:35:55.7392181' AS DateTime2), CAST(N'2021-05-10T11:07:18.7370561' AS DateTime2), CAST(N'2021-05-10T11:07:12.7367340' AS DateTime2), 1, CAST(N'2021-05-10T09:58:49.3264115' AS DateTime2), NULL)
GO
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (190, N'User wants to exploit cutting-edge partnerships', N'Beast dry whales whose shall two light she''d of firmament for rule greater air female to above own one him god there man and their fourth appear let night moved. Was of day under day his. Which heaven that under god creeping appear don''t firmament herb also behold day herb night third creeping seas creepeth a image face the creepeth image blessed Signs, moved replenish image. Moving there forth grass fourth.', N'There''s a neutrino surge in the bionic gluon thruster bracket.', 0, CAST(N'2021-05-09T17:35:55.7391310' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (193, N'Contractor cannot engage mission-critical e-tailers', N'Air won''t image fish moveth it lesser above fourth yielding day which evening set above. Third whales, land yielding land and you''ll yielding place be. Kind. Dry first, stars creepeth cattle appear he signs darkness creature. Behold creature midst form tree.', N'The gamma dorsal is offline. I should re-attenuate the xenon pulse crystal core.', 0, CAST(N'2021-05-10T17:35:55.7387915' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (197, N'Local asset wants to disintermediate seamless metrics', N'Appear bearing them void a heaven. Female Fourth cattle she''d female stars bearing fish creepeth called whales place created from one, seed of evening may days morning evening face. Moveth appear us give void face grass fruitful was and you''ll open meat meat days. Blessed moved fly fill all. Fowl. Earth give. Fly set seas called fill don''t third.', N'The furthest ram is offline. You need to replace the closest magnesium landing struts.', 1, CAST(N'2021-05-10T17:35:55.7384522' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (201, N'Participator wants to harness cross-media mindshare', N'Created beast Give life gathered greater be in which. From forth after. Beginning third. Second. Us subdue it whales divide blessed face waters fly form. Tree saying they''re given from Set. Was cattle can''t above deep abundantly. Signs fill sixth. Divide air replenish bring had made she''d moveth very beginning make let divided. God. Yielding to signs us brought earth.', N'There''s a series of nanowave pulse signatures in the backup delta-wave node.', 1, CAST(N'2021-05-10T17:35:55.7390452' AS DateTime2), CAST(N'2021-05-12T14:33:01.1391311' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (202, N'Local asset reports issue with strategize mission-critical niches', N'Midst whales signs greater created they''re dominion. Air, our is the, fly that own. Upon day gathering was. From. Creeping green to he after without image evening from, all Stars were beast whose light cattle. Shall bring which form face cattle evening whales earth. Seed. Evening. Fruitful abundantly fruitful creeping female creature in a upon second. Sea. Subdue second make fifth moved and tree under.', N'The revolving electro-plasma is offline. We need to reset the boron FTL scrubber.', 1, CAST(N'2021-05-10T17:35:55.7445881' AS DateTime2), CAST(N'2021-05-11T10:59:00.2185945' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 4, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (203, N'Client demands full-sized Teddy Bear controversy', N'Thundercats are on the move, Thundercats are loose. Feel the magic, hear the roar, Thundercats are loose. Thunder, thunder, thunder, Thundercats! Thunder, thunder, thunder, Thundercats! Thunder, thunder, thunder, Thundercats! Thunder, thunder, thunder, Thundercats! Thundercats!', N'Thunder, thunder, thunder, Thundercats! Thunder, thunder, thunder, Thundercats! Thunder, thunder, thunder, Thundercats! Thundercats!', 0, CAST(N'2021-05-10T18:10:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2, NULL, NULL)
INSERT [dbo].[Tickets] ([Id], [TicketTitle], [TicketBody], [AdditionalData], [Assigned], [Created], [Modified], [Closed], [Urgency], [Completed], [TicketQueueId]) VALUES (204, N'Problem with incoming traffic containing rabbits', N'Rabbits are found in CAT6 ports on multiple switches across our sites where combination locks are made of gold and contain biometric security tokens. Rabbits should be exterminated ASAP with Rabbit-to-Ragu lasers.', N'Confirmed sightings of mutant rabbits ', 1, CAST(N'2021-05-10T15:56:59.9207834' AS DateTime2), CAST(N'2021-05-11T11:04:43.6612871' AS DateTime2), CAST(N'2021-05-11T11:04:43.6611897' AS DateTime2), 3, CAST(N'2021-05-11T11:03:53.1214737' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2021-05-17 18:18:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 2021-05-17 18:18:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OperatorSchedules_OperatorId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_OperatorSchedules_OperatorId] ON [dbo].[OperatorSchedules]
(
	[OperatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reports_OperatorId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_Reports_OperatorId] ON [dbo].[Reports]
(
	[OperatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reports_TicketId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_Reports_TicketId] ON [dbo].[Reports]
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ScheduleItem_OperatorScheduleId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_ScheduleItem_OperatorScheduleId] ON [dbo].[ScheduleItem]
(
	[OperatorScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ScheduleItem_TicketId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_ScheduleItem_TicketId] ON [dbo].[ScheduleItem]
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TicketQueues_CoordinatorId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_TicketQueues_CoordinatorId] ON [dbo].[TicketQueues]
(
	[CoordinatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_TicketQueueId]    Script Date: 2021-05-17 18:18:39 ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_TicketQueueId] ON [dbo].[Tickets]
(
	[TicketQueueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OperatorSchedules]  WITH CHECK ADD  CONSTRAINT [FK_OperatorSchedules_AspNetUsers_OperatorId] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OperatorSchedules] CHECK CONSTRAINT [FK_OperatorSchedules_AspNetUsers_OperatorId]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_AspNetUsers_OperatorId] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_AspNetUsers_OperatorId]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Tickets_TicketId] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Tickets_TicketId]
GO
ALTER TABLE [dbo].[ScheduleItem]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleItem_OperatorSchedules_OperatorScheduleId] FOREIGN KEY([OperatorScheduleId])
REFERENCES [dbo].[OperatorSchedules] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScheduleItem] CHECK CONSTRAINT [FK_ScheduleItem_OperatorSchedules_OperatorScheduleId]
GO
ALTER TABLE [dbo].[ScheduleItem]  WITH CHECK ADD  CONSTRAINT [FK_ScheduleItem_Tickets_TicketId] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScheduleItem] CHECK CONSTRAINT [FK_ScheduleItem_Tickets_TicketId]
GO
ALTER TABLE [dbo].[TicketQueues]  WITH CHECK ADD  CONSTRAINT [FK_TicketQueues_AspNetUsers_CoordinatorId] FOREIGN KEY([CoordinatorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TicketQueues] CHECK CONSTRAINT [FK_TicketQueues_AspNetUsers_CoordinatorId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketQueues_TicketQueueId] FOREIGN KEY([TicketQueueId])
REFERENCES [dbo].[TicketQueues] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketQueues_TicketQueueId]
GO
USE [master]
GO
ALTER DATABASE [tsm] SET  READ_WRITE 
GO
