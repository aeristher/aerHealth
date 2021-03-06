USE [master]
GO
/****** Object:  Database [BRMCHospital]    Script Date: 4/20/2019 8:17:05 PM ******/
CREATE DATABASE [BRMCHospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BRMCHospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BRMCHospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BRMCHospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BRMCHospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BRMCHospital] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BRMCHospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BRMCHospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BRMCHospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BRMCHospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BRMCHospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BRMCHospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [BRMCHospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BRMCHospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BRMCHospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BRMCHospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BRMCHospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BRMCHospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BRMCHospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BRMCHospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BRMCHospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BRMCHospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BRMCHospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BRMCHospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BRMCHospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BRMCHospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BRMCHospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BRMCHospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BRMCHospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BRMCHospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BRMCHospital] SET  MULTI_USER 
GO
ALTER DATABASE [BRMCHospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BRMCHospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BRMCHospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BRMCHospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BRMCHospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BRMCHospital] SET QUERY_STORE = OFF
GO
USE [BRMCHospital]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [BRMCHospital]
GO
/****** Object:  User [hospitalUser]    Script Date: 4/20/2019 8:17:05 PM ******/
CREATE USER [hospitalUser] FOR LOGIN [hospitalUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [hospitalUser]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 4/20/2019 8:17:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[PatientFirstName] [varchar](50) NULL,
	[PatientLastName] [varchar](50) NULL,
	[PatientSSN] [nchar](10) NULL,
	[Password] [varchar](500) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PatientsView]    Script Date: 4/20/2019 8:17:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PatientsView]
AS
SELECT        PatientID, PatientFirstName
FROM            dbo.Patients
WHERE        (PatientFirstName = 'Jeremy')
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 4/20/2019 8:17:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[InsRecordID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/20/2019 8:17:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_Patients] FOREIGN KEY([PatientID])
REFERENCES [dbo].[Patients] ([PatientID])
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Insurance_Patients]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Patients"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PatientsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PatientsView'
GO
USE [master]
GO
ALTER DATABASE [BRMCHospital] SET  READ_WRITE 
GO
