USE [master]
GO
/****** Object:  Database [Registration]    Script Date: 7/9/2024 2:07:48 PM ******/
CREATE DATABASE [Registration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Registration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Registration.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Registration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Registration_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Registration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Registration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Registration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Registration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Registration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Registration] SET ARITHABORT OFF 
GO
ALTER DATABASE [Registration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Registration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Registration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Registration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Registration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Registration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Registration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Registration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Registration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Registration] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Registration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Registration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Registration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Registration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Registration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Registration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Registration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Registration] SET RECOVERY FULL 
GO
ALTER DATABASE [Registration] SET  MULTI_USER 
GO
ALTER DATABASE [Registration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Registration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Registration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Registration] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Registration] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Registration] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Registration', N'ON'
GO
ALTER DATABASE [Registration] SET QUERY_STORE = ON
GO
ALTER DATABASE [Registration] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Registration]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/9/2024 2:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productid] [int] NULL,
	[unitprice] [float] NULL,
	[quantity] [int] NULL,
	[orderid] [varchar](5) NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/9/2024 2:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [varchar](5) NOT NULL,
	[date] [datetime] NULL,
	[customer] [varchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[email] [varchar](50) NULL,
	[total] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 7/9/2024 2:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[sku] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[sku] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/9/2024 2:07:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](30) NULL,
	[password] [varchar](20) NULL,
	[lastname] [nvarchar](100) NULL,
	[isAdmin] [bit] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (1, 4, 70000, 1, N'Od004', 70000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (2, 1, 100000, 1, N'Od004', 100000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (3, 1, 100000, 1, N'Od005', 100000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (4, 3, 80000, 2, N'Od005', 160000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (5, 4, 70000, 1, N'Od006', 70000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (6, 1, 100000, 2, N'Od006', 200000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (7, 4, 70000, 1, N'Od007', 70000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (8, 1, 100000, 1, N'Od007', 100000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (9, 1, 100000, 1, N'Od008', 100000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (10, 6, 50000, 3, N'Od008', 150000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (11, 4, 70000, 2, N'Od009', 140000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (12, 7, 40000, 2, N'Od009', 80000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (13, 1, 100000, 2, N'Od010', 200000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (14, 6, 50000, 3, N'Od010', 150000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (15, 1, 100000, 2, N'Od011', 200000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (16, 7, 40000, 3, N'Od011', 120000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (17, 1, 100000, 2, N'Od012', 200000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (18, 5, 60000, 3, N'Od012', 180000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (19, 8, 30000, 3, N'Od012', 90000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (20, 1, 100000, 1, N'Od013', 100000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (21, 8, 30000, 2, N'Od013', 60000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (22, 1, 100000, 2, N'Od014', 200000)
INSERT [dbo].[OrderDetail] ([id], [productid], [unitprice], [quantity], [orderid], [total]) VALUES (23, 5, 60000, 2, N'Od014', 120000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od001', CAST(N'2024-06-28T00:00:00.000' AS DateTime), N'dat', N'gfdgerwrdsfsd', N'datvds@gmail.com', 200000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od002', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'gfdgerwrdsfsd', N'datvds@gmail.com', 200000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od003', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'34324234', N'datvds@gmail.com', 200000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od004', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'rewr', N'datvds@gmail.com', 170000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od005', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'34324234', N'datvds@gmail.com', 260000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od006', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'rewrewrwer', N'datvds@gmail.com', 270000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od007', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'rewr', N'datvds@gmail.com', 170000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od008', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'fdfsfsdf', N'datvds@gmail.com', 250000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od009', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'rewrrere', N'datvds@gmail.com', 220000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od010', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'ffsfdf', N'datvds@gmail.com', 350000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od011', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'dat', N'fdfdf', N'datvds@gmail.com', 320000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od012', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'fdsf', N'gfdgerwrdsfsd', N'oriworkingspace@gmail.com', 470000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od013', CAST(N'2024-06-30T00:00:00.000' AS DateTime), N'fdsf', N'gfdgerwrdsfsd', N'oriworkingspace@gmail.com', 160000)
INSERT [dbo].[Orders] ([id], [date], [customer], [address], [email], [total]) VALUES (N'Od014', CAST(N'2024-07-01T00:00:00.000' AS DateTime), N'minh dat', N'dfdsfs', N'datvds@gmail.com', 320000)
GO
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (1, N'Java', N'Java Fundamental Book', 90, 100000, 1)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (2, N'MVC2', N'MVC2 Fundamental Book', 80, 90000, 1)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (3, N'Tomcat', N'Tomcat Fundamental Book', 70, 80000, 0)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (4, N'JDK', N'JDK Fundamental Book', 60, 70000, 0)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (5, N'Servlet', N'Servlet Fundamental Book', 50, 60000, 0)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (6, N'JavaBeans', N'JavaBeans Fundamental Book', 40, 50000, 0)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (7, N'JSP', N'JSP Fundamental Book', 30, 40000, 0)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (8, N'JDBC', N'JDBC Fundamental Book', 20, 30000, 1)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (9, N'Scripting Elements', N'Scripting Elements Fundamental Book', 10, 20000, 1)
INSERT [dbo].[tbl_Product] ([sku], [name], [description], [quantity], [price], [status]) VALUES (10, N'EL', N'EL Fundamental Book', 0, 10000, 1)
GO
INSERT [dbo].[Users] ([username], [password], [lastname], [isAdmin]) VALUES (N'dat', N'051207', N'dat', 1)
INSERT [dbo].[Users] ([username], [password], [lastname], [isAdmin]) VALUES (N'huonglinh', N'3424', N'linh', 1)
INSERT [dbo].[Users] ([username], [password], [lastname], [isAdmin]) VALUES (N'xuanca', N'1234', N'xuan', 0)
INSERT [dbo].[Users] ([username], [password], [lastname], [isAdmin]) VALUES (N'haha', N'678', N'hehe', 0)
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[tbl_Product] ([sku])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_product_id] FOREIGN KEY([productid])
REFERENCES [dbo].[tbl_Product] ([sku])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_product_id]
GO
USE [master]
GO
ALTER DATABASE [Registration] SET  READ_WRITE 
GO
