USE [master]
GO
/****** Object:  Database [CRM]    Script Date: 6.10.2022 13:44:00 ******/
CREATE DATABASE [CRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ISKUR\MSSQL\DATA\CRM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.ISKUR\MSSQL\DATA\CRM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CRM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRM] SET RECOVERY FULL 
GO
ALTER DATABASE [CRM] SET  MULTI_USER 
GO
ALTER DATABASE [CRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRM', N'ON'
GO
ALTER DATABASE [CRM] SET QUERY_STORE = OFF
GO
USE [CRM]
GO
/****** Object:  Table [dbo].[MKimlik]    Script Date: 6.10.2022 13:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MKimlik](
	[MusteriNo] [int] NOT NULL,
	[TCNo] [char](11) NULL,
	[VergiSicilNo] [char](5) NULL,
	[AileSıraNo] [char](4) NULL,
 CONSTRAINT [PK_MKimlik] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 6.10.2022 13:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Yas] [int] NULL,
	[Bakiye] [money] NULL,
	[DogumTarihi] [datetime] NULL,
	[Adres] [text] NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otel]    Script Date: 6.10.2022 13:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otel](
	[OtelNo] [int] IDENTITY(1,1) NOT NULL,
	[MusteriNo] [int] NULL,
	[OtelAdi] [varchar](50) NULL,
	[OtelAdres] [varchar](50) NULL,
 CONSTRAINT [PK_Otel] PRIMARY KEY CLUSTERED 
(
	[OtelNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subeler]    Script Date: 6.10.2022 13:44:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subeler](
	[SubeNo] [int] IDENTITY(1,1) NOT NULL,
	[OtelNo] [int] NULL,
	[SubeAdi] [varchar](50) NULL,
	[SubeBolge] [varchar](50) NULL,
 CONSTRAINT [PK_Subeler] PRIMARY KEY CLUSTERED 
(
	[SubeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (3, N'12345648894', N'65422', N'15  ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (4, N'19256564684', N'46546', N'65  ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (5, N'10123456789', N'14725', N'13  ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (6, N'55475236541', N'25647', N'24  ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (7, N'12366782894', N'23415', N'17  ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (9, N'12345678910', N'25836', N'12  ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (10, N'2323433443 ', N'32323', N'3   ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (11, N'55555555   ', N'12345', N'1234')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (12, N'5648458    ', N'5458 ', N'477 ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (13, N'55654655445', N'65445', N'57  ')
INSERT [dbo].[MKimlik] ([MusteriNo], [TCNo], [VergiSicilNo], [AileSıraNo]) VALUES (15, N'12345678910', N'34341', N'3   ')
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (1, N'Zeynep', 29, 500.0000, CAST(N'1993-09-12T00:00:00.000' AS DateTime), N'Kurtköy')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (2, N'ali', 12, 4000.0000, CAST(N'1998-12-19T00:00:00.000' AS DateTime), N'sakarya')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (3, N'aybüke akçay', 23, 5000.0000, CAST(N'1990-10-20T00:00:00.000' AS DateTime), N'kgkkkh')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (4, N'FURKAN', 25, 25000.0000, CAST(N'1996-12-09T00:00:00.000' AS DateTime), N'SDFGAWRFAWRF')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (5, N'Emre', 37, 99999999999.0000, CAST(N'1995-11-11T00:00:00.000' AS DateTime), N'İstanbul')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (6, N'ahmet ahmet', 25, 50000.0000, CAST(N'1997-05-21T00:00:00.000' AS DateTime), N'istanbul')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (7, N'ilayda erdem', 24, 50000.0000, CAST(N'1998-01-23T00:00:00.000' AS DateTime), N'istanbul')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (8, N'veli', 45, 5000.0000, CAST(N'1996-12-22T00:00:00.000' AS DateTime), N'istanbul')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (9, N'Alperen', 25, 3250.0000, CAST(N'1997-05-04T00:00:00.000' AS DateTime), N'Maltepe')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (10, N'Semra', 31, 300.0000, CAST(N'1991-10-03T00:00:00.000' AS DateTime), N'Çekmeköy')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (11, N'ahmet çakar', 53, 100000.0000, CAST(N'1954-09-10T00:00:00.000' AS DateTime), N'istanbul')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (12, N'selim selim', 27, 700000.0000, CAST(N'1996-05-03T00:00:00.000' AS DateTime), N'kayseri')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (13, N'ayşe fatma', 34, NULL, NULL, NULL)
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (14, N'Berk', 25, 600000.0000, CAST(N'1997-03-06T00:00:00.000' AS DateTime), N'istanbul')
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Yas], [Bakiye], [DogumTarihi], [Adres]) VALUES (15, N'Gamze', 30, 50000000.0000, CAST(N'1992-08-08T00:00:00.000' AS DateTime), N'İstanbul')
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Otel] ON 

INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (1, 12, N'ghjg', N'jjjdjm')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (2, 11, N'karasuotel', N'sakarya')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (3, 6, N'Ramada', N'İstanbul')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (4, 3, N'kllklklk', N'llklklk')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (5, 5, N'Ramada', N'Keçiköy')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (6, 11, N'kalamış otel', N'istanbul')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (7, 13, N'pink', N'istanbul')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (8, 3, N'NG', N'İzmir')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (9, 2, N'Hotel California', N'California USA')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (10, 6, N'resort hotel', N'bodrum')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (11, 15, N'The Marmara', N'Taksim')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (12, 5, N'hgkjhgkj', N'balıkesir')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (13, 11, N'NG', N'Antalya')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (14, 4, N'Otel321', N'Istanbul')
INSERT [dbo].[Otel] ([OtelNo], [MusteriNo], [OtelAdi], [OtelAdres]) VALUES (15, 13, N'NG', N'Muğla')
SET IDENTITY_INSERT [dbo].[Otel] OFF
GO
SET IDENTITY_INSERT [dbo].[Subeler] ON 

INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (1, 4, N'klklklkl', N'şllklklk')
INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (2, 3, N'kjkl', NULL)
INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (3, 8, N'yıldız', N'istanbul')
INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (6, 6, N'istanbul', N'marmara')
INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (7, 10, N'bodrum', N'akdeniz')
INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (8, 11, N'jhfjg', N'Karadeniz')
INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (10, 3, N'k', N'l')
INSERT [dbo].[Subeler] ([SubeNo], [OtelNo], [SubeAdi], [SubeBolge]) VALUES (11, 11, N'Pera', N'Beyoğlu')
SET IDENTITY_INSERT [dbo].[Subeler] OFF
GO
ALTER TABLE [dbo].[MKimlik]  WITH CHECK ADD  CONSTRAINT [FK_MKimlik_Musteriler] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[Musteriler] ([MusteriNo])
GO
ALTER TABLE [dbo].[MKimlik] CHECK CONSTRAINT [FK_MKimlik_Musteriler]
GO
ALTER TABLE [dbo].[Otel]  WITH CHECK ADD  CONSTRAINT [FK_Otel_Musteriler] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[Musteriler] ([MusteriNo])
GO
ALTER TABLE [dbo].[Otel] CHECK CONSTRAINT [FK_Otel_Musteriler]
GO
ALTER TABLE [dbo].[Subeler]  WITH CHECK ADD  CONSTRAINT [FK_Subeler_Otel] FOREIGN KEY([OtelNo])
REFERENCES [dbo].[Otel] ([OtelNo])
GO
ALTER TABLE [dbo].[Subeler] CHECK CONSTRAINT [FK_Subeler_Otel]
GO
USE [master]
GO
ALTER DATABASE [CRM] SET  READ_WRITE 
GO
