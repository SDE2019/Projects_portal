USE [master]
GO
/****** Object:  Database [ProjectProgressMonitoringSystem]    Script Date: 23-09-2019 15:47:27 ******/
CREATE DATABASE [ProjectProgressMonitoringSystem]
 CONTAINMENT = NONE

ALTER DATABASE [ProjectProgressMonitoringSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectProgressMonitoringSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET QUERY_STORE = OFF
GO
USE [ProjectProgressMonitoringSystem]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 23-09-2019 15:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Marks] [nvarchar](255) NULL,
	[ProjectID] [nvarchar](100) NOT NULL,
	[PhaseID] [nvarchar](100) NOT NULL,
	[TeacherID] [nvarchar](100) NOT NULL,
	[StudentUSN] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC,
	[PhaseID] ASC,
	[TeacherID] ASC,
	[StudentUSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phase]    Script Date: 23-09-2019 15:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phase](
	[PhaseID] [nvarchar](100) NOT NULL,
	[ProjectID] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
	[Deadline] [date] NULL,
	[SubmissionDone] [nchar](255) NULL,
	[PresentationGiven] [nchar](255) NULL,
	[Document] [nvarchar](255) NULL,
 CONSTRAINT [PK_Phase_1] PRIMARY KEY CLUSTERED 
(
	[PhaseID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 23-09-2019 15:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectID] [nvarchar](100) NOT NULL,
	[TeacherID] [nvarchar](100) NOT NULL,
	[ProjectTitle] [nchar](255) NOT NULL,
	[ProjectGenre] [nchar](255) NULL,
 CONSTRAINT [PK_Project_1] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 23-09-2019 15:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentUSN] [nvarchar](100) NOT NULL,
	[StudentName] [nchar](255) NOT NULL,
	[TeamNumber] [nvarchar](255) NULL,
	[Semester] [nvarchar](50) NOT NULL,
	[EmailID] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](255) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentUSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 23-09-2019 15:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherName] [nchar](255) NOT NULL,
	[TeacherID] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorksOn]    Script Date: 23-09-2019 15:47:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorksOn](
	[StudentUSN] [nvarchar](100) NOT NULL,
	[ProjectID] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_WorksOn_1] PRIMARY KEY CLUSTERED 
(
	[StudentUSN] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Phase1] FOREIGN KEY([ProjectID], [PhaseID])
REFERENCES [dbo].[Phase] ([PhaseID], [ProjectID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Phase1]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Project]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Student1] FOREIGN KEY([StudentUSN])
REFERENCES [dbo].[Student] ([StudentUSN])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Student1]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Teacher]
GO
ALTER TABLE [dbo].[Phase]  WITH CHECK ADD  CONSTRAINT [FK_Phase_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[Phase] CHECK CONSTRAINT [FK_Phase_Project]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Teacher]
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD  CONSTRAINT [FK_WorksOn_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ProjectID])
GO
ALTER TABLE [dbo].[WorksOn] CHECK CONSTRAINT [FK_WorksOn_Project]
GO
ALTER TABLE [dbo].[WorksOn]  WITH CHECK ADD  CONSTRAINT [FK_WorksOn_Student] FOREIGN KEY([StudentUSN])
REFERENCES [dbo].[Student] ([StudentUSN])
GO
ALTER TABLE [dbo].[WorksOn] CHECK CONSTRAINT [FK_WorksOn_Student]
GO
USE [master]
GO
ALTER DATABASE [ProjectProgressMonitoringSystem] SET  READ_WRITE 
GO
