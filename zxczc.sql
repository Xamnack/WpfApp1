USE [master]
GO
/****** Object:  Database [Jewelry]    Script Date: 20.06.2023 23:12:00 ******/
CREATE DATABASE [Jewelry]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Jewelry', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Jewelry.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Jewelry_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Jewelry_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Jewelry] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jewelry].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jewelry] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jewelry] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jewelry] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jewelry] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jewelry] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jewelry] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jewelry] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jewelry] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jewelry] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jewelry] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jewelry] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jewelry] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jewelry] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jewelry] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jewelry] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jewelry] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jewelry] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jewelry] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jewelry] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jewelry] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jewelry] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jewelry] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jewelry] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Jewelry] SET  MULTI_USER 
GO
ALTER DATABASE [Jewelry] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jewelry] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jewelry] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jewelry] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Jewelry] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Jewelry] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Jewelry] SET QUERY_STORE = ON
GO
ALTER DATABASE [Jewelry] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Jewelry]
GO
/****** Object:  Table [dbo].[category]    Script Date: 20.06.2023 23:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderList]    Script Date: 20.06.2023 23:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderList](
	[id] [int] NULL,
	[idOrder] [int] NULL,
	[idProduct] [int] NULL,
	[count] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 20.06.2023 23:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProduct] [int] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 20.06.2023 23:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[idCategory] [int] NULL,
	[Description] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage]    Script Date: 20.06.2023 23:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProduct] [int] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_storage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 20.06.2023 23:12:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [category]) VALUES (1, N'Камни')
INSERT [dbo].[category] ([id], [category]) VALUES (2, N'Украшения')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[orderList] ([id], [idOrder], [idProduct], [count]) VALUES (NULL, 56, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [idCategory], [Description], [Price], [count]) VALUES (1, N'Изумруд', 1, NULL, CAST(2000 AS Decimal(18, 0)), 0)
INSERT [dbo].[products] ([id], [name], [idCategory], [Description], [Price], [count]) VALUES (2, N'Рубин', 1, NULL, CAST(4000 AS Decimal(18, 0)), 0)
INSERT [dbo].[products] ([id], [name], [idCategory], [Description], [Price], [count]) VALUES (3, N'Алмаз', 1, NULL, CAST(10000 AS Decimal(18, 0)), 0)
INSERT [dbo].[products] ([id], [name], [idCategory], [Description], [Price], [count]) VALUES (4, N'Золотое кольцо с изумрудом', 2, NULL, CAST(6420 AS Decimal(18, 0)), 0)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[storage] ON 

INSERT [dbo].[storage] ([id], [idProduct], [count]) VALUES (1, 1, 5)
INSERT [dbo].[storage] ([id], [idProduct], [count]) VALUES (2, 2, 4)
INSERT [dbo].[storage] ([id], [idProduct], [count]) VALUES (3, 3, 19)
INSERT [dbo].[storage] ([id], [idProduct], [count]) VALUES (4, 4, 7)
SET IDENTITY_INSERT [dbo].[storage] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [name], [role]) VALUES (1, N'admin', N'1', N'Иванов И.В', N'Admin')
INSERT [dbo].[users] ([id], [login], [password], [name], [role]) VALUES (2, N'manager', N'1', N'Сергеев И.Н.', N'Manager')
INSERT [dbo].[users] ([id], [login], [password], [name], [role]) VALUES (3, N'user', N'1', N'Павлов П.П.', N'User')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
USE [master]
GO
ALTER DATABASE [Jewelry] SET  READ_WRITE 
GO
