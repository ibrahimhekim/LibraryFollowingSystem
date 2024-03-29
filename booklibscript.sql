USE [master]
GO
/****** Object:  Database [libraryFollowingSystemDB]    Script Date: 17.01.2023 11:14:37 ******/
CREATE DATABASE [libraryFollowingSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'libraryFollowingSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\libraryFollowingSystemDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'libraryFollowingSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\libraryFollowingSystemDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [libraryFollowingSystemDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [libraryFollowingSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [libraryFollowingSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [libraryFollowingSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [libraryFollowingSystemDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [libraryFollowingSystemDB] SET QUERY_STORE = OFF
GO
USE [libraryFollowingSystemDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17.01.2023 11:14:37 ******/
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
/****** Object:  Table [dbo].[Books]    Script Date: 17.01.2023 11:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [uniqueidentifier] NOT NULL,
	[BookName] [nvarchar](max) NOT NULL,
	[BookType] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[BookSubject] [nvarchar](max) NOT NULL,
	[Stock] [int] NOT NULL,
	[PublishingDate] [datetime2](7) NOT NULL,
	[BookImageFileName] [nvarchar](255) NULL,
	[AddBookDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libs]    Script Date: 17.01.2023 11:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libs](
	[UserId] [uniqueidentifier] NOT NULL,
	[BookId] [uniqueidentifier] NOT NULL,
	[GivenDate] [datetime2](7) NOT NULL,
	[ReturnDate] [datetime2](7) NOT NULL,
	[BookName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Libs] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.01.2023 11:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Password] [nvarchar](30) NOT NULL,
	[ProfileImageFileName] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NOT NULL,
	[Readed] [nvarchar](max) NULL,
	[ReadingNow] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[Penalty] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221202155930_InitialCreate', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221209133057_Lib', N'6.0.11')
GO
INSERT [dbo].[Books] ([BookId], [BookName], [BookType], [Author], [BookSubject], [Stock], [PublishingDate], [BookImageFileName], [AddBookDate]) VALUES (N'43ae9773-42f7-4511-ab5d-08daf7e88736', N'İtiraflarım', N'Roman', N'Lev Tolstoy', N'Aşağıya bakmak korkutucu.Eğer aşağıya bakarsam tutunduğum son şerit de elimden kaçacak ve yok olacakmışım gibi hissediyorum. Bakmıyorum, fakat bakmamak daha da kötü çünkü şimdi de son şerit koptuğunda başıma gelecek olanları düşünüyorum. Müthiş bir dehşetle gücümün son damlasını da tükettiğimi hissediyorum, sırtım boşluğa gittikçe daha da çöküyor. Bir saniye sonra düşeceğim. Aniden aklıma bir fikir geliyor: Bu gerçek olamaz. Bu yalnızca bir rüya.', 15, CAST(N'2017-01-26T00:00:00.0000000' AS DateTime2), N'p_İtiraflarımLev Tolstoy.jpg', CAST(N'2023-01-16T20:38:49.9228339' AS DateTime2))
INSERT [dbo].[Books] ([BookId], [BookName], [BookType], [Author], [BookSubject], [Stock], [PublishingDate], [BookImageFileName], [AddBookDate]) VALUES (N'1e084630-aa1a-46ca-ab5e-08daf7e88736', N'Atıksız Yaşam -Değerlerini Yaşamanın Yolu', N'Sosyoloji', N'Ceren Özcan Tatar', N'İklim kriziyle mücadelede atıksız yaşam önemlidir. Atıksız yaşam gezegenle barışık, zararsız ve sade yaşam pratiklerinden geçer.   Tüketim alışkanlıklarımızı değiştirmek, kullan-at kültürünü terk etmek ve atık biriktirmeden yaşamak mümkün! Bu, hep beraber yapıldığında ise daha anlamlı. Ceren Özcan Tatar, atıksız yaşama geçişte ilk adımın önemini vurguluyor ve okurlarını dönüşüme davet ediyor. Peki, nasıl atıksız yaşarız?   Yazar; yeniden kullanmayı, tüketimi azaltmayı, ayrıştırmayı ve dönüştürmeyi kendi deneyimlerinden yola çıkarak okurlarıyla paylaşıyor. Kişisel bakım ürünlerinden mutfak alışverişine, kompost yapımından plastik tüketimine kadar olan meseleler, açıklayıcı ve detaylı bir anlatımla “atıksız yaşama rehberine” dönüşüyor.   Bu kitap, “Bir kişi tek başına neyi değiştirebilir ki?” diyenler için gerçek bir yol gösterici.', 20, CAST(N'2021-07-09T00:00:00.0000000' AS DateTime2), N'p_Atıksız Yaşam -Değerlerini Yaşamanın YoluCeren Özcan Tatar.jpg', CAST(N'2023-01-16T20:40:55.2184247' AS DateTime2))
INSERT [dbo].[Books] ([BookId], [BookName], [BookType], [Author], [BookSubject], [Stock], [PublishingDate], [BookImageFileName], [AddBookDate]) VALUES (N'49068485-c01a-4bd4-ab5f-08daf7e88736', N'Hayvan Çiftliği', N'Roman', N'George Orwell', N'İngiliz yazar George Orwell (1903-1950), ülkemizde daha çok 1984 adlı kitabıyla tanınır. Hayvan Çiftliği, onun çağdaş klasikler arasına girmiş ikinci ünlü yapıtıdır. 1940''lardaki ''reel sosyalizm''in eleştirisi olan bu roman, dünya edebiyatında ''yergi'' türünün başyapıtlarından biridir. Hayvan Çiftliği''nin kişileri hayvanlardır. George Orwell, bu romanında tarihsel bir gerçeği eleştirmektedir. Romandaki önder domuzun, düpedüz Stalin''i simgelediği açıkça görülecektir. Öbür kişiler bire bir belli olmasalar da, bir diktatörlük ortamında yer albilecek kişilerdir. Romanın alt başlığı Bir Peri Masalı''dır. Küçükleri eğlendirecek bir peri masalı değildir; ama roman, bir masal anlatımıyla yazılmıştır.', 24, CAST(N'2019-10-04T00:00:00.0000000' AS DateTime2), N'p_Hayvan ÇiftliğiGeorge Orwell.jpg', CAST(N'2023-01-16T20:43:03.3407806' AS DateTime2))
GO
INSERT [dbo].[Users] ([UserId], [UserName], [FullName], [Password], [ProfileImageFileName], [Role], [Readed], [ReadingNow], [CreateDate], [Penalty], [Locked]) VALUES (N'adfc7ab4-c0c2-47eb-e9b7-08dae50b252a', N'ibrahim', NULL, N'123456', NULL, N'admin', NULL, NULL, CAST(N'2022-12-23T20:28:45.6846350' AS DateTime2), 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [FullName], [Password], [ProfileImageFileName], [Role], [Readed], [ReadingNow], [CreateDate], [Penalty], [Locked]) VALUES (N'3c859cdc-15ea-420a-e9b9-08dae50b252a', N'bekir', NULL, N'123456', NULL, N'user', NULL, NULL, CAST(N'2022-12-23T20:29:10.8367469' AS DateTime2), 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [FullName], [Password], [ProfileImageFileName], [Role], [Readed], [ReadingNow], [CreateDate], [Penalty], [Locked]) VALUES (N'78bfa4e2-a9d6-4ec6-61e5-08daf7e626e7', N'yunus', NULL, N'123456', NULL, N'moderator', NULL, NULL, CAST(N'2023-01-16T20:21:49.2761404' AS DateTime2), 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [FullName], [Password], [ProfileImageFileName], [Role], [Readed], [ReadingNow], [CreateDate], [Penalty], [Locked]) VALUES (N'ce75c49b-6586-440e-0993-08daf7e78d34', N'gökhan', NULL, N'123456', NULL, N'user', NULL, NULL, CAST(N'2023-01-16T20:31:50.4067430' AS DateTime2), 0, 0)
GO
/****** Object:  Index [IX_Libs_UserId]    Script Date: 17.01.2023 11:14:37 ******/
CREATE NONCLUSTERED INDEX [IX_Libs_UserId] ON [dbo].[Libs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Libs] ADD  DEFAULT (N'') FOR [BookName]
GO
ALTER TABLE [dbo].[Libs] ADD  DEFAULT (N'') FOR [UserName]
GO
ALTER TABLE [dbo].[Libs]  WITH CHECK ADD  CONSTRAINT [FK_Libs_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Libs] CHECK CONSTRAINT [FK_Libs_Books_BookId]
GO
ALTER TABLE [dbo].[Libs]  WITH CHECK ADD  CONSTRAINT [FK_Libs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Libs] CHECK CONSTRAINT [FK_Libs_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [libraryFollowingSystemDB] SET  READ_WRITE 
GO
