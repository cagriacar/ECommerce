USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 19.04.2019 17:05:20 ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ECommerce.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ECommerce_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ECommerce', N'ON'
GO
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Adres] [nvarchar](500) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[PhotoId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [uniqueidentifier] NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Soyadi] [nvarchar](50) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[Telefon] [char](15) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FeatureTypes]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeatureTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_FeatureTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeatureValues]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeatureValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[FeatureTypeId] [int] NOT NULL,
 CONSTRAINT [PK_FeatureValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marks]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[PhotoId] [int] NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStates]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
 CONSTRAINT [PK_OrderStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photos]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyukYol] [nvarchar](250) NULL,
	[OrtaYol] [nvarchar](250) NULL,
	[KucukYol] [nvarchar](250) NULL,
	[Varsayilan] [bit] NULL,
	[SiraNo] [tinyint] NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductFeatures]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFeatures](
	[ProductId] [int] NOT NULL,
	[FeatureTypeId] [int] NOT NULL,
	[FeatureValueId] [int] NOT NULL,
 CONSTRAINT [PK_ProductFeatures] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[FeatureTypeId] ASC,
	[FeatureValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](500) NULL,
	[AlisFiyati] [money] NOT NULL,
	[SatisFiyati] [money] NOT NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[SonKullanmaTarihi] [datetime] NULL,
	[CategoryId] [int] NOT NULL,
	[MarkId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
	[Aciklama] [nvarchar](250) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleDetails]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetails](
	[SaleId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Adet] [float] NOT NULL,
	[Fiyat] [money] NOT NULL,
	[Indirim] [float] NULL,
 CONSTRAINT [PK_SaleDetails] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[SatisTarihi] [datetime] NOT NULL,
	[ToplamTutar] [money] NOT NULL,
	[SepetteMi] [bit] NOT NULL,
	[ShipmentId] [int] NULL,
	[OrderStateId] [int] NULL,
	[KargoTakipNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shipments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SirketAdi] [nvarchar](50) NOT NULL,
	[Adres] [nvarchar](500) NOT NULL,
	[Telefon] [char](15) NOT NULL,
	[WebSite] [nvarchar](50) NULL,
	[EMail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 19.04.2019 17:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UsersInRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (1, N'Bilgisayar', N'Açıklama Yok', NULL)
INSERT [dbo].[Categories] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (6, N'Telefon', N'Açıklama Yok', NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[FeatureTypes] ON 

INSERT [dbo].[FeatureTypes] ([Id], [Adi], [Aciklama], [CategoryId]) VALUES (1, N'RAM', N'Random Access Memory', 1)
INSERT [dbo].[FeatureTypes] ([Id], [Adi], [Aciklama], [CategoryId]) VALUES (2, N'Harddisk', N'Sabit Disk', 1)
INSERT [dbo].[FeatureTypes] ([Id], [Adi], [Aciklama], [CategoryId]) VALUES (3, N'Kamera', N'Arka Kamera', 6)
INSERT [dbo].[FeatureTypes] ([Id], [Adi], [Aciklama], [CategoryId]) VALUES (4, N'Ekran Boyutu', N'Açıklama Yok', 6)
INSERT [dbo].[FeatureTypes] ([Id], [Adi], [Aciklama], [CategoryId]) VALUES (5, N'Hafıza', N'Memory', 6)
INSERT [dbo].[FeatureTypes] ([Id], [Adi], [Aciklama], [CategoryId]) VALUES (6, N'Ekran Kartı', N'Açıklama Yok', 1)
SET IDENTITY_INSERT [dbo].[FeatureTypes] OFF
SET IDENTITY_INSERT [dbo].[FeatureValues] ON 

INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (1, N'2 GB', N'Yok', 1)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (2, N'4 GB', N'Yok', 1)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (3, N'8 GB', N'Yok', 1)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (4, N'500 GB', N'Yok', 2)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (5, N'750 GB', N'Yok', 2)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (6, N'1 TB', N'Yok', 2)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (7, N'16 MP', N'Açıklama Yok', 3)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (8, N'24 MP', N'Açıklama Yok', 3)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (9, N'4.1 inç', N'Açıklama Yok', 4)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (10, N'5.5 inç', N'Açıklama Yok', 4)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (11, N'32 GB', N'Açıklama Yok', 5)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (12, N'64 GB', N'Açıklama Yok', 5)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (13, N'4 GB', N'Açıklama Yok', 6)
INSERT [dbo].[FeatureValues] ([Id], [Adi], [Aciklama], [FeatureTypeId]) VALUES (14, N'8 GB', N'Açıklama Yok', 6)
SET IDENTITY_INSERT [dbo].[FeatureValues] OFF
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (1, N'Lenovo', N'Açıklama Yok', 1)
INSERT [dbo].[Marks] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (2, N'asus', N'jkolk', 2)
INSERT [dbo].[Marks] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (3, N'LG', N'Açıklama Yok', 3)
INSERT [dbo].[Marks] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (4, N'bosch', N'sdsd', 4)
INSERT [dbo].[Marks] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (5, N'lg', N'yok', 5)
INSERT [dbo].[Marks] ([Id], [Adi], [Aciklama], [PhotoId]) VALUES (6, N'IPhone', N'Açıklama Yok', 6)
SET IDENTITY_INSERT [dbo].[Marks] OFF
SET IDENTITY_INSERT [dbo].[Photos] ON 

INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (1, NULL, N'/Content/MarkPhotos/8541ec33-d12a-4cd6-9e54-f249af8b9e3d.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (2, NULL, N'/Content/MarkPhotos/a08b9f17-2b83-4973-bf45-3ba6a29295aa.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (3, NULL, N'/Content/MarkPhotos/6a72e097-f08b-47d9-a4a7-000cc51b0d0a.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (4, NULL, N'/Content/MarkPhotos/6fa07a58-d027-4b5c-8979-c83c99eaa4c9.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (5, NULL, N'/Content/MarkPhotos/a8f17976-5ccc-436b-b28f-7708a02b5ed0.jpg', NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (6, NULL, N'/Content/MarkPhotos/9dde787d-068f-4978-ab26-c94572d78323.png', NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (7, N'/Content/ProductPhotos/Large/28c8db30-45ff-4ea8-b497-5edd3c436f68.jpg', N'/Content/ProductPhotos/Medium/c9d53ae7-1bc1-4c14-8711-b52982cde1eb.jpg', NULL, 1, NULL, 1)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (8, N'/Content/ProductPhotos/Large/52c54543-6c81-4219-bfcc-482e69fe699c.jpg', N'/Content/ProductPhotos/Medium/ebf07009-b178-45be-8f6d-ab21d6ac2437.jpg', NULL, 0, NULL, 1)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (9, N'/Content/SliderPhotos/d508d838-b508-49bb-85d4-5ed7fe0f0787.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (10, N'/Content/SliderPhotos/6b9a0498-976f-47d4-8146-0f3aab093a18.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (11, N'/Content/SliderPhotos/01fcec1a-118c-4798-b5dd-03256e70c663.jpg', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (12, N'/Content/ProductPhotos/Large/cee93d10-aa0a-4e6a-b9e5-4289fc75c209.jpg', N'/Content/ProductPhotos/Medium/1f9c1947-237c-4271-a0bf-67e3e4def790.jpg', NULL, 1, NULL, 2)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (13, N'/Content/ProductPhotos/Large/fb24fdb5-948f-42e4-8495-5b98503e5ed4.jpg', N'/Content/ProductPhotos/Medium/c39e60ff-6fe2-41fd-afe6-f34becd6301e.jpg', NULL, 0, NULL, 2)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (14, N'/Content/ProductPhotos/Large/593c45fc-468b-4d53-8d8c-2f7d710bedff.jpg', N'/Content/ProductPhotos/Medium/725fb96e-4af4-4300-a6bc-7e190ddc5e5d.jpg', NULL, 0, NULL, 2)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (15, N'/Content/ProductPhotos/Large/d320c113-9c71-4146-9e50-e9b594ec8ed3.jpg', N'/Content/ProductPhotos/Medium/d1b66994-45e5-46a1-841c-1582aed393be.jpg', NULL, 1, NULL, 3)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (16, N'/Content/ProductPhotos/Large/1430f664-d448-4640-a637-77b95a2938f2.jpg', N'/Content/ProductPhotos/Medium/7e143117-437c-42c9-ab43-955a72065358.jpg', NULL, 0, NULL, 3)
INSERT [dbo].[Photos] ([Id], [BuyukYol], [OrtaYol], [KucukYol], [Varsayilan], [SiraNo], [ProductId]) VALUES (17, N'/Content/ProductPhotos/Large/3c5dde4a-b447-402c-adca-786fbab014a4.jpg', N'/Content/ProductPhotos/Medium/acf2a180-13b6-4c3d-b781-4cf5421b2de9.jpg', NULL, 0, NULL, 3)
SET IDENTITY_INSERT [dbo].[Photos] OFF
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (1, 1, 3)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (1, 2, 6)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (1, 6, 13)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (2, 3, 7)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (2, 4, 10)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (2, 5, 12)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (3, 3, 7)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (3, 4, 10)
INSERT [dbo].[ProductFeatures] ([ProductId], [FeatureTypeId], [FeatureValueId]) VALUES (3, 5, 12)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [CategoryId], [MarkId]) VALUES (1, N'S 510p', N'Çiziksiz', 1800.0000, 2000.0000, CAST(N'2019-04-15 17:45:07.837' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Products] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [CategoryId], [MarkId]) VALUES (2, N'LG G5', N'Süper', 2500.0000, 3500.0000, CAST(N'2019-04-16 16:51:24.257' AS DateTime), NULL, 6, 3)
INSERT [dbo].[Products] ([Id], [Adi], [Aciklama], [AlisFiyati], [SatisFiyati], [EklenmeTarihi], [SonKullanmaTarihi], [CategoryId], [MarkId]) VALUES (3, N'IPhone X', N'Pahalı', 10000.0000, 15000.0000, CAST(N'2019-04-16 17:08:52.587' AS DateTime), NULL, 6, 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Customers]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Photos] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[Photos] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Photos]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users]
GO
ALTER TABLE [dbo].[FeatureTypes]  WITH CHECK ADD  CONSTRAINT [FK_FeatureTypes_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[FeatureTypes] CHECK CONSTRAINT [FK_FeatureTypes_Categories]
GO
ALTER TABLE [dbo].[FeatureValues]  WITH CHECK ADD  CONSTRAINT [FK_FeatureValues_FeatureTypes] FOREIGN KEY([FeatureTypeId])
REFERENCES [dbo].[FeatureTypes] ([Id])
GO
ALTER TABLE [dbo].[FeatureValues] CHECK CONSTRAINT [FK_FeatureValues_FeatureTypes]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Photos] FOREIGN KEY([PhotoId])
REFERENCES [dbo].[Photos] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Photos]
GO
ALTER TABLE [dbo].[Photos]  WITH CHECK ADD  CONSTRAINT [FK_Photos_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Photos] CHECK CONSTRAINT [FK_Photos_Products]
GO
ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_FeatureTypes] FOREIGN KEY([FeatureTypeId])
REFERENCES [dbo].[FeatureTypes] ([Id])
GO
ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_FeatureTypes]
GO
ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_FeatureValues] FOREIGN KEY([FeatureValueId])
REFERENCES [dbo].[FeatureValues] ([Id])
GO
ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_FeatureValues]
GO
ALTER TABLE [dbo].[ProductFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductFeatures_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductFeatures] CHECK CONSTRAINT [FK_ProductFeatures_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Marks] FOREIGN KEY([MarkId])
REFERENCES [dbo].[Marks] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Marks]
GO
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD  CONSTRAINT [FK_SaleDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[SaleDetails] CHECK CONSTRAINT [FK_SaleDetails_Products]
GO
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD  CONSTRAINT [FK_SaleDetails_Sales] FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sales] ([Id])
GO
ALTER TABLE [dbo].[SaleDetails] CHECK CONSTRAINT [FK_SaleDetails_Sales]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Customers]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_OrderStates] FOREIGN KEY([OrderStateId])
REFERENCES [dbo].[OrderStates] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_OrderStates]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Shipments] FOREIGN KEY([ShipmentId])
REFERENCES [dbo].[Shipments] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Shipments]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersInRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_UsersInRoles_Roles]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersInRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [FK_UsersInRoles_Users]
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
