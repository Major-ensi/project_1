USE [master]
GO
/****** Object:  Database [main_group_project_perfect]    Script Date:6/14/2022 5:09:23 PM ******/
CREATE DATABASE [main_group_project_perfect]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'main_group_project_perfect', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\main_group_project_perfect.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'main_group_project_perfect_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\main_group_project_perfect_log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [main_group_project_perfect] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVI CEPROPERTY('IsFullTextInstalled'))
begin
EXEC [main_group_project_perfect].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [main_group_project_perfect] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET ARITHABORT OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [main_group_project_perfect] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [main_group_project_perfect] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET  DISABLE_BROKER 
GO
ALTER DATABASE [main_group_project_perfect] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [main_group_project_perfect] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET RECOVERY FULL 
GO
ALTER DATABASE [main_group_project_perfect] SET  MULTI_USER 
GO
ALTER DATABASE [main_group_project_perfect] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [main_group_project_perfect] SET DB_CHAINING OFF 
GO
ALTER DATABASE [main_group_project_perfect] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [main_group_project_perfect] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [main_group_project_perfect] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [main_group_project_perfect] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'main_group_project_perfect', N'ON'
GO
ALTER DATABASE [main_group_project_perfect] SET QUERY_STORE = OFF
GO
USE [main_group_project_perfect]
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[title] [varchar](150) NOT NULL,
	[content] [varchar](max) NOT NULL,
	[section] [varchar](50) NOT NULL,
	[priority] [varchar](50) NOT NULL,
	[verified] [bit] NOT NULL,
	[solved] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_tickets_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[unsolved_tickets]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[unsolved_tickets] AS
SELECT *
FROM tickets t
WHERE t.solved = 0;
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](300) NOT NULL,
	[desc] [varchar](max) NULL,
	[img] [varchar](50) NULL,
	[price] [int] NOT NULL,
	[off_price] [int] NULL,
	[seller_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_products_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[all_products]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[all_products] AS
SELECT * FROM products p;
GO
/****** Object:  Table [dbo].[purchases]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchases](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[bank_portal] [varchar](50) NOT NULL,
	[amount] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_purchases_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[not_verified_purchases]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[not_verified_purchases] AS
SELECT *
FROM purchases p
WHERE p.status = 'not_verified';
GO
/****** Object:  View [dbo].[verified_purchases]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[verified_purchases] AS
SELECT *
FROM purchases p
WHERE p.status = 'verified';
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[title] [varchar](150) NOT NULL,
	[content] [varchar](max) NOT NULL,
	[recommend_status] [varchar](50) NOT NULL,
	[order_id] [int] NOT NULL,
	[show_name] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_reviews_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[most_recommended_products]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[most_recommended_products] AS
SELECT p.id ,p.title , COUNT(r.recommend_status) 'High Recommend Count' FROM products p INNER JOIN reviews r ON p.id = r.product_id WHERE r.recommend_status = 'high' GROUP BY p.id , p.title;
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](150) NOT NULL,
	[last_name] [varchar](150) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[phone_number2] [varchar](50) NULL,
	[city] [varchar](120) NOT NULL,
	[state] [varchar](120) NOT NULL,
	[address] [varchar](max) NOT NULL,
	[postal_code] [varchar](50) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_addresses_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cartitems]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartitems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[price_off] [int] NULL,
	[total] [int] NOT NULL,
	[total_off] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_cartitems_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[total] [int] NOT NULL,
	[total_off] [int] NULL,
	[count] [int] NOT NULL,
	[second_cart] [bit] NOT NULL,
	[active_cart] [bit] NOT NULL,
	[coupon_code] [varchar](max) NULL,
	[coupon_amount] [int] NULL,
	[coupon_id] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_carts_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](150) NOT NULL,
	[slug] [varchar](150) NOT NULL,
	[parent_id] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_categories_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coupons]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coupons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](max) NOT NULL,
	[amount] [int] NOT NULL,
	[expired_at] [datetime2](7) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_coupons_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customercoupons]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customercoupons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[coupon_id] [int] NOT NULL,
	[expired_at] [datetime2](7) NOT NULL,
	[useable_count] [smallint] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_customercoupons_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](300) NOT NULL,
	[first_name] [varchar](150) NOT NULL,
	[last_name] [varchar](150) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[state] [varchar](120) NOT NULL,
	[city] [varchar](120) NOT NULL,
	[address] [varchar](max) NOT NULL,
	[postal_code] [varchar](50) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_customers_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderitems]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderitems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[single_price] [int] NOT NULL,
	[total_price] [int] NOT NULL,
	[off_price] [int] NULL,
	[totaloff_price] [int] NULL,
	[quantity] [smallint] NOT NULL,
	[product_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderItems_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[total_price] [int] NOT NULL,
	[total_count] [smallint] NOT NULL,
	[payment] [varchar](50) NOT NULL,
	[verification] [varchar](50) NOT NULL,
	[address_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_orders_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_category]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NULL,
 CONSTRAINT [PK_product_category_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviewitems]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviewitems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[review_id] [int] NOT NULL,
	[tip_sentence] [varchar](300) NOT NULL,
	[tip_type] [varchar](50) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_reviewitems_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[is_admin] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_roles_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sellers]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sellers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](300) NOT NULL,
	[owner_name] [varchar](200) NOT NULL,
	[name] [varchar](300) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[phone_number] [varchar](50) NOT NULL,
	[state] [varchar](100) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[address] [varchar](max) NOT NULL,
	[postal_code] [varchar](50) NOT NULL,
	[logo_img] [varchar](max) NOT NULL,
	[desc] [varchar](max) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_sellers_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](300) NOT NULL,
	[username] [varchar](150) NOT NULL,
	[first_name] [varchar](150) NOT NULL,
	[last_name] [varchar](150) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[role_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[wallets]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wallets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[seller_id] [int] NOT NULL,
	[balance] [int] NOT NULL,
	[locked] [bit] NOT NULL,
	[bank_card_number] [varchar](100) NOT NULL,
	[card_verification] [varchar](50) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_wallets_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[withdraws]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[withdraws](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[wallet_id] [int] NOT NULL,
	[card_number] [varchar](100) NOT NULL,
	[bank_name] [varchar](100) NOT NULL,
	[amount] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[updated_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_withdraws_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[addresses] ON 

INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (1, N'University', 1, N' Amir Reza ', N' Yousefvand ', N'9903118135', N'021-88445566', N'Tehran', N'Tehran', N'Poonak - Hamila', N'147852', CAST(N'2022-12-01T13:58:49.8800100' AS DateTime2), CAST(N'2022-12-01T13:58:49.8800100' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (2, N'Home', 1, N' Amir Reza ', N' Yousefvand ', N'9903118135', N'021-88445566', N'Tehran', N'Tehran', N'Janat Abad Shomali', N'258741', CAST(N'2022-12-01T13:59:47.1717969' AS DateTime2), CAST(N'2022-12-01T13:59:47.1717969' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (3, N'Work', 1, N' Amir Reza ', N' Yousefvand ', N'9903118135', N'021-33669988', N'Tehran', N'Tehran', N'Jordan', N'025874', CAST(N'2022-12-01T14:00:46.5770126' AS DateTime2), CAST(N'2022-12-01T14:00:46.5770126' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (4, N'Zahedi - Home', 2, N' Ebrahim ', N' Falahi ', N'9121234567', N'021-12345678', N'Tehran', N'Tehran', N'Gheitarieh', N'123456', CAST(N'2022-12-04T22:06:23.5653469' AS DateTime2), CAST(N'2022-12-04T22:06:23.5653469' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (5, N'Zahedi - Work', 2, N' Ebrahim ', N' Falahi ', N'9121234567', N'021-12345678', N'Tehran', N'Tehran', N'Sattar Khan', N'123456', CAST(N'2022-12-04T22:07:01.1844886' AS DateTime2), CAST(N'2022-12-04T22:07:01.1844886' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (6, N'Home - Rasht', 6, N' Fatemeh ', N' Bahirai ', N'9125522447', NULL, N'Rasht', N'Gilaan', N'First Avenue', N'123456', CAST(N'2022-12-04T22:12:44.6995496' AS DateTime2), CAST(N'2022-12-04T22:12:44.6995496' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (9, N'Home - Teh', 6, N' Leo ', N' Shamirian ', N'9122345687', NULL, N'Tehran', N'Tehran', N'Second Avenue', N'123456', CAST(N'2022-12-04T22:13:50.3741166' AS DateTime2), CAST(N'2022-12-04T22:13:50.3741166' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (10, N'Main', 9, N'Ensie', N'Khademi', N'9121234567', NULL, N'Tehran', N'Tehran', N'Third Avenue', N'123456', CAST(N'2022-12-05T07:40:05.8383196' AS DateTime2), CAST(N'2022-12-05T07:40:05.8383196' AS DateTime2))
INSERT [dbo].[addresses] ([id], [title], [customer_id], [first_name], [last_name], [phone_number], [phone_number2], [city], [state], [address], [postal_code], [created_at], [updated_at]) VALUES (11, N'Hossein - Home', 8, N'Hossein', N'Halaji', N'9123547882', NULL, N'Tehran', N'Tehran', N'Pasdaran', N'123456', CAST(N'2022-12-05T23:08:18.5548137' AS DateTime2), CAST(N'2022-12-05T23:08:18.5548137' AS DateTime2))
SET IDENTITY_INSERT [dbo].[addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[cartitems] ON 

INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (2, 1, 9, 1, 3700000, NULL, 3700000, NULL, CAST(N'2022-12-06T12:45:22.7212069' AS DateTime2), CAST(N'2022-12-06T12:45:22.7212069' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (3, 1, 10, 1, 2500000, NULL, 2500000, NULL, CAST(N'2022-12-06T12:45:44.3664348' AS DateTime2), CAST(N'2022-12-06T12:45:44.3664348' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (6, 3, 23, 1, 112000000, 105000000, 112000000, 105000000, CAST(N'2022-12-06T12:50:23.2835062' AS DateTime2), CAST(N'2022-12-06T12:50:23.2835062' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (9, 4, 42, 1, 7200000, NULL, 7200000, NULL, CAST(N'2022-12-06T12:51:13.8266292' AS DateTime2), CAST(N'2022-12-06T12:51:13.8266292' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (11, 5, 26, 2, 250000, NULL, 500000, NULL, CAST(N'2022-12-06T13:15:55.6831705' AS DateTime2), CAST(N'2022-12-06T13:15:55.6831705' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (13, 5, 28, 2, 255000, NULL, 510000, NULL, CAST(N'2022-12-06T13:16:28.5967584' AS DateTime2), CAST(N'2022-12-06T13:16:28.5967584' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (14, 5, 19, 5, 720000, NULL, 3600000, NULL, CAST(N'2022-12-06T13:17:03.0970576' AS DateTime2), CAST(N'2022-12-06T13:17:03.0970576' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (15, 5, 34, 1, 450000, NULL, 450000, NULL, CAST(N'2022-12-06T13:17:29.3460582' AS DateTime2), CAST(N'2022-12-06T13:17:29.3460582' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (16, 5, 35, 1, 470000, NULL, 470000, NULL, CAST(N'2022-12-06T13:17:49.7639028' AS DateTime2), CAST(N'2022-12-06T13:17:49.7639028' AS DateTime2))
INSERT [dbo].[cartitems] ([id], [cart_id], [product_id], [quantity], [price], [price_off], [total], [total_off], [created_at], [updated_at]) VALUES (17, 5, 18, 1, 950000, NULL, 950000, NULL, CAST(N'2022-12-06T13:18:48.0850159' AS DateTime2), CAST(N'2022-12-06T13:18:48.0850159' AS DateTime2))
SET IDENTITY_INSERT [dbo].[cartitems] OFF
GO
SET IDENTITY_INSERT [dbo].[carts] ON 

INSERT [dbo].[carts] ([id], [customer_id], [total], [total_off], [count], [second_cart], [active_cart], [coupon_code], [coupon_amount], [coupon_id], [created_at], [updated_at]) VALUES (1, 1, 6200000, NULL, 2, 0, 1, NULL, NULL, NULL, CAST(N'2022-12-06T12:44:34.4939984' AS DateTime2), CAST(N'2022-12-06T12:47:08.8830502' AS DateTime2))
INSERT [dbo].[carts] ([id], [customer_id], [total], [total_off], [count], [second_cart], [active_cart], [coupon_code], [coupon_amount], [coupon_id], [created_at], [updated_at]) VALUES (3, 1, 112000000, 105000000, 1, 1, 0, NULL, NULL, NULL, CAST(N'2022-12-06T12:47:51.7294297' AS DateTime2), CAST(N'2022-12-06T13:11:30.2942818' AS DateTime2))
INSERT [dbo].[carts] ([id], [customer_id], [total], [total_off], [count], [second_cart], [active_cart], [coupon_code], [coupon_amount], [coupon_id], [created_at], [updated_at]) VALUES (4, 2, 7200000, NULL, 1, 0, 1, N'KU52esZJ', 10000, 2, CAST(N'2022-12-06T12:49:17.3797077' AS DateTime2), CAST(N'2022-12-06T13:11:49.8215197' AS DateTime2))
INSERT [dbo].[carts] ([id], [customer_id], [total], [total_off], [count], [second_cart], [active_cart], [coupon_code], [coupon_amount], [coupon_id], [created_at], [updated_at]) VALUES (5, 6, 6480000, NULL, 11, 0, 1, NULL, NULL, NULL, CAST(N'2022-12-06T13:15:11.2828050' AS DateTime2), CAST(N'2022-12-06T13:19:00.4675783' AS DateTime2))
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (2, N'Electronics', N'electronics', NULL, CAST(N'2022-12-04T15:16:54.1663993' AS DateTime2), CAST(N'2022-12-04T15:16:54.1663993' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (3, N'Smart Phones', N'smart-phones', 2, CAST(N'2022-12-04T15:17:09.1189013' AS DateTime2), CAST(N'2022-12-04T15:17:09.1189013' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (4, N'Laptops', N'laptops', 2, CAST(N'2022-12-04T15:17:26.6640522' AS DateTime2), CAST(N'2022-12-04T15:17:26.6640522' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (5, N'tablets', N'tablets', 2, CAST(N'2022-12-04T15:17:39.3436613' AS DateTime2), CAST(N'2022-12-04T15:17:39.3436613' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (6, N'Ebook Reader', N'ebook-reader', 2, CAST(N'2022-12-04T15:17:55.0215031' AS DateTime2), CAST(N'2022-12-04T15:17:55.0215031' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (7, N'Clothing', N'clothing', NULL, CAST(N'2022-12-04T16:07:13.8359976' AS DateTime2), CAST(N'2022-12-04T16:07:13.8359976' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (8, N'T-Shirts', N't-shirts', 7, CAST(N'2022-12-04T16:07:32.9409602' AS DateTime2), CAST(N'2022-12-04T16:07:32.9409602' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (9, N'Shoes', N'shoes', 7, CAST(N'2022-12-04T16:07:45.5283417' AS DateTime2), CAST(N'2022-12-04T16:07:45.5283417' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (10, N'Pants', N'pants', 7, CAST(N'2022-12-04T16:09:04.5741513' AS DateTime2), CAST(N'2022-12-04T16:09:04.5741513' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (11, N'Caps', N'caps', 7, CAST(N'2022-12-04T16:09:41.9451815' AS DateTime2), CAST(N'2022-12-04T16:09:41.9451815' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (12, N'Clothing Accessories', N'clothing-accessories', 7, CAST(N'2022-12-04T16:10:53.9190842' AS DateTime2), CAST(N'2022-12-04T16:10:53.9190842' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (13, N'Computer Components', N'computer-components', NULL, CAST(N'2022-12-04T16:11:10.0450970' AS DateTime2), CAST(N'2022-12-04T16:11:10.0450970' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (14, N'Processor (CPU)', N'processor-cpu', 13, CAST(N'2022-12-04T16:11:44.6067554' AS DateTime2), CAST(N'2022-12-04T16:12:01.7914630' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (15, N'Motherboard', N'motherboard', 13, CAST(N'2022-12-04T16:12:32.5902289' AS DateTime2), CAST(N'2022-12-04T16:12:32.5902289' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (16, N'Storages', N'storages', 13, CAST(N'2022-12-04T16:12:53.1215914' AS DateTime2), CAST(N'2022-12-04T16:12:53.1215914' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (17, N'SSD', N'ssd', 16, CAST(N'2022-12-04T16:13:04.4185299' AS DateTime2), CAST(N'2022-12-04T16:13:04.4185299' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (18, N'HDD', N'hdd', 16, CAST(N'2022-12-04T16:13:13.4556813' AS DateTime2), CAST(N'2022-12-04T16:13:13.4556813' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (19, N'Flash Drives', N'flash-drives', 16, CAST(N'2022-12-04T16:13:33.1492634' AS DateTime2), CAST(N'2022-12-04T16:13:33.1492634' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (20, N'Graphic Cards', N'graphic-cards', 13, CAST(N'2022-12-04T16:14:06.4375880' AS DateTime2), CAST(N'2022-12-04T16:14:06.4375880' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (21, N'Keyboards', N'keyboards', 13, CAST(N'2022-12-04T16:14:23.5469811' AS DateTime2), CAST(N'2022-12-04T16:14:23.5469811' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (22, N'Mices', N'mices', 13, CAST(N'2022-12-04T16:14:40.0210028' AS DateTime2), CAST(N'2022-12-04T16:14:40.0210028' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (23, N'Sound Cards', N'sound-cards', 13, CAST(N'2022-12-04T16:14:52.1009726' AS DateTime2), CAST(N'2022-12-04T16:14:52.1009726' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (24, N'Gifts', N'gifts', NULL, CAST(N'2022-12-04T16:19:55.7654861' AS DateTime2), CAST(N'2022-12-04T16:19:55.7654861' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (25, N'Amazon Electronics', N'amazon-electronics', 2, CAST(N'2022-12-04T16:21:35.0876041' AS DateTime2), CAST(N'2022-12-04T16:21:35.0876041' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (26, N'Smart Watches', N'smart-watches', 2, CAST(N'2022-12-04T16:23:11.1689158' AS DateTime2), CAST(N'2022-12-04T16:23:11.1689158' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (27, N'Books and Movies', N'books-and-movies', NULL, CAST(N'2022-12-04T16:35:41.5050814' AS DateTime2), CAST(N'2022-12-04T16:35:41.5050814' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (28, N'Books', N'books', 27, CAST(N'2022-12-04T16:35:51.2188797' AS DateTime2), CAST(N'2022-12-04T16:35:51.2188797' AS DateTime2))
INSERT [dbo].[categories] ([id], [title], [slug], [parent_id], [created_at], [updated_at]) VALUES (29, N'Movies', N'movies', 27, CAST(N'2022-12-04T16:36:01.3900769' AS DateTime2), CAST(N'2022-12-04T16:36:01.3900769' AS DateTime2))
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[coupons] ON 

INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (1, N'ZP73hbUG', 500000, CAST(N'2022-03-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:17:24.2945385' AS DateTime2), CAST(N'2022-12-06T12:17:24.2945385' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (2, N'KU52esZJ', 10000, CAST(N'2022-01-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:17:49.6723554' AS DateTime2), CAST(N'2022-12-06T12:17:49.6723554' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (3, N'GU86v7QC', 25000, CAST(N'2022-01-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:18:18.9813791' AS DateTime2), CAST(N'2022-12-06T12:18:18.9813791' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (4, N'XF83UqV5', 900000, CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:18:39.1598375' AS DateTime2), CAST(N'2022-12-06T12:18:39.1598375' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (5, N'LC23f9B7', 256000, CAST(N'2022-12-31T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:19:05.3261056' AS DateTime2), CAST(N'2022-12-06T12:19:05.3261056' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (6, N'AQ79ycJ4', 78000, CAST(N'2022-01-08T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:19:23.5171532' AS DateTime2), CAST(N'2022-12-06T12:19:23.5171532' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (7, N'WY35oJPR', 2500000, CAST(N'2022-10-28T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:19:51.2749362' AS DateTime2), CAST(N'2022-12-06T12:19:51.2749362' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (8, N'WE69QeWG', 145000, CAST(N'2022-12-05T12:20:15.7927830' AS DateTime2), CAST(N'2022-12-06T12:20:19.0974500' AS DateTime2), CAST(N'2022-12-06T12:20:19.0974500' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (9, N'DA99iLFZ', 290000, CAST(N'2022-12-24T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:20:44.9303573' AS DateTime2), CAST(N'2022-12-06T12:20:44.9303573' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (10, N'MS86LN8B', 200000, CAST(N'2022-11-25T12:21:02.8332782' AS DateTime2), CAST(N'2022-12-06T12:21:07.5440236' AS DateTime2), CAST(N'2022-12-06T12:21:07.5440236' AS DateTime2))
INSERT [dbo].[coupons] ([id], [code], [amount], [expired_at], [created_at], [updated_at]) VALUES (11, N'JL68B[5D', 650000, CAST(N'2022-02-17T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T12:21:32.5146387' AS DateTime2), CAST(N'2022-12-06T12:21:32.5146387' AS DateTime2))
SET IDENTITY_INSERT [dbo].[coupons] OFF
GO
SET IDENTITY_INSERT [dbo].[customercoupons] ON 

INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (3, 1, 1, CAST(N'2022-02-17T00:00:00.0000000' AS DateTime2), 1, CAST(N'2022-12-06T12:26:47.9956814' AS DateTime2), CAST(N'2022-12-06T12:26:47.9956814' AS DateTime2))
INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (4, 1, 2, CAST(N'2022-01-17T00:00:00.0000000' AS DateTime2), 0, CAST(N'2022-12-06T12:27:07.7979860' AS DateTime2), CAST(N'2022-12-06T12:27:14.9759996' AS DateTime2))
INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (7, 6, 7, CAST(N'2022-10-18T00:00:00.0000000' AS DateTime2), 2, CAST(N'2022-12-06T12:28:17.7127354' AS DateTime2), CAST(N'2022-12-06T12:28:17.7127354' AS DateTime2))
INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (9, 6, 11, CAST(N'2022-02-13T00:00:00.0000000' AS DateTime2), 0, CAST(N'2022-12-06T12:28:54.7647750' AS DateTime2), CAST(N'2022-12-06T12:28:54.7647750' AS DateTime2))
INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (10, 9, 5, CAST(N'2022-12-20T00:00:00.0000000' AS DateTime2), 3, CAST(N'2022-12-06T12:29:19.5652521' AS DateTime2), CAST(N'2022-12-06T12:29:19.5652521' AS DateTime2))
INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (12, 8, 9, CAST(N'2022-12-24T00:00:00.0000000' AS DateTime2), 2, CAST(N'2022-12-06T12:29:59.6771712' AS DateTime2), CAST(N'2022-12-06T12:29:59.6771712' AS DateTime2))
INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (14, 2, 3, CAST(N'2022-01-19T00:00:00.0000000' AS DateTime2), 1, CAST(N'2022-12-06T12:30:30.5578330' AS DateTime2), CAST(N'2022-12-06T12:30:30.5578330' AS DateTime2))
INSERT [dbo].[customercoupons] ([id], [customer_id], [coupon_id], [expired_at], [useable_count], [created_at], [updated_at]) VALUES (15, 2, 1, CAST(N'2022-03-09T00:00:00.0000000' AS DateTime2), 1, CAST(N'2022-12-06T12:31:03.0645149' AS DateTime2), CAST(N'2022-12-06T12:31:03.0645149' AS DateTime2))
SET IDENTITY_INSERT [dbo].[customercoupons] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 

INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (1, N' amirreza.yose@gmail.com ', N' Amir Reza', N' Yousefvand ', N'123456', N'9903118135', N'Tehran', N'Tehran', N'Poonak', N'123456', CAST(N'2022-12-01T13:28:03.6159700' AS DateTime2), CAST(N'2022-12-01T13:28:03.6159700' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (2, N' ebrahimfl8081@gmail.com ', N' Ebrahim', N' Falahi', N'369258', N'9121234567', N'Tehran', N'Tehran', N'Address 1', N'258741', CAST(N'2022-12-01T13:29:41.2285162' AS DateTime2), CAST(N'2022-12-01T13:29:41.2285162' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (6, N'bahiraeifatemeh8@gmail.com', N' Fatemeh', N' Bahirai ', N'147852', N'9123698524', N'Tehran', N'Tehran', N'Address 2', N'852147', CAST(N'2022-12-01T13:31:03.1781225' AS DateTime2), CAST(N'2022-12-01T13:31:03.1781225' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (8, N' Hossein _Halaji@gmail.com', N'Hossein', N'Halaji', N'021021', N'9124565456', N'Tehran', N'Tehran', N'Address 3', N'121245', CAST(N'2022-12-01T13:37:30.7042105' AS DateTime2), CAST(N'2022-12-01T13:37:30.7042105' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (9, N'Ensie_khademi@gmail.com', N'Ensie', N'Khademi', N'112233', N'9129876543', N'Tehran', N'Tehran', N'Address 4', N'259634', CAST(N'2022-12-01T13:39:18.7687543' AS DateTime2), CAST(N'2022-12-01T22:44:41.2614534' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (11, ' Leo_shamirian@gmail.com ', N' Leo ', N' shamirian ', N' Leo shamiiiiirian ', N'9122345687', N'', Tehran, N'7 Tehran ', N'123456', CAST(N'2022-12-03T21:01:40.2517352' AS DateTime2), CAST(N'2022-12-03T21:01:40.2517352' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (12, N'sir_drake@gmail.com', N'Drake', N'Drake', N'drakepass123', N'98025478587', N'Ontario', N'Toronto', N'Ca,Ontario,Toronto,123', N'258741', CAST(N'2022-12-03T21:03:33.7933260' AS DateTime2), CAST(N'2022-12-03T21:03:33.7933260' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (13, N'ariana_grande@gmail.com', N'Ariana', N'Grande', N'arianag123', N'7896654123', N'Florida', N'Miami', N'US,FL,Miami,123', N'123456', CAST(N'2022-12-03T21:04:59.5746882' AS DateTime2), CAST(N'2022-12-03T21:04:59.5746882' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (14, N'sabrina_carpenter@gmail.com', N'Sabrina', N'Carpenter', N'sabrinaaaa123', N'8754545445', N'California', N'Los Angeles', N'7 avenue', N'123456', CAST(N'2022-12-03T21:06:21.0152230' AS DateTime2), CAST(N'2022-12-03T21:06:21.0152230' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (15, N'jack_harlow@gmail.com', N'Jack', N'Harlow', N'jackjackjack', N'021021021', N'Kentucky', N'Shelbyville', N'7 avenue', N'123456', CAST(N'2022-12-03T21:08:29.2863939' AS DateTime2), CAST(N'2022-12-03T21:08:29.2863939' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (16, N'javaad_ezati@gmail.com', N'Javaad', N'Ezati', N'javad123123', N'0912454578', N'Tehran', N'Tehran', N'niavaran', N'123456', CAST(N'2022-12-03T21:10:18.1298988' AS DateTime2), CAST(N'2022-12-03T21:10:18.1298988' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (18, N'javad_khaajavi@gmail.com', N'Javad', N'Khajavi', N'javadkh987', N'0912353535', N'Khorasan Jonoobi', N'Mashhad', N'khiaban aval', N'123456', CAST(N'2022-12-03T21:11:52.2403126' AS DateTime2), CAST(N'2022-12-03T21:11:52.2403126' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (19, N'elnaz_habibi@gmail.com', N'Elnaz', N'Habibi', N'elnaazpss', N'0912252525', N'Tehran', N'Tehran', N'7 avenue', N'123456', CAST(N'2022-12-03T21:14:44.8637481' AS DateTime2), CAST(N'2022-12-03T21:14:44.8637481' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (21, N'miley_cyrus@gmail.com', N'Miley', N'Cyrus', N'mileymileypss', N'1425874525', N'California', N'Los Angeles', N'7 avenue', N'258741', CAST(N'2022-12-03T21:17:55.9546009' AS DateTime2), CAST(N'2022-12-03T21:17:55.9546009' AS DateTime2))
INSERT [dbo].[customers] ([id], [email], [first_name], [last_name], [password], [phone_number], [state], [city], [address], [postal_code], [created_at], [updated_at]) VALUES (22, N'bruno_mars@gmail.com', N'Bruno', N'Mars', N'bruno0mars', N'0235478014', N'Illinois', N'Chicago', N'7 avenue', N'457896', CAST(N'2022-12-03T21:19:10.2959970' AS DateTime2), CAST(N'2022-12-03T21:19:10.2959970' AS DateTime2))
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[orderitems] ON 

INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (2, 3, 950000, 950000, NULL, NULL, 1, 18, CAST(N'2022-12-04T21:55:36.6197417' AS DateTime2), CAST(N'2022-12-04T21:58:50.1333202' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (4, 3, 80000, 80000, NULL, NULL, 1, 25, CAST(N'2022-12-04T21:56:04.0286496' AS DateTime2), CAST(N'2022-12-04T21:58:53.3595409' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (5, 3, 3700000, 3700000, NULL, NULL, 1, 9, CAST(N'2022-12-04T21:59:35.1353172' AS DateTime2), CAST(N'2022-12-04T21:59:54.6781381' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (6, 4, 32000, 64000, 30000, 60000, 2, 24, CAST(N'2022-12-04T22:02:40.7421959' AS DateTime2), CAST(N'2022-12-04T22:02:40.7421959' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (7, 4, 2600000, 2600000, 2470000, 2470000, 1, 36, CAST(N'2022-12-04T22:03:28.8344682' AS DateTime2), CAST(N'2022-12-04T22:03:28.8344682' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (8, 5, 45600000, 45600000, NULL, NULL, 1, 46, CAST(N'2022-12-04T22:09:09.7243273' AS DateTime2), CAST(N'2022-12-04T22:09:09.7243273' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (9, 6, 112000000, 336000000, NULL, NULL, 3, 44, CAST(N'2022-12-04T22:10:40.7887635' AS DateTime2), CAST(N'2022-12-04T22:10:40.7887635' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (10, 7, 250000, 250000, NULL, NULL, 1, 26, CAST(N'2022-12-04T22:15:22.3006444' AS DateTime2), CAST(N'2022-12-04T22:15:22.3006444' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (11, 7, 255000, 255000, NULL, NULL, 1, 28, CAST(N'2022-12-04T22:15:40.2679021' AS DateTime2), CAST(N'2022-12-04T22:15:40.2679021' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (13, 7, 350000, 350000, NULL, NULL, 1, 30, CAST(N'2022-12-04T22:16:05.7381360' AS DateTime2), CAST(N'2022-12-04T22:16:05.7381360' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (16, 7, 278000, 278000, NULL, NULL, 1, 31, CAST(N'2022-12-04T22:16:26.1673213' AS DateTime2), CAST(N'2022-12-04T22:16:26.1673213' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (18, 7, 340000, 340000, NULL, NULL, 1, 32, CAST(N'2022-12-04T22:16:43.2830655' AS DateTime2), CAST(N'2022-12-04T22:16:45.8829953' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (19, 8, 3700000, 3700000, NULL, NULL, 1, 9, CAST(N'2022-12-05T07:40:54.6030895' AS DateTime2), CAST(N'2022-12-05T07:41:21.7265317' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (20, 8, 2500000, 2500000, NULL, NULL, 1, 10, CAST(N'2022-12-05T07:41:03.7169075' AS DateTime2), CAST(N'2022-12-05T07:41:30.9910994' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (21, 8, 2900000, 2900000, NULL, NULL, 1, 11, CAST(N'2022-12-05T07:41:14.2248338' AS DateTime2), CAST(N'2022-12-05T07:41:43.9891184' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (22, 9, 2500000, 2500000, NULL, NULL, 2, 10, CAST(N'2022-12-05T22:37:14.2823375' AS DateTime2), CAST(N'2022-12-05T22:37:15.0351995' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (24, 10, 8500000, 8500000, NULL, NULL, 1, 41, CAST(N'2022-12-05T23:09:21.1003140' AS DateTime2), CAST(N'2022-12-05T23:09:24.9058047' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (26, 10, 53000000, 53000000, NULL, NULL, 1, 45, CAST(N'2022-12-05T23:09:50.1563238' AS DateTime2), CAST(N'2022-12-05T23:09:52.3169056' AS DateTime2))
INSERT [dbo].[orderitems] ([id], [order_id], [single_price], [total_price], [off_price], [totaloff_price], [quantity], [product_id], [created_at], [updated_at]) VALUES (30, 11, 112000000, 112000000, NULL, NULL, 1, 44, CAST(N'2022-12-06T16:59:07.2301278' AS DateTime2), CAST(N'2022-12-06T16:59:07.2301278' AS DateTime2))
SET IDENTITY_INSERT [dbo].[orderitems] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (3, 1, 4730000, 3, N'not_verified', N'not_verified', 2, CAST(N'2022-12-04T21:53:39.6781951' AS DateTime2), CAST(N'2022-12-04T22:00:47.2104344' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (4, 1, 2530000, 2, N'verified', N'verified', 2, CAST(N'2022-12-04T22:01:36.6925126' AS DateTime2), CAST(N'2022-12-04T22:08:11.0450395' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (5, 2, 45600000, 1, N'pending', N'verified', 4, CAST(N'2022-12-04T22:07:20.0368774' AS DateTime2), CAST(N'2022-12-04T22:09:23.4043882' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (6, 2, 336000000, 3, N'verified', N'verified', 5, CAST(N'2022-12-04T22:09:44.0677322' AS DateTime2), CAST(N'2022-12-04T22:11:10.1006626' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (7, 6, 1473000, 5, N'verified', N'verified', 9, CAST(N'2022-12-04T22:14:48.0545697' AS DateTime2), CAST(N'2022-12-04T22:18:05.0344346' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (8, 9, 9100000, 3, N'verified', N'verified', 10, CAST(N'2022-12-05T07:40:28.3183055' AS DateTime2), CAST(N'2022-12-05T07:42:17.6357742' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (9, 1, 2500000, 1, N'verified', N'verified', 2, CAST(N'2022-12-05T22:36:40.1046957' AS DateTime2), CAST(N'2022-12-05T23:06:06.3334160' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (10, 8, 61500000, 2, N'verified', N'pending', 11, CAST(N'2022-12-05T23:08:32.2539941' AS DateTime2), CAST(N'2022-12-05T23:11:09.0739168' AS DateTime2))
INSERT [dbo].[orders] ([id], [customer_id], [total_price], [total_count], [payment], [verification], [address_id], [created_at], [updated_at]) VALUES (11, 1, 112000000, 1, N'verified', N'verified', 2, CAST(N'2022-12-06T16:58:07.3153860' AS DateTime2), CAST(N'2022-12-06T16:59:16.4714186' AS DateTime2))
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product_category] ON 

INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (1, 9, 7, CAST(N'2022-12-04T16:17:38.4191010' AS DateTime2), CAST(N'2022-12-04T16:17:38.4191010' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (2, 9, 9, CAST(N'2022-12-04T16:17:42.2375258' AS DateTime2), CAST(N'2022-12-04T16:17:42.2375258' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (3, 10, 7, CAST(N'2022-12-04T16:17:55.6146730' AS DateTime2), CAST(N'2022-12-04T16:17:55.6146730' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (4, 10, 9, CAST(N'2022-12-04T16:18:00.4511561' AS DateTime2), CAST(N'2022-12-04T16:18:00.4511561' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (5, 11, 7, CAST(N'2022-12-04T16:18:05.2066817' AS DateTime2), CAST(N'2022-12-04T16:18:05.2066817' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (6, 11, 9, CAST(N'2022-12-04T16:18:09.2425404' AS DateTime2), CAST(N'2022-12-04T16:18:09.2425404' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (9, 12, 2, CAST(N'2022-12-04T16:18:27.2244954' AS DateTime2), CAST(N'2022-12-04T16:18:27.2244954' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (10, 12, 4, CAST(N'2022-12-04T16:18:29.9022029' AS DateTime2), CAST(N'2022-12-04T16:18:29.9022029' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (12, 15, 2, CAST(N'2022-12-04T16:19:03.6749865' AS DateTime2), CAST(N'2022-12-04T16:19:03.6749865' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (13, 15, 4, CAST(N'2022-12-04T16:19:07.9636372' AS DateTime2), CAST(N'2022-12-04T16:19:07.9636372' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (14, 16, 24, CAST(N'2022-12-04T16:20:27.2948802' AS DateTime2), CAST(N'2022-12-04T16:20:27.2948802' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (15, 17, 24, CAST(N'2022-12-04T16:20:34.0142306' AS DateTime2), CAST(N'2022-12-04T16:20:34.0142306' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (16, 18, 2, CAST(N'2022-12-04T16:20:41.2025458' AS DateTime2), CAST(N'2022-12-04T16:20:41.2025458' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (18, 18, 25, CAST(N'2022-12-04T16:21:58.1612424' AS DateTime2), CAST(N'2022-12-04T16:21:58.1612424' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (19, 19, 25, CAST(N'2022-12-04T16:22:13.1266080' AS DateTime2), CAST(N'2022-12-04T16:22:13.1266080' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (20, 19, 2, CAST(N'2022-12-04T16:22:21.1381022' AS DateTime2), CAST(N'2022-12-04T16:22:21.1381022' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (21, 20, 2, CAST(N'2022-12-04T16:22:31.9053343' AS DateTime2), CAST(N'2022-12-04T16:22:31.9053343' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (22, 20, 3, CAST(N'2022-12-04T16:22:39.3331170' AS DateTime2), CAST(N'2022-12-04T16:22:39.3331170' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (23, 21, 2, CAST(N'2022-12-04T16:23:22.6176588' AS DateTime2), CAST(N'2022-12-04T16:23:22.6176588' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (24, 21, 26, CAST(N'2022-12-04T16:23:33.0221247' AS DateTime2), CAST(N'2022-12-04T16:23:33.0221247' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (25, 22, 2, CAST(N'2022-12-04T16:32:52.3924790' AS DateTime2), CAST(N'2022-12-04T16:32:52.3924790' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (26, 22, 3, CAST(N'2022-12-04T16:33:00.3041156' AS DateTime2), CAST(N'2022-12-04T16:33:00.3041156' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (27, 23, 2, CAST(N'2022-12-04T16:33:13.8531855' AS DateTime2), CAST(N'2022-12-04T16:33:13.8531855' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (28, 23, 4, CAST(N'2022-12-04T16:33:22.1439386' AS DateTime2), CAST(N'2022-12-04T16:33:22.1439386' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (30, 24, 27, CAST(N'2022-12-04T16:36:27.5204576' AS DateTime2), CAST(N'2022-12-04T16:36:27.5204576' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (31, 24, 28, CAST(N'2022-12-04T16:36:30.9903369' AS DateTime2), CAST(N'2022-12-04T16:36:30.9903369' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (32, 25, 27, CAST(N'2022-12-04T16:36:39.1933581' AS DateTime2), CAST(N'2022-12-04T16:36:39.1933581' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (33, 25, 28, CAST(N'2022-12-04T16:36:44.8109447' AS DateTime2), CAST(N'2022-12-04T16:36:44.8109447' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (34, 26, 27, CAST(N'2022-12-04T17:17:30.1746127' AS DateTime2), CAST(N'2022-12-04T17:17:30.1746127' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (35, 26, 29, CAST(N'2022-12-04T17:17:35.7608513' AS DateTime2), CAST(N'2022-12-04T17:18:53.3867761' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (37, 28, 27, CAST(N'2022-12-04T17:17:51.0321804' AS DateTime2), CAST(N'2022-12-04T17:17:51.0321804' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (38, 28, 29, CAST(N'2022-12-04T17:17:54.0605205' AS DateTime2), CAST(N'2022-12-04T17:18:49.9424585' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (39, 30, 27, CAST(N'2022-12-04T17:18:03.6949933' AS DateTime2), CAST(N'2022-12-04T17:18:03.6949933' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (40, 30, 29, CAST(N'2022-12-04T17:18:06.7377304' AS DateTime2), CAST(N'2022-12-04T17:18:46.4195556' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (41, 31, 27, CAST(N'2022-12-04T17:18:16.5387806' AS DateTime2), CAST(N'2022-12-04T17:18:16.5387806' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (42, 31, 29, CAST(N'2022-12-04T17:18:19.5885667' AS DateTime2), CAST(N'2022-12-04T17:18:43.1143432' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (43, 32, 27, CAST(N'2022-12-04T17:18:28.3848198' AS DateTime2), CAST(N'2022-12-04T17:18:28.3848198' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (44, 32, 29, CAST(N'2022-12-04T17:18:40.3444190' AS DateTime2), CAST(N'2022-12-04T17:18:40.3444190' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (45, 33, 27, CAST(N'2022-12-04T17:19:08.8957173' AS DateTime2), CAST(N'2022-12-04T17:19:08.8957173' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (46, 33, 29, CAST(N'2022-12-04T17:19:11.9005234' AS DateTime2), CAST(N'2022-12-04T17:19:11.9005234' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (47, 34, 27, CAST(N'2022-12-04T17:19:15.4650523' AS DateTime2), CAST(N'2022-12-04T17:19:15.4650523' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (48, 34, 29, CAST(N'2022-12-04T17:19:19.4524459' AS DateTime2), CAST(N'2022-12-04T17:19:19.4524459' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (49, 35, 27, CAST(N'2022-12-04T17:19:22.9463711' AS DateTime2), CAST(N'2022-12-04T17:19:22.9463711' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (50, 35, 29, CAST(N'2022-12-04T17:19:26.5646871' AS DateTime2), CAST(N'2022-12-04T17:19:26.5646871' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (51, 36, 27, CAST(N'2022-12-04T17:19:30.4356083' AS DateTime2), CAST(N'2022-12-04T17:19:30.4356083' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (52, 36, 29, CAST(N'2022-12-04T17:19:34.5323474' AS DateTime2), CAST(N'2022-12-04T17:19:34.5323474' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (53, 39, 27, CAST(N'2022-12-04T17:19:44.8035825' AS DateTime2), CAST(N'2022-12-04T17:19:44.8035825' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (54, 39, 29, CAST(N'2022-12-04T17:19:47.8062677' AS DateTime2), CAST(N'2022-12-04T17:19:47.8062677' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (55, 40, 27, CAST(N'2022-12-04T17:19:55.2235379' AS DateTime2), CAST(N'2022-12-04T17:19:55.2235379' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (56, 40, 29, CAST(N'2022-12-04T17:19:59.1419419' AS DateTime2), CAST(N'2022-12-04T17:19:59.1419419' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (57, 41, 13, CAST(N'2022-12-04T17:30:53.8359109' AS DateTime2), CAST(N'2022-12-04T17:30:53.8359109' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (58, 41, 15, CAST(N'2022-12-04T17:31:04.9650687' AS DateTime2), CAST(N'2022-12-04T17:31:04.9650687' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (59, 42, 13, CAST(N'2022-12-04T17:31:16.7277439' AS DateTime2), CAST(N'2022-12-04T17:31:16.7277439' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (60, 42, 15, CAST(N'2022-12-04T17:31:22.1084737' AS DateTime2), CAST(N'2022-12-04T17:31:22.1084737' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (61, 43, 13, CAST(N'2022-12-04T17:31:39.6531264' AS DateTime2), CAST(N'2022-12-04T17:31:39.6531264' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (62, 43, 20, CAST(N'2022-12-04T17:31:47.3597174' AS DateTime2), CAST(N'2022-12-04T17:31:47.3597174' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (63, 45, 13, CAST(N'2022-12-04T17:31:59.3559146' AS DateTime2), CAST(N'2022-12-04T17:31:59.3559146' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (64, 45, 14, CAST(N'2022-12-04T17:32:10.3078656' AS DateTime2), CAST(N'2022-12-04T17:32:10.3078656' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (65, 46, 13, CAST(N'2022-12-04T17:32:13.8935363' AS DateTime2), CAST(N'2022-12-04T17:32:13.8935363' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (66, 46, 14, CAST(N'2022-12-04T17:32:18.4215348' AS DateTime2), CAST(N'2022-12-04T17:32:18.4215348' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (67, 47, 13, CAST(N'2022-12-04T17:32:26.7183056' AS DateTime2), CAST(N'2022-12-04T17:32:26.7183056' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (68, 47, 16, CAST(N'2022-12-04T17:32:34.6229275' AS DateTime2), CAST(N'2022-12-04T17:32:34.6229275' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (69, 47, 17, CAST(N'2022-12-04T17:32:43.7034836' AS DateTime2), CAST(N'2022-12-04T17:32:43.7034836' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (73, 51, 13, CAST(N'2022-12-04T17:33:05.9343998' AS DateTime2), CAST(N'2022-12-04T17:33:05.9343998' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (74, 51, 16, CAST(N'2022-12-04T17:33:11.3733103' AS DateTime2), CAST(N'2022-12-04T17:33:11.3733103' AS DateTime2))
INSERT [dbo].[product_category] ([id], [product_id], [category_id], [created_at], [updated_at]) VALUES (75, 51, 17, CAST(N'2022-12-04T17:33:17.6004031' AS DateTime2), CAST(N'2022-12-04T17:33:17.6004031' AS DateTime2))
SET IDENTITY_INSERT [dbo].[product_category] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (9, N'Adidas Shoes 1', N'Adidas Shoes 1 - Description', N'/cdn/images/products/p1.jpg', 3700000, NULL, 7, CAST(N'2022-12-04T15:01:44.4663734' AS DateTime2), CAST(N'2022-12-04T15:01:44.4663734' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (10, N'Adidas Shoes 2', N'Adidas Shoes 2 - Description', N'/cdn/images/products/2.jpg', 2500000, NULL, 7, CAST(N'2022-12-04T15:02:19.0194158' AS DateTime2), CAST(N'2022-12-04T15:02:19.0194158' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (11, N'Adidas Shoes 3', N'Adidas Shoes 3 - Description', N'/cdn/images/products/p3.jpg', 2900000, NULL, 7, CAST(N'2022-12-04T15:02:58.0337636' AS DateTime2), CAST(N'2022-12-04T15:02:58.0337636' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (12, N'Asus Laptop 1', N'Asus Laptop 1 - Description', N'/cdn/images/products/p4.jpg', 65000000, NULL, 5, CAST(N'2022-12-04T15:04:12.5411473' AS DateTime2), CAST(N'2022-12-04T15:04:12.5411473' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (15, N'Asus Laptop 2', N'Asus Laptop 2 - Description', N'/cdn/images/products/p5.jpg', 35000000, NULL, 5, CAST(N'2022-12-04T15:04:51.8289206' AS DateTime2), CAST(N'2022-12-04T15:04:51.8289206' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (16, N'Digikala Gift 1', N'Digikala Gift 1 - Description', N'/cdn/images/products/p6.jpg', 150000, NULL, 1, CAST(N'2022-12-04T15:05:46.5625620' AS DateTime2), CAST(N'2022-12-04T15:05:46.5625620' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (17, N'Digikala Gift 2', N'Digikala Gift 2 - Description', N'/cdn/images/products/p7.jpg', 300000, NULL, 1, CAST(N'2022-12-04T15:06:30.3350016' AS DateTime2), CAST(N'2022-12-04T15:06:30.3350016' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (18, N'Amazon Echo', N'Amazon Echo - Description', N'/cdn/images/products/p8.jpg', 950000, NULL, 2, CAST(N'2022-12-04T15:07:15.7454397' AS DateTime2), CAST(N'2022-12-04T15:09:21.4965398' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (19, N'Amazon Echo Dot', N'Amazon Echo Dot - Description', N'/cdn/images/products/p9.jpg', 720000, NULL, 2, CAST(N'2022-12-04T15:07:43.9726315' AS DateTime2), CAST(N'2022-12-04T15:09:27.0531558' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (20, N'Samsung Galaxy S22', N'Samsung Galaxy S22 - Description', N'/cdn/images/products/p10.jpg', 27000000, NULL, 4, CAST(N'2022-12-04T15:08:29.7023410' AS DateTime2), CAST(N'2022-12-04T15:09:33.9014183' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (21, N'Samsung Galaxy Watch', N'Samsung Galaxy Watch - Description', N'/cdn/images/products/p11.jpg', 12000000, NULL, 4, CAST(N'2022-12-04T15:09:05.1386767' AS DateTime2), CAST(N'2022-12-04T15:09:39.2725388' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (22, N'Apple Iphone 12 Pro', N'Apple Iphone 12 Pro - Description', N'/cdn/images/products/p12.jpg', 34000000, NULL, 3, CAST(N'2022-12-04T15:10:35.4081067' AS DateTime2), CAST(N'2022-12-04T15:10:35.4081067' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (23, N'Apple Macbook Pro 16 inch M1 Max', N'Apple Macbook Pro 16 inch M1 Max - Description', N'/cdn/images/products/p13.jpg', 112000000, 105000000, 3, CAST(N'2022-12-04T15:11:56.9671463' AS DateTime2), CAST(N'2022-12-04T15:11:56.9671463' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (24, N'Paygah Dadeha Book ', N'Paygah Dadeha Book - Description', N'/cdn/images/products/p14.jpg', 32000, 30000, 1, CAST(N'2022-12-04T15:13:24.8216525' AS DateTime2), CAST(N'2022-12-04T15:13:24.8216525' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (25, N'Learning SQL Book', N'Learning SQL Book - Description', N'/cdn/images/products/p15.jpg', 80000, NULL, 1, CAST(N'2022-12-04T15:14:31.7608121' AS DateTime2), CAST(N'2022-12-04T15:14:44.4831006' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (26, N'Harry Potter and the Philosopher''s Stone (2001)', N'Harry Potter and the Philosopher''s Stone (2001) Movie Description', N'/cdn/images/products/p16.jpg', 250000, NULL, 1, CAST(N'2022-12-04T16:38:27.8424317' AS DateTime2), CAST(N'2022-12-04T16:38:27.8424317' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (28, N'Harry Potter and the Chamber of Secrets (2002)
', N'Harry Potter and the Chamber of Secrets (2002) Movie Description', N'/cdn/images/products/p17.jpg', 255000, NULL, 1, CAST(N'2022-12-04T16:39:22.9706780' AS DateTime2), CAST(N'2022-12-04T16:39:22.9706780' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (30, N'Harry Potter and the Prisoner of Azkaban (2004)
', N'Harry Potter and the Prisoner of Azkaban (2004) Movie Description', N'/cdn/images/products/p18.jpg', 350000, 290000, 1, CAST(N'2022-12-04T16:40:22.1806937' AS DateTime2), CAST(N'2022-12-04T16:40:22.1806937' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (31, N'Harry Potter and the Goblet of Fire (2005)', N'Harry Potter and the Goblet of Fire (2005) Movie Description', N'/cdn/images/products/p19.jpg', 278000, NULL, 1, CAST(N'2022-12-04T17:03:41.6329477' AS DateTime2), CAST(N'2022-12-04T17:03:41.6329477' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (32, N'Harry Potter and the Order of the Phoenix (2007)', N'Harry Potter and the Order of the Phoenix (2007) Movie Description', N'/cdn/images/products/p20.jpg', 340000, NULL, 1, CAST(N'2022-12-04T17:04:13.8479127' AS DateTime2), CAST(N'2022-12-04T17:13:17.9636420' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (33, N'Harry Potter and the Half-Blood Prince (2009)', N'Harry Potter and the Half-Blood Prince (2009) Movie Description', N'/cdn/images/products/p21.jpg', 325000, NULL, 1, CAST(N'2022-12-04T17:04:45.9876295' AS DateTime2), CAST(N'2022-12-04T17:04:45.9876295' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (34, N'Harry Potter and the Deathly Hallows – Part 1 (2010)', N'Harry Potter and the Deathly Hallows – Part 1 (2010) Movie Description', N'/cdn/images/products/p22.jpg', 450000, NULL, 1, CAST(N'2022-12-04T17:05:14.7895313' AS DateTime2), CAST(N'2022-12-04T17:13:23.6288323' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (35, N'Harry Potter and the Deathly Hallows – Part 2 (2011)', N'Harry Potter and the Deathly Hallows – Part 2 (2011) Movie Description', N'/cdn/images/products/p23.jpg', 470000, NULL, 1, CAST(N'2022-12-04T17:05:45.5216557' AS DateTime2), CAST(N'2022-12-04T17:13:28.9592507' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (36, N'Harry Potter Full Series ( 2022 )', N'Harry Potter Full Series ( 2022 ) Movie Description', N'/cdn/images/products/p24.jpg', 2600000, 2470000, 2, CAST(N'2022-12-04T17:07:09.3970647' AS DateTime2), CAST(N'2022-12-04T17:13:33.6587436' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (39, N'Interstellar (2014)', N'Interstellar (2014) Movie Description', N'/cdn/images/products/p25.jpg', 800000, NULL, 2, CAST(N'2022-12-04T17:15:25.5739413' AS DateTime2), CAST(N'2022-12-04T17:15:25.5739413' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (40, N'Titanic (1997)', N'Titanic (1997)', N'/cdn/images/products/p26.jpg', 1500000, NULL, 2, CAST(N'2022-12-04T17:16:26.2716488' AS DateTime2), CAST(N'2022-12-04T17:16:26.2716488' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (41, N'Asus ROG MAXIMUS Z690 FORMULA', N'Asus ROG MAXIMUS Z690 FORMULA Description', N'/cdn/images/products/p27.jpg', 8500000, NULL, 1, CAST(N'2022-12-04T17:22:24.0605806' AS DateTime2), CAST(N'2022-12-04T17:22:24.0605806' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (42, N'Asus ROG MAXIMUS Z690 APEX', N'Asus ROG MAXIMUS Z690 APEX Description', N'/cdn/images/products/p28.jpg', 7200000, NULL, 1, CAST(N'2022-12-04T17:23:23.1227860' AS DateTime2), CAST(N'2022-12-04T17:23:23.1227860' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (43, N'Asus ROG-STRIX-RTX3080-O10G-V2-GAMING ', N'Asus ROG-STRIX-RTX3080-O10G-V2-GAMING Description', N'/cdn/images/products/p29.jpg', 89000000, NULL, 1, CAST(N'2022-12-04T17:25:07.1023040' AS DateTime2), CAST(N'2022-12-04T17:25:07.1023040' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (44, N'Asus ROG-STRIX-RTX3080-O10G-WHITE-V2 ', N'Asus ROG-STRIX-RTX3080-O10G-WHITE-V2 Description', N'/cdn/images/products/p30.jpg', 112000000, NULL, 1, CAST(N'2022-12-04T17:25:47.3923861' AS DateTime2), CAST(N'2022-12-04T17:25:47.3923861' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (45, N'Intel Core i9-12900K', N'Intel Core i9-12900K Description', N'/cdn/images/products/p31.jpg', 53000000, NULL, 1, CAST(N'2022-12-04T17:27:10.3529015' AS DateTime2), CAST(N'2022-12-04T17:27:10.3529015' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (46, N'Intel Core i9-12900KF', N'Intel Core i9-12900KF Description', N'/cdn/images/products/p32.jpg', 45600000, NULL, 1, CAST(N'2022-12-04T17:27:51.9528420' AS DateTime2), CAST(N'2022-12-04T17:27:51.9528420' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (47, N'Samsung 980 PRO SSD 1TB PCIe 4.0 NVMe Gen 4', N'Samsung 980 PRO SSD 1TB PCIe 4.0 NVMe Gen 4 Description', N'/cdn/images/products/p33.jpg', 9500000, NULL, 1, CAST(N'2022-12-04T17:29:08.8599031' AS DateTime2), CAST(N'2022-12-04T17:29:08.8599031' AS DateTime2))
INSERT [dbo].[products] ([id], [title], [desc], [img], [price], [off_price], [seller_id], [created_at], [updated_at]) VALUES (51, N'WD_BLACK 1TB SN750 SE NVMe', N'WD_BLACK 1TB SN750 SE NVMe Description', N'/cdn/images/products/p34.jpg', 7800000, NULL, 1, CAST(N'2022-12-04T17:30:14.9302823' AS DateTime2), CAST(N'2022-12-04T17:30:14.9302823' AS DateTime2))
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[purchases] ON 

INSERT [dbo].[purchases] ([id], [order_id], [customer_id], [status], [bank_portal], [amount], [created_at], [updated_at]) VALUES (1, 3, 1, N'verified', N'Zarinpaal', 4730000, CAST(N'2022-12-05T23:27:17.0717142' AS DateTime2), CAST(N'2022-12-05T23:27:17.0717142' AS DateTime2))
INSERT [dbo].[purchases] ([id], [order_id], [customer_id], [status], [bank_portal], [amount], [created_at], [updated_at]) VALUES (2, 4, 1, N'verified', N'Mellat', 2530000, CAST(N'2022-12-05T23:27:39.4925611' AS DateTime2), CAST(N'2022-12-05T23:27:39.4925611' AS DateTime2))
INSERT [dbo].[purchases] ([id], [order_id], [customer_id], [status], [bank_portal], [amount], [created_at], [updated_at]) VALUES (3, 5, 2, N'pending', N'DigiPay', 45600000, CAST(N'2022-12-05T23:28:31.0333060' AS DateTime2), CAST(N'2022-12-05T23:28:31.0333060' AS DateTime2))
SET IDENTITY_INSERT [dbo].[purchases] OFF
GO
SET IDENTITY_INSERT [dbo].[reviewitems] ON 

INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (1, 1, N'Good printing quality', N'pos', CAST(N'2022-12-05T07:24:08.2865450' AS DateTime2), CAST(N'2022-12-05T07:24:08.2865450' AS DateTime2))
INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (2, 1, N'Free E-book version', N'pos', CAST(N'2022-12-05T07:24:46.0592623' AS DateTime2), CAST(N'2022-12-05T07:24:46.0592623' AS DateTime2))
INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (3, 1, N'Some Subject missed', N'neg', CAST(N'2022-12-05T07:25:07.0331562' AS DateTime2), CAST(N'2022-12-05T07:25:07.0331562' AS DateTime2))
INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (4, 3, N'Excellent For Deep Leaning', N'pos', CAST(N'2022-12-05T07:28:27.0692279' AS DateTime2), CAST(N'2022-12-05T07:28:27.0692279' AS DateTime2))
INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (5, 3, N'Excellent For Other Uses', N'pos', CAST(N'2022-12-05T07:28:55.9900648' AS DateTime2), CAST(N'2022-12-05T07:28:55.9900648' AS DateTime2))
INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (6, 3, N'Really stuning white color', N'pos', CAST(N'2022-12-05T07:29:14.9324643' AS DateTime2), CAST(N'2022-12-05T07:29:14.9324643' AS DateTime2))
INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (7, 3, N'Its size is bigger than what i thought', N'neg', CAST(N'2022-12-05T07:29:46.0256385' AS DateTime2), CAST(N'2022-12-05T07:29:46.0256385' AS DateTime2))
INSERT [dbo].[reviewitems] ([id], [review_id], [tip_sentence], [tip_type], [created_at], [updated_at]) VALUES (8, 3, N'Really heavy - you will need an stand', N'neg', CAST(N'2022-12-05T07:30:05.1088274' AS DateTime2), CAST(N'2022-12-05T07:30:05.1088274' AS DateTime2))
SET IDENTITY_INSERT [dbo].[reviewitems] OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 

INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (1, 24, 1, N'Good Book on Paaygah Dade Ha', N'This is a content for Paygah dadeha book', N'high', 4, 1, CAST(N'2022-12-05T07:23:03.4886532' AS DateTime2), CAST(N'2022-12-05T07:23:03.4886532' AS DateTime2))
INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (3, 44, 2, N'Excellent graphic card !', N'This is a beast graphic card , im using it for deep learning and neural networks and it just works great !', N'high', 6, 1, CAST(N'2022-12-05T07:27:54.7359855' AS DateTime2), CAST(N'2022-12-05T07:27:54.7359855' AS DateTime2))
INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (5, 31, 6, N'Excellent Movie - Bad Packaging', N'The movie is excellent and i really love it , but disc packaging was terrible !', N'mid', 7, 1, CAST(N'2022-12-05T07:33:40.4519087' AS DateTime2), CAST(N'2022-12-05T07:33:40.4519087' AS DateTime2))
INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (6, 9, 9, N'Original !', N'This shoes are original and thank you digikala', N'high', 8, 1, CAST(N'2022-12-05T22:33:00.4499966' AS DateTime2), CAST(N'2022-12-05T22:33:57.7749083' AS DateTime2))
INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (7, 11, 9, N'Fake !', N'This shoes are fake and not original !   dont buy from digikala', N'low', 8, 0, CAST(N'2022-12-05T22:33:55.2083219' AS DateTime2), CAST(N'2022-12-05T22:33:56.3357018' AS DateTime2))
INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (8, 10, 9, N'Feels so good and original !', N'Im not sure if this shoes are original or not, but seems and feels really good !', N'mid', 8, 1, CAST(N'2022-12-05T22:35:26.2674309' AS DateTime2), CAST(N'2022-12-05T22:35:26.2674309' AS DateTime2))
INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (11, 10, 1, N'These are so comfortable', N'Yeees ! i love this shoes ! thank you so much digikala for selling original shoes !', N'high', 9, 1, CAST(N'2022-12-05T22:38:29.7844728' AS DateTime2), CAST(N'2022-12-05T22:38:29.7844728' AS DateTime2))
INSERT [dbo].[reviews] ([id], [product_id], [customer_id], [title], [content], [recommend_status], [order_id], [show_name], [created_at], [updated_at]) VALUES (12, 44, 1, N'OMG !', N'This is a beast Graphic Card , Thank you so much Asus !', N'high', 11, 1, CAST(N'2022-12-06T17:00:29.1769045' AS DateTime2), CAST(N'2022-12-06T17:00:29.1769045' AS DateTime2))
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [title], [is_admin], [created_at], [updated_at]) VALUES (1, N'admin', 1, CAST(N'2022-12-03T20:44:47.9125255' AS DateTime2), CAST(N'2022-12-03T20:44:47.9125255' AS DateTime2))
INSERT [dbo].[roles] ([id], [title], [is_admin], [created_at], [updated_at]) VALUES (2, N'developer', 1, CAST(N'2022-12-03T20:45:00.0118128' AS DateTime2), CAST(N'2022-12-03T20:45:00.0118128' AS DateTime2))
INSERT [dbo].[roles] ([id], [title], [is_admin], [created_at], [updated_at]) VALUES (3, N'support', 1, CAST(N'2022-12-03T20:45:11.3077381' AS DateTime2), CAST(N'2022-12-03T20:45:11.3077381' AS DateTime2))
INSERT [dbo].[roles] ([id], [title], [is_admin], [created_at], [updated_at]) VALUES (4, N'designer', 1, CAST(N'2022-12-03T20:46:07.3160642' AS DateTime2), CAST(N'2022-12-03T20:46:07.3160642' AS DateTime2))
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[sellers] ON 

INSERT [dbo].[sellers] ([id], [email], [owner_name], [name], [password], [phone_number], [state], [city], [address], [postal_code], [logo_img], [desc], [created_at], [updated_at]) VALUES (1, N'digikala@gmail.com', N'Ali Mohammadi', N'Digikala', N'digikalapss', N'02188557788', N'Tehran', N'Tehran', N'Jordan', N'123456', N'/AmirReza/image/sellers/logo/digikala.jpg', N'Digikala Description', CAST(N'2022-12-03T21:22:16.0287218' AS DateTime2), CAST(N'2022-12-03T21:22:16.0287218' AS DateTime2))
INSERT [dbo].[sellers] ([id], [email], [owner_name], [name], [password], [phone_number], [state], [city], [address], [postal_code], [logo_img], [desc], [created_at], [updated_at]) VALUES (2, N'amazon@gmail.com', N'Jeff Bezos', N'Amazon', N'passamazon', N'12345678988', N'Washington', N'Seattle', N'downtown', N'258741', N'/AmirReza/images/sellers/logo/amaz.jpg', N'Amazon Description', CAST(N'2022-12-03T21:24:00.7964512' AS DateTime2), CAST(N'2022-12-03T21:24:00.7964512' AS DateTime2))
INSERT [dbo].[sellers] ([id], [email], [owner_name], [name], [password], [phone_number], [state], [city], [address], [postal_code], [logo_img], [desc], [created_at], [updated_at]) VALUES (3, N'almas_paytakht@gmail.com', N'Reza Hajipoor', N'Almas Paytakht', N'almasppass', N'02187878787', N'Tehran', N'Tehran', N'Mojtame Paytakht', N'123456', N'/AmirReza/image/sellers/logo/almasp.jpg', N'Almas Paytakht Description', CAST(N'2022-12-03T21:26:09.9929552' AS DateTime2), CAST(N'2022-12-03T21:26:09.9929552' AS DateTime2))
INSERT [dbo].[sellers] ([id], [email], [owner_name], [name], [password], [phone_number], [state], [city], [address], [postal_code], [logo_img], [desc], [created_at], [updated_at]) VALUES (4, N'Samsung', N'Amir Injayi', N'Samsung Exclusive', N'samsungpass', N'02125252487', N'Tehran', N'Tehran', N'Mojtame Charsoo', N'123456', N'/AmirReza/image/sellers/logo/samsung.jpg', N'Samsung Description', CAST(N'2022-12-03T21:28:13.0244779' AS DateTime2), CAST(N'2022-12-03T21:28:13.0244779' AS DateTime2))
INSERT [dbo].[sellers] ([id], [email], [owner_name], [name], [password], [phone_number], [state], [city], [address], [postal_code], [logo_img], [desc], [created_at], [updated_at]) VALUES (5, N'Asus', N'Nazi Namazi', N'Asus', N'asuspass', N'02144455577', N'Tehran', N'Tehran', N'Mojtame Paytakht', N'123456', N'/AmirReza/images/sellers/logo/asus.jpg', N'Asus Description', CAST(N'2022-12-03T21:30:08.2912473' AS DateTime2), CAST(N'2022-12-03T21:30:08.2912473' AS DateTime2))
INSERT [dbo].[sellers] ([id], [email], [owner_name], [name], [password], [phone_number], [state], [city], [address], [postal_code], [logo_img], [desc], [created_at], [updated_at]) VALUES (7, N'adidas_originals@gmail.com', N'John Bernard', N'Adidas', N'adipasssss', N'852741963', N'New York', N'NYC', N'Times Square', N'123456', N'/AmirReza/images/sellers/logo/adidas.jpg', N'Adidas Description', CAST(N'2022-12-03T21:33:12.8695733' AS DateTime2), CAST(N'2022-12-03T21:33:12.8695733' AS DateTime2))
SET IDENTITY_INSERT [dbo].[sellers] OFF
GO
SET IDENTITY_INSERT [dbo].[tickets] ON 

INSERT [dbo].[tickets] ([id], [customer_id], [title], [content], [section], [priority], [verified], [solved], [created_at], [updated_at]) VALUES (1, 1, N'Change Username', N'Hey Digikala , i wanna change my username but i got an error code 1102 , can you guys please help me with this please ? thank you so much !', N'support', N'high', 1, 0, CAST(N'2022-12-05T23:35:20.2381369' AS DateTime2), CAST(N'2022-12-05T23:35:20.2381369' AS DateTime2))
INSERT [dbo].[tickets] ([id], [customer_id], [title], [content], [section], [priority], [verified], [solved], [created_at], [updated_at]) VALUES (3, 12, N'Selling My New Album', N'Hey Guys, i want to be a seller , how can i do this ?', N'support', N'mid', 0, 0, CAST(N'2022-12-05T23:36:48.1797009' AS DateTime2), CAST(N'2022-12-05T23:36:48.1797009' AS DateTime2))
INSERT [dbo].[tickets] ([id], [customer_id], [title], [content], [section], [priority], [verified], [solved], [created_at], [updated_at]) VALUES (5, 6, N'Wrong Products', N'Hi Guys , in my last order , you send my order to the wrong address (Work address instead of Home address ) , please be careful about this type of important things !', N'products', N'low', 1, 1, CAST(N'2022-12-05T23:38:57.7766348' AS DateTime2), CAST(N'2022-12-05T23:38:57.7766348' AS DateTime2))
INSERT [dbo].[tickets] ([id], [customer_id], [title], [content], [section], [priority], [verified], [solved], [created_at], [updated_at]) VALUES (6, 8, N'Phone Number Accept', N'Hey Fellers , i cant get verification code for my new phone number , can you please help me to fix that ?', N'support', N'high', 1, 0, CAST(N'2022-12-05T23:40:18.9462666' AS DateTime2), CAST(N'2022-12-05T23:40:18.9462666' AS DateTime2))
INSERT [dbo].[tickets] ([id], [customer_id], [title], [content], [section], [priority], [verified], [solved], [created_at], [updated_at]) VALUES (8, 9, N'Purchase Problem', N'Hey guys , in 2 past days i purchase 3 times but every time i get an error from bank portal and cant complete the purchase.', N'purchase', N'high', 1, 0, CAST(N'2022-12-05T23:43:16.4999391' AS DateTime2), CAST(N'2022-12-05T23:43:16.4999391' AS DateTime2))
INSERT [dbo].[tickets] ([id], [customer_id], [title], [content], [section], [priority], [verified], [solved], [created_at], [updated_at]) VALUES (9, 18, N'Annoying Login', N'Hey , my login has problems . every time i open the website i must login agian and the browser doesnt save my login ! can you fix this please ?', N'support', N'mid', 0, 0, CAST(N'2022-12-05T23:45:28.8931310' AS DateTime2), CAST(N'2022-12-05T23:45:28.8931310' AS DateTime2))
SET IDENTITY_INSERT [dbo].[tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (1, N'Amr_admin@gmail.com', N' Amr _admin', N'AmirReza', N'Yosefvand', N'123654000', 1, CAST(N'2022-12-03T20:47:41.9035767' AS DateTime2), CAST(N'2022-12-03T20:47:41.9035767' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (3, N'Ebi_admin@gmail.com', NFalahi_ebi', N'Ebrahim', N'Falahi', N'ldkfjeifhr', 1, CAST(N'2022-12-03T20:48:48.1190953' AS DateTime2), CAST(N'2022-12-03T20:48:48.1190953' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (5, N'Fatemeh_bahirahi@gmail.com', N'Fatemeh_ Bahirai ', N'Fatemeh', N' Bahirai ', N'mhdsdvlp', 2, CAST(N'2022-12-03T20:51:10.9490636' AS DateTime2), CAST(N'2022-12-03T20:51:10.9490636' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (6, N'Ensie_sh@gmail.com', N'Ensie_dvlp', N'Ensie', N'Khademi', N'sgnddvlper', 2, CAST(N'2022-12-03T20:51:53.6396760' AS DateTime2), CAST(N'2022-12-03T20:51:53.6396760' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (7, N'Hossein_Halaji@gmail.com', N' Hossein dvlp', N'Hossein', N'Halaji', N'Hosseincode', 2, CAST(N'2022-12-03T20:52:47.1683260' AS DateTime2), CAST(N'2022-12-03T20:52:47.1683260' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (8, N'Leo_shamirian@gmail.com', N' Leo _shamir', N' Leo', N' shamirian ', N'misterxpass', 3, CAST(N'2022-12-03T20:55:32.5328631' AS DateTime2), CAST(N'2022-12-03T20:55:32.5328631' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (9, N'leo @gmail.com', N'mister_x_b', N'Mister X', N'B', N'misterxbpass2223', 3, CAST(N'2022-12-03T20:56:15.0965462' AS DateTime2), CAST(N'2022-12-03T20:56:15.0965462' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (10, N'lady_x_a@gmail.com', N'lady_x_a', N'Lady X', N'A', N'ladyxa_pass', 3, CAST(N'2022-12-03T20:57:13.0064382' AS DateTime2), CAST(N'2022-12-03T20:57:13.0064382' AS DateTime2))
INSERT [dbo].[users] ([id], [email], [username], [first_name], [last_name], [password], [role_id], [created_at], [updated_at]) VALUES (11, N'lady_x_b@gmail.com', N'lady_x_b', N'Lady X', N'B', N'ladyxb_pass', 3, CAST(N'2022-12-03T20:57:42.0839046' AS DateTime2), CAST(N'2022-12-03T20:57:42.0839046' AS DateTime2))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[wallets] ON 

INSERT [dbo].[wallets] ([id], [seller_id], [balance], [locked], [bank_card_number], [card_verification], [created_at], [updated_at]) VALUES (1, 1, 95000000, 0, N'1234-5678-9123-4567', N'verified', CAST(N'2022-12-05T22:41:53.8922315' AS DateTime2), CAST(N'2022-12-05T22:44:13.7738522' AS DateTime2))
INSERT [dbo].[wallets] ([id], [seller_id], [balance], [locked], [bank_card_number], [card_verification], [created_at], [updated_at]) VALUES (2, 2, 3400000, 0, N'0987-6543-2112-3456', N'verified', CAST(N'2022-12-05T22:42:39.6710633' AS DateTime2), CAST(N'2022-12-05T22:42:43.0544249' AS DateTime2))
INSERT [dbo].[wallets] ([id], [seller_id], [balance], [locked], [bank_card_number], [card_verification], [created_at], [updated_at]) VALUES (5, 3, 150000, 1, N'0000-0000-0000-0000', N'not_verified', CAST(N'2022-12-05T22:43:29.6591329' AS DateTime2), CAST(N'2022-12-05T22:43:29.6591329' AS DateTime2))
INSERT [dbo].[wallets] ([id], [seller_id], [balance], [locked], [bank_card_number], [card_verification], [created_at], [updated_at]) VALUES (7, 7, 12000000, 1, N'1234-5678-9012-3456', N'pending', CAST(N'2022-12-05T22:44:53.0742475' AS DateTime2), CAST(N'2022-12-05T22:44:53.0742475' AS DateTime2))
SET IDENTITY_INSERT [dbo].[wallets] OFF
GO
SET IDENTITY_INSERT [dbo].[withdraws] ON 

INSERT [dbo].[withdraws] ([id], [wallet_id], [card_number], [bank_name], [amount], [status], [created_at], [updated_at]) VALUES (1, 1, N'1234-5678-9123-4567', N'Mellat', 3000000, N'verified', CAST(N'2022-12-05T22:45:55.4235616' AS DateTime2), CAST(N'2022-12-05T22:45:55.4235616' AS DateTime2))
INSERT [dbo].[withdraws] ([id], [wallet_id], [card_number], [bank_name], [amount], [status], [created_at], [updated_at]) VALUES (5, 1, N'1234-5678-9123-4567', N'Melli', 112000000, N'not_verified', CAST(N'2022-12-05T22:46:26.2281789' AS DateTime2), CAST(N'2022-12-05T22:46:26.2281789' AS DateTime2))
INSERT [dbo].[withdraws] ([id], [wallet_id], [card_number], [bank_name], [amount], [status], [created_at], [updated_at]) VALUES (6, 2, N'0987-6543-2112-3456', N'Sepah', 2500000, N'pending', CAST(N'2022-12-05T22:47:00.4318081' AS DateTime2), CAST(N'2022-12-05T22:47:00.4318081' AS DateTime2))
INSERT [dbo].[withdraws] ([id], [wallet_id], [card_number], [bank_name], [amount], [status], [created_at], [updated_at]) VALUES (7, 2, N'0987-6543-2112-3456', N'Sepah', 3600000, N'pending', CAST(N'2022-12-05T22:47:16.1339954' AS DateTime2), CAST(N'2022-12-05T22:47:16.1339954' AS DateTime2))
INSERT [dbo].[withdraws] ([id], [wallet_id], [card_number], [bank_name], [amount], [status], [created_at], [updated_at]) VALUES (8, 2, N'0293-1234-2232-4443', N'Ayandeh', 6500000, N'verified', CAST(N'2022-12-05T22:48:03.5154976' AS DateTime2), CAST(N'2022-12-05T22:48:19.0759990' AS DateTime2))
SET IDENTITY_INSERT [dbo].[withdraws] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_categories_slug]    Script Date: 6/14/2022 5:09:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_categories_slug] ON [dbo].[categories]
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_customers_email]    Script Date: 6/14/2022 5:09:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_customers_email] ON [dbo].[customers]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_customers_phone_number]    Script Date: 6/14/2022 5:09:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_customers_phone_number] ON [dbo].[customers]
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_sellers_email]    Script Date: 6/14/2022 5:09:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_sellers_email] ON [dbo].[sellers]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_sellers_phone_number]    Script Date: 6/14/2022 5:09:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_sellers_phone_number] ON [dbo].[sellers]
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_users_email]    Script Date: 6/14/2022 5:09:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_users_email] ON [dbo].[users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_users_username]    Script Date: 6/14/2022 5:09:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_users_username] ON [dbo].[users]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[addresses] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[addresses] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[cartitems] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[cartitems] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[carts] ADD  DEFAULT ((0)) FOR [second_cart]
GO
ALTER TABLE [dbo].[carts] ADD  DEFAULT ((1)) FOR [active_cart]
GO
ALTER TABLE [dbo].[carts] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[carts] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[categories] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[coupons] ADD  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[customercoupons] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[customercoupons] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[orderitems] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[orderitems] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[orderitems] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((0)) FOR [total_price]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((0)) FOR [total_count]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('not_verified') FOR [payment]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('not_verified') FOR [verification]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[product_category] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[product_category] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_PRODUCTS_Created]  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[purchases] ADD  DEFAULT ('not_verified') FOR [status]
GO
ALTER TABLE [dbo].[purchases] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[purchases] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[reviewitems] ADD  DEFAULT ('pos') FOR [tip_type]
GO
ALTER TABLE [dbo].[reviewitems] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[reviewitems] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[reviews] ADD  DEFAULT ('mid') FOR [recommend_status]
GO
ALTER TABLE [dbo].[reviews] ADD  DEFAULT ((0)) FOR [show_name]
GO
ALTER TABLE [dbo].[reviews] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[reviews] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[sellers] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[sellers] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[tickets] ADD  DEFAULT ('mid') FOR [priority]
GO
ALTER TABLE [dbo].[tickets] ADD  DEFAULT ((0)) FOR [verified]
GO
ALTER TABLE [dbo].[tickets] ADD  DEFAULT ((0)) FOR [solved]
GO
ALTER TABLE [dbo].[tickets] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[tickets] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[wallets] ADD  DEFAULT ((1)) FOR [locked]
GO
ALTER TABLE [dbo].[wallets] ADD  DEFAULT ('not_verified') FOR [card_verification]
GO
ALTER TABLE [dbo].[wallets] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[wallets] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[withdraws] ADD  DEFAULT ('not_verified') FOR [status]
GO
ALTER TABLE [dbo].[withdraws] ADD  DEFAULT (sysdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[withdraws] ADD  DEFAULT (sysdatetime()) FOR [updated_at]
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_customer_id]
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD  CONSTRAINT [FK_cartitems_cart_id] FOREIGN KEY([cart_id])
REFERENCES [dbo].[carts] ([id])
GO
ALTER TABLE [dbo].[cartitems] CHECK CONSTRAINT [FK_cartitems_cart_id]
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD  CONSTRAINT [FK_cartitems_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[cartitems] CHECK CONSTRAINT [FK_cartitems_product_id]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FK_carts_coupon_id] FOREIGN KEY([coupon_id])
REFERENCES [dbo].[coupons] ([id])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FK_carts_coupon_id]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FK_carts_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FK_carts_customer_id]
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD  CONSTRAINT [FK_categories_parent_id] FOREIGN KEY([parent_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[categories] CHECK CONSTRAINT [FK_categories_parent_id]
GO
ALTER TABLE [dbo].[customercoupons]  WITH CHECK ADD  CONSTRAINT [FK_customercoupons_coupon_id] FOREIGN KEY([coupon_id])
REFERENCES [dbo].[coupons] ([id])
GO
ALTER TABLE [dbo].[customercoupons] CHECK CONSTRAINT [FK_customercoupons_coupon_id]
GO
ALTER TABLE [dbo].[customercoupons]  WITH CHECK ADD  CONSTRAINT [FK_customercoupons_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[customercoupons] CHECK CONSTRAINT [FK_customercoupons_customer_id]
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD  CONSTRAINT [FK_orderitems_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[orderitems] CHECK CONSTRAINT [FK_orderitems_order_id]
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD  CONSTRAINT [FK_orderitems_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orderitems] CHECK CONSTRAINT [FK_orderitems_product_id]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_address_id] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_address_id]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customer_id]
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD  CONSTRAINT [FK_product_category_category_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[product_category] CHECK CONSTRAINT [FK_product_category_category_id]
GO
ALTER TABLE [dbo].[product_category]  WITH CHECK ADD  CONSTRAINT [FK_product_category_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[product_category] CHECK CONSTRAINT [FK_product_category_product_id]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_seller_id] FOREIGN KEY([seller_id])
REFERENCES [dbo].[sellers] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_seller_id]
GO
ALTER TABLE [dbo].[purchases]  WITH CHECK ADD  CONSTRAINT [FK_purchases_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[purchases] CHECK CONSTRAINT [FK_purchases_customer_id]
GO
ALTER TABLE [dbo].[purchases]  WITH CHECK ADD  CONSTRAINT [FK_purchases_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[purchases] CHECK CONSTRAINT [FK_purchases_order_id]
GO
ALTER TABLE [dbo].[reviewitems]  WITH CHECK ADD  CONSTRAINT [FK_reviewitems_review_id] FOREIGN KEY([review_id])
REFERENCES [dbo].[reviews] ([id])
GO
ALTER TABLE [dbo].[reviewitems] CHECK CONSTRAINT [FK_reviewitems_review_id]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_customer_id]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_order_id] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_order_id]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_product_id] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_product_id]
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD  CONSTRAINT [FK_tickets_customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[tickets] CHECK CONSTRAINT [FK_tickets_customer_id]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_role_id] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_role_id]
GO
ALTER TABLE [dbo].[wallets]  WITH CHECK ADD  CONSTRAINT [FK_wallets_seller_id] FOREIGN KEY([seller_id])
REFERENCES [dbo].[sellers] ([id])
GO
ALTER TABLE [dbo].[wallets] CHECK CONSTRAINT [FK_wallets_seller_id]
GO
ALTER TABLE [dbo].[withdraws]  WITH CHECK ADD  CONSTRAINT [FK_withdraws_wallet_id] FOREIGN KEY([wallet_id])
REFERENCES [dbo].[wallets] ([id])
GO
ALTER TABLE [dbo].[withdraws] CHECK CONSTRAINT [FK_withdraws_wallet_id]
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD CHECK  (([price_off]>=(0)))
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD CHECK  (([total]>=(0)))
GO
ALTER TABLE [dbo].[cartitems]  WITH CHECK ADD CHECK  (([total_off]>=(0)))
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD CHECK  (([count]>=(0)))
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD CHECK  (([coupon_amount]>=(0)))
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD CHECK  (([total]>=(0)))
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD CHECK  (([total_off]>=(0)))
GO
ALTER TABLE [dbo].[coupons]  WITH CHECK ADD CHECK  (([amount]>=(0)))
GO
ALTER TABLE [dbo].[customercoupons]  WITH CHECK ADD CHECK  (([useable_count]>=(0)))
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD CHECK  (([off_price]>=(0)))
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD CHECK  (([single_price]>=(0)))
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD CHECK  (([total_price]>=(0)))
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD CHECK  (([totaloff_price]>=(0)))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([payment]='not_verified' OR [payment]='pending' OR [payment]='verified'))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([total_count]>=(0)))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([total_price]>=(0)))
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD CHECK  (([verification]='not_verified' OR [verification]='pending' OR [verification]='verified'))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([off_price]>=(0)))
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[purchases]  WITH CHECK ADD CHECK  (([amount]>=(0)))
GO
ALTER TABLE [dbo].[purchases]  WITH CHECK ADD CHECK  (([status]='not_verified' OR [status]='pending' OR [status]='verified'))
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD CHECK  (([priority]='mid' OR [priority]='high' OR [priority]='low'))
GO
ALTER TABLE [dbo].[wallets]  WITH CHECK ADD CHECK  (([balance]>=(0)))
GO
ALTER TABLE [dbo].[wallets]  WITH CHECK ADD CHECK  (([card_verification]='verified' OR [card_verification]='pending' OR [card_verification]='not_verified'))
GO
ALTER TABLE [dbo].[withdraws]  WITH CHECK ADD CHECK  (([amount]>=(0)))
GO
ALTER TABLE [dbo].[withdraws]  WITH CHECK ADD CHECK  (([status]='not_verified' OR [status]='pending' OR [status]='verified'))
GO
/****** Object:  StoredProcedure [dbo].[ExpiredCoupons]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExpiredCoupons]
AS
SELECT * FROM coupons c WHERE c.expired_at < SYSDATETIME();
GO
/****** Object:  StoredProcedure [dbo].[SelectAllOrders]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllOrders] @status VARCHAR(50)
AS
SELECT * FROM orders o WHERE o.verification = @status;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllProducts]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllProducts]
AS
SELECT * FROM products p;
GO
/****** Object:  StoredProcedure [dbo].[SellersTotalSale]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SellersTotalSale]
AS
SELECT s.name 'Seller' ,SUM(o.total_price) 'Total Sales' FROM sellers s INNER JOIN products p ON s.id = p.seller_id INNER JOIN orderitems o ON p.id = o.product_id GROUP BY s.name;
GO
/****** Object:  Trigger [dbo].[addressesUpdateUpdatedAt]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[addressesUpdateUpdatedAt]
ON [dbo].[addresses]
AFTER UPDATE 
AS
   UPDATE dbo.addresses
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.addresses.id = i.id
GO
ALTER TABLE [dbo].[addresses] ENABLE TRIGGER [addressesUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[cartitemsUpdateUpdatedAt]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[cartitemsUpdateUpdatedAt]
ON [dbo].[cartitems]
AFTER UPDATE 
AS
   UPDATE dbo.cartitems
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.cartitems.id = i.id
GO
ALTER TABLE [dbo].[cartitems] ENABLE TRIGGER [cartitemsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[cartsUpdateUpdatedAt]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[cartsUpdateUpdatedAt]
ON [dbo].[carts]
AFTER UPDATE 
AS
   UPDATE dbo.carts
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.carts.id = i.id;
GO
ALTER TABLE [dbo].[carts] ENABLE TRIGGER [cartsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[categoriesUpdateUpdatedAt]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[categoriesUpdateUpdatedAt]
ON [dbo].[categories]
AFTER UPDATE 
AS
   UPDATE dbo.categories
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.categories.id = i.id;
GO
ALTER TABLE [dbo].[categories] ENABLE TRIGGER [categoriesUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[couponsUpdateUpdatedAt]    Script Date: 6/14/2022 5:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[couponsUpdateUpdatedAt]
ON [dbo].[coupons]
AFTER UPDATE 
AS
   UPDATE dbo.coupons
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.coupons.id = i.id;
GO
ALTER TABLE [dbo].[coupons] ENABLE TRIGGER [couponsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[customercouponsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[customercouponsUpdateUpdatedAt]
ON [dbo].[customercoupons]
AFTER UPDATE 
AS
   UPDATE dbo.customercoupons
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.customercoupons.id = i.id;
GO
ALTER TABLE [dbo].[customercoupons] ENABLE TRIGGER [customercouponsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[customersUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[customersUpdateUpdatedAt]
ON [dbo].[customers]
AFTER UPDATE 
AS
   UPDATE dbo.customers
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.customers.id = i.id;
GO
ALTER TABLE [dbo].[customers] ENABLE TRIGGER [customersUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[orderitemsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[orderitemsUpdateUpdatedAt]
ON [dbo].[orderitems]
AFTER UPDATE 
AS
   UPDATE dbo.orderitems
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.orderitems.id = i.id;
GO
ALTER TABLE [dbo].[orderitems] ENABLE TRIGGER [orderitemsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[ordersUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ordersUpdateUpdatedAt]
ON [dbo].[orders]
AFTER UPDATE 
AS
   UPDATE dbo.orders
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.orders.id = i.id;
GO
ALTER TABLE [dbo].[orders] ENABLE TRIGGER [ordersUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[product_categoryUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[product_categoryUpdateUpdatedAt]
ON [dbo].[product_category]
AFTER UPDATE 
AS
   UPDATE dbo.product_category
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.product_category.id = i.id;
GO
ALTER TABLE [dbo].[product_category] ENABLE TRIGGER [product_categoryUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[productsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[productsUpdateUpdatedAt]
ON [dbo].[products]
AFTER UPDATE 
AS
   UPDATE dbo.products
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.products.id = i.id;
GO
ALTER TABLE [dbo].[products] ENABLE TRIGGER [productsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[purchasesUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[purchasesUpdateUpdatedAt]
ON [dbo].[purchases]
AFTER UPDATE 
AS
   UPDATE dbo.purchases
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.purchases.id = i.id;
GO
ALTER TABLE [dbo].[purchases] ENABLE TRIGGER [purchasesUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[reviewitemsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[reviewitemsUpdateUpdatedAt]
ON [dbo].[reviewitems]
AFTER UPDATE 
AS
   UPDATE dbo.reviewitems
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.reviewitems.id = i.id;
GO
ALTER TABLE [dbo].[reviewitems] ENABLE TRIGGER [reviewitemsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[reviewsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[reviewsUpdateUpdatedAt]
ON [dbo].[reviews]
AFTER UPDATE 
AS
   UPDATE dbo.reviews
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.reviews.id = i.id;
GO
ALTER TABLE [dbo].[reviews] ENABLE TRIGGER [reviewsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[rolesUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[rolesUpdateUpdatedAt]
ON [dbo].[roles]
AFTER UPDATE 
AS
   UPDATE dbo.roles
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.roles.id = i.id;
GO
ALTER TABLE [dbo].[roles] ENABLE TRIGGER [rolesUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[sellersUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[sellersUpdateUpdatedAt]
ON [dbo].[sellers]
AFTER UPDATE 
AS
   UPDATE dbo.sellers
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.sellers.id = i.id;
GO
ALTER TABLE [dbo].[sellers] ENABLE TRIGGER [sellersUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[ticketsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ticketsUpdateUpdatedAt]
ON [dbo].[tickets]
AFTER UPDATE 
AS
   UPDATE dbo.tickets
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.tickets.id = i.id;
GO
ALTER TABLE [dbo].[tickets] ENABLE TRIGGER [ticketsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[usersUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[usersUpdateUpdatedAt]
ON [dbo].[users]
AFTER UPDATE 
AS
   UPDATE dbo.users
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.users.id = i.id;
GO
ALTER TABLE [dbo].[users] ENABLE TRIGGER [usersUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[walletsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[walletsUpdateUpdatedAt]
ON [dbo].[wallets]
AFTER UPDATE 
AS
   UPDATE dbo.wallets
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.wallets.id = i.id;
GO
ALTER TABLE [dbo].[wallets] ENABLE TRIGGER [walletsUpdateUpdatedAt]
GO
/****** Object:  Trigger [dbo].[withdrawsUpdateUpdatedAt]    Script Date: 12/6/2022 5:09:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[withdrawsUpdateUpdatedAt]
ON [dbo].[withdraws]
AFTER UPDATE 
AS
   UPDATE dbo.withdraws
   SET updated_at = SYSDATETIME()
   FROM Inserted i
   WHERE dbo.withdraws.id = i.id;
GO
ALTER TABLE [dbo].[withdraws] ENABLE TRIGGER [withdrawsUpdateUpdatedAt]
GO
USE [master]
GO
ALTER DATABASE [main_group_project_perfect] SET  READ_WRITE 
GO
