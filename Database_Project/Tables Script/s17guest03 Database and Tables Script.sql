USE [master]
GO
/****** Object:  Database [s17guest03]    Script Date: 5/16/2017 10:39:44 AM ******/
CREATE DATABASE [s17guest03]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N's17guest03', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.ZAHID\MSSQL\DATA\s17guest03.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N's17guest03_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.ZAHID\MSSQL\DATA\s17guest03_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [s17guest03] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s17guest03].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [s17guest03] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [s17guest03] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [s17guest03] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [s17guest03] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [s17guest03] SET ARITHABORT OFF 
GO
ALTER DATABASE [s17guest03] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [s17guest03] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [s17guest03] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [s17guest03] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [s17guest03] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [s17guest03] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [s17guest03] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [s17guest03] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [s17guest03] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [s17guest03] SET  DISABLE_BROKER 
GO
ALTER DATABASE [s17guest03] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [s17guest03] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [s17guest03] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [s17guest03] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [s17guest03] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [s17guest03] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [s17guest03] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [s17guest03] SET RECOVERY FULL 
GO
ALTER DATABASE [s17guest03] SET  MULTI_USER 
GO
ALTER DATABASE [s17guest03] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [s17guest03] SET DB_CHAINING OFF 
GO
ALTER DATABASE [s17guest03] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [s17guest03] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [s17guest03] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N's17guest03', N'ON'
GO
ALTER DATABASE [s17guest03] SET QUERY_STORE = OFF
GO
USE [s17guest03]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [s17guest03]
GO
/****** Object:  Schema [dboEvent]    Script Date: 5/16/2017 10:39:44 AM ******/
CREATE SCHEMA [dboEvent]
GO
/****** Object:  Table [dboEvent].[PresentationSchedule]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[PresentationSchedule](
	[ScheduleId] [bigint] IDENTITY(1,1) NOT NULL,
	[EventId] [bigint] NOT NULL,
	[PresenterBindWithClassId] [bigint] NOT NULL,
	[RoomsBindWithVenueId] [bigint] NOT NULL,
	[ScheduleStatus] [bigint] NOT NULL,
 CONSTRAINT [PK_PresentationSchedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Events]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Events](
	[EventId] [bigint] IDENTITY(1,1) NOT NULL,
	[EventTitle] [varchar](50) NULL,
	[Locationid] [bigint] NOT NULL,
	[EventDateTime] [datetime] NOT NULL,
	[EventStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Locations]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Locations](
	[LocationId] [bigint] IDENTITY(1,1) NOT NULL,
	[ZipCode] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[StateId] [bigint] NULL,
	[CityId] [bigint] NULL,
	[StreetAddress] [varchar](350) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Roles]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Roles](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[RoleDiscription] [varchar](max) NULL,
	[RoleStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[RoleAssings]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[RoleAssings](
	[RoleAssignId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[PersonId] [bigint] NULL,
	[RoleAssignStatus] [tinyint] NULL,
 CONSTRAINT [PK_RoleAssings] PRIMARY KEY CLUSTERED 
(
	[RoleAssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Classes]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Classes](
	[ClassId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassTitle] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[DurationInMinutes] [bigint] NOT NULL,
	[DifficultyLevelId] [bigint] NOT NULL,
	[ClassDateTime] [datetime] NULL,
	[ClassStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[PrensenterBindWithClass]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[PrensenterBindWithClass](
	[BindingId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[BindingStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_PrensenterBindWithClass] PRIMARY KEY CLUSTERED 
(
	[BindingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Persons]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Persons](
	[PersonId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [nchar](10) NULL,
	[EmailId] [varchar](50) NULL,
	[ContactNo] [varchar](50) NULL,
	[LocationId] [bigint] NULL,
	[PersonStatus] [tinyint] NULL,
	[RecordCreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dboEvent].[PresentationTrackingView]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dboEvent].[PresentationTrackingView]
as

select e.EventId,e.EventTitle,c.ClassId,c.ClassTitle,per.PersonId,per.FirstName,per.LastName,l.StreetAddress as PersonAddress,per.EmailId,r.RoleId,ra.RoleAssignId from dboEvent.PresentationSchedule p 
INNER JOIN dboEvent.Events e on e.EventId=p.EventId and e.EventStatus=1
INNER join dboEvent.PrensenterBindWithClass pc on pc.BindingId=p.PresenterBindWithClassId and pc.BindingStatus=1
INNER join dboEvent.Classes c on c.ClassId=pc.ClassId and c.ClassStatus=1
inner join dboEvent.Persons per on per.PersonId=pc.PersonId and per.PersonStatus=1
inner join dboEvent.Locations l on l.LocationId = per.LocationId 
INNER join dboEvent.RoleAssings ra on ra.PersonId=per.PersonId and ra.RoleAssignStatus=1
INNER join dboEvent.Roles r on r.RoleId=ra.RoleId and ra.RoleAssignStatus =1

GO
/****** Object:  Table [dboEvent].[Cities]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Cities](
	[CityId] [bigint] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[StateId] [bigint] NULL,
	[CityStatus] [tinyint] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[ClassDifficultyLevel]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[ClassDifficultyLevel](
	[DifficultyLevelId] [bigint] IDENTITY(1,1) NOT NULL,
	[DifficultyLevelTitle] [varchar](50) NULL,
	[DifficultyLevelStatus] [tinyint] NULL,
 CONSTRAINT [PK_ClassDifficultyLevel] PRIMARY KEY CLUSTERED 
(
	[DifficultyLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Countries]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Countries](
	[CountryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[CountryStatus] [tinyint] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Rooms]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Rooms](
	[RoomId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoomTitle] [varchar](50) NULL,
	[Capacity] [bigint] NULL,
	[RoomStatus] [bigint] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[RoomsBindWithVenue]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[RoomsBindWithVenue](
	[BindingId] [bigint] IDENTITY(1,1) NOT NULL,
	[VenueId] [bigint] NOT NULL,
	[RoomId] [bigint] NOT NULL,
	[BindingStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_RoomsBindWithVenue] PRIMARY KEY CLUSTERED 
(
	[BindingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Sponsors]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Sponsors](
	[SponsorId] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[SponsorTypeId] [bigint] NOT NULL,
	[SponsorStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[SponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[SponsorsTypes]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[SponsorsTypes](
	[SponsorTypeId] [bigint] IDENTITY(1,1) NOT NULL,
	[SponsorTypeTitle] [varchar](50) NOT NULL,
	[SponsorTypeStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_SponsorsTypes] PRIMARY KEY CLUSTERED 
(
	[SponsorTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[States]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[States](
	[StateId] [bigint] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[CountryId] [bigint] NULL,
	[StateStatus] [tinyint] NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[StudentEnrollInClass]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[StudentEnrollInClass](
	[EnrollmentId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[BindingStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_StudentEnrollInClass] PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Tracks]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Tracks](
	[TrackId] [bigint] IDENTITY(1,1) NOT NULL,
	[TrackTitle] [varchar](50) NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[TrackStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Tracks] PRIMARY KEY CLUSTERED 
(
	[TrackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dboEvent].[Venues]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dboEvent].[Venues](
	[VenueId] [bigint] IDENTITY(1,1) NOT NULL,
	[VenueTitle] [varchar](50) NOT NULL,
	[LocationId] [bigint] NOT NULL,
	[VenueStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_Venues] PRIMARY KEY CLUSTERED 
(
	[VenueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_ClassDifficultyLevel]    Script Date: 5/16/2017 10:39:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ClassDifficultyLevel] ON [dboEvent].[ClassDifficultyLevel]
(
	[DifficultyLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Classes]    Script Date: 5/16/2017 10:39:44 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Classes] ON [dboEvent].[Classes]
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dboEvent].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_States] FOREIGN KEY([StateId])
REFERENCES [dboEvent].[States] ([StateId])
GO
ALTER TABLE [dboEvent].[Cities] CHECK CONSTRAINT [FK_Cities_States]
GO
ALTER TABLE [dboEvent].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_ClassDifficultyLevel] FOREIGN KEY([DifficultyLevelId])
REFERENCES [dboEvent].[ClassDifficultyLevel] ([DifficultyLevelId])
GO
ALTER TABLE [dboEvent].[Classes] CHECK CONSTRAINT [FK_Classes_ClassDifficultyLevel]
GO
ALTER TABLE [dboEvent].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Locations] FOREIGN KEY([Locationid])
REFERENCES [dboEvent].[Locations] ([LocationId])
GO
ALTER TABLE [dboEvent].[Events] CHECK CONSTRAINT [FK_Events_Locations]
GO
ALTER TABLE [dboEvent].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Cities] FOREIGN KEY([CityId])
REFERENCES [dboEvent].[Cities] ([CityId])
GO
ALTER TABLE [dboEvent].[Locations] CHECK CONSTRAINT [FK_Locations_Cities]
GO
ALTER TABLE [dboEvent].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Countries] FOREIGN KEY([CountryId])
REFERENCES [dboEvent].[Countries] ([CountryId])
GO
ALTER TABLE [dboEvent].[Locations] CHECK CONSTRAINT [FK_Locations_Countries]
GO
ALTER TABLE [dboEvent].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_States] FOREIGN KEY([StateId])
REFERENCES [dboEvent].[States] ([StateId])
GO
ALTER TABLE [dboEvent].[Locations] CHECK CONSTRAINT [FK_Locations_States]
GO
ALTER TABLE [dboEvent].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Locations] FOREIGN KEY([LocationId])
REFERENCES [dboEvent].[Locations] ([LocationId])
GO
ALTER TABLE [dboEvent].[Persons] CHECK CONSTRAINT [FK_Persons_Locations]
GO
ALTER TABLE [dboEvent].[PrensenterBindWithClass]  WITH CHECK ADD  CONSTRAINT [FK_PrensenterBindWithClass_Classes] FOREIGN KEY([ClassId])
REFERENCES [dboEvent].[Classes] ([ClassId])
GO
ALTER TABLE [dboEvent].[PrensenterBindWithClass] CHECK CONSTRAINT [FK_PrensenterBindWithClass_Classes]
GO
ALTER TABLE [dboEvent].[PrensenterBindWithClass]  WITH CHECK ADD  CONSTRAINT [FK_PrensenterBindWithClass_Persons] FOREIGN KEY([PersonId])
REFERENCES [dboEvent].[Persons] ([PersonId])
GO
ALTER TABLE [dboEvent].[PrensenterBindWithClass] CHECK CONSTRAINT [FK_PrensenterBindWithClass_Persons]
GO
ALTER TABLE [dboEvent].[PresentationSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PresentationSchedule_Events] FOREIGN KEY([EventId])
REFERENCES [dboEvent].[Events] ([EventId])
GO
ALTER TABLE [dboEvent].[PresentationSchedule] CHECK CONSTRAINT [FK_PresentationSchedule_Events]
GO
ALTER TABLE [dboEvent].[PresentationSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PresentationSchedule_PresentationSchedule] FOREIGN KEY([PresenterBindWithClassId])
REFERENCES [dboEvent].[PrensenterBindWithClass] ([BindingId])
GO
ALTER TABLE [dboEvent].[PresentationSchedule] CHECK CONSTRAINT [FK_PresentationSchedule_PresentationSchedule]
GO
ALTER TABLE [dboEvent].[PresentationSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PresentationSchedule_RoomsBindWithVenue] FOREIGN KEY([RoomsBindWithVenueId])
REFERENCES [dboEvent].[RoomsBindWithVenue] ([BindingId])
GO
ALTER TABLE [dboEvent].[PresentationSchedule] CHECK CONSTRAINT [FK_PresentationSchedule_RoomsBindWithVenue]
GO
ALTER TABLE [dboEvent].[RoleAssings]  WITH CHECK ADD  CONSTRAINT [FK_RoleAssings_Persons] FOREIGN KEY([PersonId])
REFERENCES [dboEvent].[Persons] ([PersonId])
GO
ALTER TABLE [dboEvent].[RoleAssings] CHECK CONSTRAINT [FK_RoleAssings_Persons]
GO
ALTER TABLE [dboEvent].[RoleAssings]  WITH CHECK ADD  CONSTRAINT [FK_RoleAssings_Roles] FOREIGN KEY([RoleId])
REFERENCES [dboEvent].[Roles] ([RoleId])
GO
ALTER TABLE [dboEvent].[RoleAssings] CHECK CONSTRAINT [FK_RoleAssings_Roles]
GO
ALTER TABLE [dboEvent].[RoomsBindWithVenue]  WITH CHECK ADD  CONSTRAINT [FK_RoomsBindWithVenue_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dboEvent].[Rooms] ([RoomId])
GO
ALTER TABLE [dboEvent].[RoomsBindWithVenue] CHECK CONSTRAINT [FK_RoomsBindWithVenue_Rooms]
GO
ALTER TABLE [dboEvent].[RoomsBindWithVenue]  WITH CHECK ADD  CONSTRAINT [FK_RoomsBindWithVenue_Venues] FOREIGN KEY([VenueId])
REFERENCES [dboEvent].[Venues] ([VenueId])
GO
ALTER TABLE [dboEvent].[RoomsBindWithVenue] CHECK CONSTRAINT [FK_RoomsBindWithVenue_Venues]
GO
ALTER TABLE [dboEvent].[Sponsors]  WITH CHECK ADD  CONSTRAINT [FK_Sponsors_Persons] FOREIGN KEY([PersonId])
REFERENCES [dboEvent].[Persons] ([PersonId])
GO
ALTER TABLE [dboEvent].[Sponsors] CHECK CONSTRAINT [FK_Sponsors_Persons]
GO
ALTER TABLE [dboEvent].[Sponsors]  WITH CHECK ADD  CONSTRAINT [FK_Sponsors_SponsorsTypes] FOREIGN KEY([SponsorTypeId])
REFERENCES [dboEvent].[SponsorsTypes] ([SponsorTypeId])
GO
ALTER TABLE [dboEvent].[Sponsors] CHECK CONSTRAINT [FK_Sponsors_SponsorsTypes]
GO
ALTER TABLE [dboEvent].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Countries] FOREIGN KEY([CountryId])
REFERENCES [dboEvent].[Countries] ([CountryId])
GO
ALTER TABLE [dboEvent].[States] CHECK CONSTRAINT [FK_States_Countries]
GO
ALTER TABLE [dboEvent].[StudentEnrollInClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollInClass_Classes] FOREIGN KEY([ClassId])
REFERENCES [dboEvent].[Classes] ([ClassId])
GO
ALTER TABLE [dboEvent].[StudentEnrollInClass] CHECK CONSTRAINT [FK_StudentEnrollInClass_Classes]
GO
ALTER TABLE [dboEvent].[StudentEnrollInClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentEnrollInClass_Persons] FOREIGN KEY([PersonId])
REFERENCES [dboEvent].[Persons] ([PersonId])
GO
ALTER TABLE [dboEvent].[StudentEnrollInClass] CHECK CONSTRAINT [FK_StudentEnrollInClass_Persons]
GO
ALTER TABLE [dboEvent].[Tracks]  WITH CHECK ADD  CONSTRAINT [FK_Tracks_Classes] FOREIGN KEY([ClassId])
REFERENCES [dboEvent].[Classes] ([ClassId])
GO
ALTER TABLE [dboEvent].[Tracks] CHECK CONSTRAINT [FK_Tracks_Classes]
GO
ALTER TABLE [dboEvent].[Venues]  WITH CHECK ADD  CONSTRAINT [FK_Venues_Locations] FOREIGN KEY([LocationId])
REFERENCES [dboEvent].[Locations] ([LocationId])
GO
ALTER TABLE [dboEvent].[Venues] CHECK CONSTRAINT [FK_Venues_Locations]
GO
/****** Object:  StoredProcedure [dboEvent].[spBudapestTrackPresentations]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dboEvent].[spBudapestTrackPresentations]
		--ENTER A TRACK
		--IF NO TRACK ENTERED DEFAULT VALUE OF 4 IS USED
		-- Budapest only has track #'s 1,2,3,4,5,6
		@trackId INT = 4
	AS
	--If invalid data raise error
	BEGIN TRY
		--display track, title, city
		select e.EventId,e.EventTitle,t.TrackId,t.TrackTitle,c.ClassId,c.ClassTitle,per.PersonId,per.FirstName,per.LastName,c1.CityName from dboEvent.PresentationSchedule p 
INNER JOIN dboEvent.Events e on e.EventId=p.EventId and e.EventStatus=1
inner join dboEvent.Locations l on l.LocationId=e.Locationid 
inner join dboEvent.Cities c1 on c1.CityId=l.CityId and c1.CityStatus=1
INNER join dboEvent.PrensenterBindWithClass pc on pc.BindingId=p.PresenterBindWithClassId and pc.BindingStatus=1
inner join dboEvent.Persons per on per.PersonId=pc.PersonId and per.PersonStatus=1
INNER join dboEvent.Classes c on c.ClassId=pc.ClassId and c.ClassStatus=1
inner join dboEvent.Tracks t on t.ClassId=c.ClassId and t.TrackStatus=1
where UPPER(c1.CityName)= UPPER('Budapest') and t.TrackId=@trackId
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
  	DECLARE @ErrorSeverity INT;
  	DECLARE @ErrorState INT;
  	SELECT
    	@ErrorMessage = ERROR_MESSAGE(),
    	@ErrorSeverity = ERROR_SEVERITY(),
    	@ErrorState = ERROR_STATE();
  		RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH

GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoCities]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoCities]
  @cityName varchar(50),@stateId bigint,@cityStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Cities]
           ([CityName]
		   ,[StateId]
           ,[CityStatus])
     VALUES
           (@cityName,@stateId,@cityStatus)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoClasses]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoClasses]
  @ClassTitle varchar(50)
           ,@Description varchar(max)
           ,@DurationInMinutes bigint
		   ,@DifficultyLevelId bigint
           ,@ClassDateTime datetime
           ,@ClassStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Classes]
           ([ClassTitle]
           ,[Description]
           ,[DurationInMinutes]
           ,[DifficultyLevelId]
           ,[ClassDateTime]
           ,[ClassStatus])
     VALUES
           (@ClassTitle
		   ,@Description 
           ,@DurationInMinutes 
		   ,@DifficultyLevelId 
           ,@ClassDateTime 
           ,@ClassStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoCountries]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoCountries]
  @countryName varchar(50),@status tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Countries]
           ([CountryName]
           ,[CountryStatus])
     VALUES
           (@countryName,@status)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoDifficultyLevels]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoDifficultyLevels]
  @difficultyLevelTitle varchar(50),@difficultyLevelStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[ClassDifficultyLevel]
           ([DifficultyLevelTitle]
           ,[DifficultyLevelStatus])
     VALUES
           (@difficultyLevelTitle,@difficultyLevelStatus)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END




GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoEvents]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoEvents]
  @eventTitle varchar(50),@locationId bigint,@eDateTime datetime, @eStatus as tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Events]
           ([EventTitle]
           ,[Locationid]
           ,[EventDateTime]
           ,[EventStatus])
     VALUES
           (@eventTitle,@locationId,@eDateTime,@eStatus)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoLocations]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoLocations]
  @zipCode bigint,@countryId bigint,@stateId bigint, @cityId as bigint,@streetAddress as varchar(50)


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Locations]
           ([ZipCode]
           ,[CountryId]
           ,[StateId]
           ,[CityId]
           ,[StreetAddress])
     VALUES
           (@zipCode
           ,@countryId
           ,@stateId
           ,@cityId
           ,@streetAddress)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoPersons]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dboEvent].[spInsertIntoPersons]
  @firstName varchar(50),@lastName varchar(50),@Gender nchar(10), @emailId as varchar(50),@contactNo as varchar(50),
  @locationId as bigint,@status as tinyint,@createdOn as datetime


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Persons]
           ([FirstName]
           ,[LastName]
           ,[Gender]
           ,[EmailId]
           ,[ContactNo]
           ,[LocationId]
           ,[PersonStatus]
           ,[RecordCreatedOn])
     VALUES
           ( @firstName ,@lastName,@Gender , @emailId ,@contactNo ,
  @locationId ,@status ,@createdOn)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END




GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoPresentationBindWithClass]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoPresentationBindWithClass]
  @classId bigint,@personId bigint,@status as tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[PrensenterBindWithClass]
           ([ClassId]
           ,[PersonId]
           ,[BindingStatus])
     VALUES
           (  @classId ,@personId ,@status )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoPresentationSchedule]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dboEvent].[spInsertIntoPresentationSchedule]
  @eventId bigint,@presenterBindWithClassId bigint,
           @roomsBindWithVenueId bigint
           ,@scheduleStatus as tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[PresentationSchedule]
           ([EventId]
           ,[PresenterBindWithClassId]
           ,[RoomsBindWithVenueId]
           ,[ScheduleStatus])
     VALUES
           (@eventId ,@presenterBindWithClassId ,
           @roomsBindWithVenueId 
           ,@scheduleStatus)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END




GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoRoleAssign]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dboEvent].[spInsertIntoRoleAssign]
  @roleId bigint
           ,@personId bigint
           ,@oleAssignStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[RoleAssings]
           ([RoleId]
           ,[PersonId]
           ,[RoleAssignStatus])
     VALUES
           ( @roleId 
           ,@personId 
           ,@oleAssignStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END




GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoRoles]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dboEvent].[spInsertIntoRoles]
  @RoleName varchar(50)
           ,@RoleDiscription varchar(max)
           ,@RoleStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Roles]
           ([RoleName]
           ,[RoleDiscription]
           ,[RoleStatus])
     VALUES
           (  @RoleName 
           ,@RoleDiscription 
           ,@RoleStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END




GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoRooms]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoRooms]
  @RoomTitle varchar(50)
           ,@Capacity bigint
           ,@RoomStatus  bigint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Rooms]
           ([RoomTitle]
           ,[Capacity]
           ,[RoomStatus])
     VALUES
           (@RoomTitle 
           ,@Capacity 
           ,@RoomStatus  )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoRoomsBindWithVenue]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoRoomsBindWithVenue]
  @VenueId bigint
           ,@RoomId bigint
           ,@BindingStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[RoomsBindWithVenue]
           ([VenueId]
           ,[RoomId]
           ,[BindingStatus])
     VALUES
           (  @VenueId 
           ,@RoomId 
           ,@BindingStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoSponsors]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoSponsors]
  @PersonId bigint
           ,@SponsorTypeId bigint
           ,@SponsorStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Sponsors]
           ([PersonId]
           ,[SponsorTypeId]
           ,[SponsorStatus])
     VALUES
           ( @PersonId 
           ,@SponsorTypeId 
           ,@SponsorStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoSponsorsTypes]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoSponsorsTypes]
  @SponsorTypeTitle varchar(50)
           ,@SponsorTypeStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[SponsorsTypes]
           ([SponsorTypeTitle]
           ,[SponsorTypeStatus])
     VALUES
           (@SponsorTypeTitle 
           ,@SponsorTypeStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoStates]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoStates]
		   @CountryId bigint
           ,@StateName varchar(50)
           ,@StateStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[States]
           (
		   [CountryId]
           ,[StateName]
           ,[StateStatus])
     VALUES
           (
		   @CountryId 
           ,@StateName 
           ,@StateStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoStudentEnrollInClass]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoStudentEnrollInClass]
 @ClassId bigint
           ,@PersonId bigint
           ,@BindingStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[StudentEnrollInClass]
           ([ClassId]
           ,[PersonId]
           ,[BindingStatus])
     VALUES
           ( @ClassId 
           ,@PersonId 
           ,@BindingStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoTracks]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoTracks]
 @TrackTitle varchar(50)
           ,@ClassId bigint
           ,@TrackStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Tracks]
           ([TrackTitle]
           ,[ClassId]
           ,[TrackStatus])
     VALUES
           ( @TrackTitle 
           ,@ClassId 
           ,@TrackStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoVenues]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dboEvent].[spInsertIntoVenues]
@VenueTitle varchar(50)
           ,@LocationId bigint
           ,@VenueStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Venues]
           ([VenueTitle]
           ,[LocationId]
           ,[VenueStatus])
     VALUES
           (@VenueTitle 
           ,@LocationId 
           ,@VenueStatus )

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spInsertNewPresentaion]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dboEvent].[spInsertNewPresentaion]
  @classTitle varchar(50),
  @description varchar(250),
  @DurationInMinutes bigint,
  @difficultyLevelId bigint,
  @classDateTime datetime,
  @classStatus tinyint


AS
BEGIN
  BEGIN TRY

insert into dboEvent.Classes  VALUES(@classTitle,@description,@DurationInMinutes,@difficultyLevelId,@classDateTime,@classStatus)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END



GO
/****** Object:  StoredProcedure [dboEvent].[spSelectSpeakerPresentation]    Script Date: 5/16/2017 10:39:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--This Procedure selects a speaker and returns their presentations
--enter the name in this format: selectSpeakerPresentations 'Paul Rizza'
CREATE PROC [dboEvent].[spSelectSpeakerPresentation]
  @speakerFirstName VARCHAR(80),
  @speakerLastName varchar(80)
  AS
  BEGIN TRY

		  select v.firstname,v.lastname,v.classtitle from dboEvent.presentationtrackingview v where UPPER(firstname)=UPPER(@speakerFirstName) and UPPER(lastname)=UPPER(@speakerLastName)
  END TRY
   BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH



GO
USE [master]
GO
ALTER DATABASE [s17guest03] SET  READ_WRITE 
GO
