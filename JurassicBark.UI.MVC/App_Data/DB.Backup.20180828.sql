IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_ResortLocations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_Reservations_ResortLocations]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Pets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_Reservations_Pets]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pets_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pets]'))
ALTER TABLE [dbo].[Pets] DROP CONSTRAINT [FK_Pets_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeNotes_Pets]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]'))
ALTER TABLE [dbo].[EmployeeNotes] DROP CONSTRAINT [FK_EmployeeNotes_Pets]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeNotes_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]'))
ALTER TABLE [dbo].[EmployeeNotes] DROP CONSTRAINT [FK_EmployeeNotes_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
DROP TABLE [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[ResortLocations]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResortLocations]') AND type in (N'U'))
DROP TABLE [dbo].[ResortLocations]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
DROP TABLE [dbo].[Reservations]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pets]') AND type in (N'U'))
DROP TABLE [dbo].[Pets]
GO
/****** Object:  Table [dbo].[EmployeeNotes]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]') AND type in (N'U'))
DROP TABLE [dbo].[EmployeeNotes]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/28/2018 2:59:40 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetRoles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUserClaims] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUserLogins] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUserRoles] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FName] [nchar](50) NULL,
	[LName] [nchar](50) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[AspNetUsers] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[EmployeeNotes]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EmployeeNotes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[PetID] [int] NOT NULL,
	[EmployeeID] [nvarchar](128) NOT NULL,
	[Note] [nchar](500) NOT NULL,
	[NoteDate] [date] NOT NULL,
 CONSTRAINT [PK_EmployeeNotes] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[EmployeeNotes] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pets]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pets](
	[PetID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[OwnerID] [nvarchar](128) NOT NULL,
	[PetPhoto] [varchar](50) NULL,
	[SpecialNotes] [varchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[DateAdded] [date] NOT NULL,
 CONSTRAINT [PK_Pets] PRIMARY KEY CLUSTERED 
(
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Pets] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[ResortLocationID] [int] NOT NULL,
	[PetID] [int] NOT NULL,
	[ReservationDate] [date] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Reservations] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[ResortLocations]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResortLocations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ResortLocations](
	[ResortLocationID] [int] IDENTITY(1,1) NOT NULL,
	[ResortName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[ReservationLimit] [tinyint] NOT NULL,
 CONSTRAINT [PK_ResortLocations] PRIMARY KEY CLUSTERED 
(
	[ResortLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[ResortLocations] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 8/28/2018 2:59:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
	[Address] [nchar](120) NOT NULL,
	[City] [nchar](20) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[ZipCode] [nchar](10) NOT NULL,
	[Birthday] [date] NOT NULL,
	[Phone] [nchar](14) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[UserDetails] TO  SCHEMA OWNER 
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a1ce66bf-cd92-4f51-b78a-bd6b78cc932a', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b9133139-3498-4e96-9b6c-8c79a86d13cd', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b93c605c-a321-4e58-ad35-8c56a5348a8e', N'Customer')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'22ad946e-4315-4d6f-9d52-4fa631d8d132', N'a1ce66bf-cd92-4f51-b78a-bd6b78cc932a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'b9133139-3498-4e96-9b6c-8c79a86d13cd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8a324957-3c21-4386-8ddb-91d474138b06', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8f792774-0e1b-4378-90c5-8773c9030421', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'97a8a591-ec48-4ad5-a0cb-fc53ed4c8e02', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'22ad946e-4315-4d6f-9d52-4fa631d8d132', N'chad@codingbychad.com', 1, N'AAVRCB67jP3PPbx2w9wjAaMAoMwjTAKnuNvzDEwXdfOhafgcEQTYsii/9g6G8fGKAA==', N'02f42d7a-12cb-4a3a-8acb-ea10d8fb9cbe', NULL, 0, 0, NULL, 1, 0, N'chad@codingbychad.com', N'Chad                                              ', N'Smith                                             ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'Hingle.McCringleberry@psu.edu', 0, N'AGsIPApfE9j1W3LkaAnltIfTmC95flPvBk+N6XaJSg7vuWcLIY4fd1Ae1/HJzu4L+g==', N'0756966d-6247-43c7-a902-1b59ca6cbcab', NULL, 0, 0, NULL, 1, 0, N'Hingle.McCringleberry@psu.edu', N'Hingle                                            ', N'McCringleberry                                    ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'scoish.velociraptor.maloish@sdstate.edu', 0, N'AKh/95gJZT6EM1q3GNLOkC/+IPLj4x/zBrrBmtA446QX6GXchpjlQWN+fAQNsCUgrQ==', N'5f15edab-2535-4e3e-b920-4f524c6c4369', NULL, 0, 0, NULL, 1, 0, N'scoish.velociraptor.maloish@sdstate.edu', N'Scoish Velociraptor                               ', N'Maloish                                           ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'8a324957-3c21-4386-8ddb-91d474138b06', N'quatro.quatro@sjsu.edu', 0, N'AEFIHOdUha8wHU44AQZUghxXiMK28Pj2nrM4G9R1DnW0lEv/5P6yvq+y1fw8Kp7tcQ==', N'02b5b232-ed54-47a2-adb6-c70024d3ada7', NULL, 0, 0, NULL, 1, 0, N'quatro.quatro@sjsu.edu', N'Quatro                                            ', N'Quatro                                            ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'8f792774-0e1b-4378-90c5-8773c9030421', N'chad.e.smith@outlook.com', 0, N'AMcM1gg8RDTR9bGa8GjCs2vrS5+WOk+oc2tS1p3VUtDcVuXxxbrtd7pmWVUBFSF8OQ==', N'4b55e86e-d5fe-4b7b-a1dc-d4b9bb552136', NULL, 0, 0, NULL, 1, 0, N'chad.e.smith@outlook.com', N'Chad                                              ', N'Smith                                             ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'97a8a591-ec48-4ad5-a0cb-fc53ed4c8e02', N'chad.e.smith75@gmail.com', 1, N'ADec/AAGumrf1RCC7Eda979VXzItvs04FK5+f+0e107wMQMUhphEVOU05XUdV3b0Ow==', N'bad514be-673e-45dd-b9e6-60b7e7639b8f', NULL, 0, 0, NULL, 1, 0, N'chad.e.smith75@gmail.com', N'Chad                                              ', N'Smith                                             ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'jackmerius.tacktheritrix@msu.edu', 0, N'ABwQvXYLVUesBqix/YcsxbWKDwhfufgI4HOrPQ7uX+tnY3S+t+MhTU0h+pIRQQDxEw==', N'7b30fbd8-d5d5-47ae-b82d-0c99bd096cd5', NULL, 0, 0, NULL, 1, 0, N'jackmerius.tacktheritrix@msu.edu', N'Jackmerius                                        ', N'Tacktheritrix                                     ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'tyroil.smoochi-wallace@miami.edu', 0, N'AKOknASXMms3duNcMFelRnifRsIZwpu7dVl10vmtjYeeWo2zFeLjfm1EKmgLNnaukg==', N'eda26a9d-17d5-4812-92c8-1fa9e84c6e26', NULL, 0, 0, NULL, 1, 0, N'tyroil.smoochi-wallace@miami.edu', N'Tyroil                                            ', N'Smoochi-Wallace                                   ')
SET IDENTITY_INSERT [dbo].[EmployeeNotes] ON 

INSERT [dbo].[EmployeeNotes] ([NoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (1, 1, N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'Ugly, but good boy.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ', CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([NoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (2, 6, N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'Loves belly rubs and mud puddles.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', CAST(0x9F3E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[EmployeeNotes] OFF
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (1, N'Buttons', N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'20180820083422430_buttons.jpg', N'Likes fetch, belly rubs, and long walks in the park.', 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (2, N'Mittens', N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'20180820083936399_mittens.jpg', N'Fetch is life.', 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (3, N'Buddy', N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'20180820084423963_buddy.jpg', N'Loves to cuddle.', 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (4, N'Blue', N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'20180820084507670_pet4.png', N'Very possessive of toys and food.', 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (5, N'Rexie', N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'20180820084619762_rex.jpg', N'Vegan. Doesn''t like high-fives, push-ups, or hand grenades.', 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (6, N'Wilbur', N'8a324957-3c21-4386-8ddb-91d474138b06', N'20180820084710114_pet3.jpg', N'Some pig.', 1, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (9, N'Walter Kronkite', N'8f792774-0e1b-4378-90c5-8773c9030421', N'20180820232955131_pet5.jpg', N'He''s rarely sad, despite the long face.', 1, CAST(0x9C3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (10, N'Owen Wilson', N'8f792774-0e1b-4378-90c5-8773c9030421', N'20180821120910325_OwenWilson.jpg', N'Just likes to chill. And say, "Wow."', 0, CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (17, N'Max', N'97a8a591-ec48-4ad5-a0cb-fc53ed4c8e02', N'20180828125824343_Max.jpg', N'Loves fetch. Will play for days.', 1, CAST(0xA53E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Pets] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (2, 1, 2, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (3, 2, 1, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (4, 2, 2, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (5, 3, 3, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (7, 4, 5, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (8, 4, 6, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (10, 1, 2, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (13, 1, 1, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (14, 1, 3, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (16, 1, 1, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (17, 1, 1, CAST(0xA13E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (18, 2, 3, CAST(0xA13E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (19, 1, 1, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (20, 1, 1, CAST(0xA23E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (21, 1, 1, CAST(0x9C3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (23, 6, 9, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (25, 2, 2, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (30, 1, 2, CAST(0xA03E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (31, 1, 2, CAST(0xA23E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (32, 1, 2, CAST(0xA63E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (34, 1, 2, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (38, 1, 2, CAST(0x913E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (39, 1, 2, CAST(0x923E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (40, 1, 2, CAST(0x973E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (42, 3, 2, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (43, 1, 6, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (44, 1, 9, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (45, 6, 9, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (46, 6, 10, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (55, 1, 1, CAST(0x9D3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (56, 6, 9, CAST(0xA03E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (57, 5, 10, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (59, 4, 9, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (61, 5, 10, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (62, 6, 10, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (63, 7, 2, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (65, 4, 2, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (66, 2, 9, CAST(0x9F3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (67, 5, 9, CAST(0x9E3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (73, 1, 2, CAST(0xA13E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (74, 1, 2, CAST(0xA13E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (87, 1, 10, CAST(0xA43E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (90, 1, 1, CAST(0xA43E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (91, 1, 1, CAST(0xA43E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (96, 1, 9, CAST(0xA53E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (97, 6, 10, CAST(0xA53E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (98, 1, 9, CAST(0xA63E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (101, 1, 9, CAST(0xA53E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (103, 3, 17, CAST(0xA53E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Reservations] OFF
SET IDENTITY_INSERT [dbo].[ResortLocations] ON 

INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (1, N'Leawoof', N'106th & Lee Boulevard', N'Leawood', N'KS', 66211, 5)
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (2, N'Swope Dog Park', N'5051 E Gregory Boulevard', N'Kansas City', N'MO', 64132, 4)
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (3, N'Penn Valley Off Leash Dog Park', N'W 28th & Wyandotte St', N'Kansas City', N'MO', 64108, 4)
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (4, N'Stoll Off-Leash Dog Park', N'12500 W 119th St', N'Overland Park', N'KS', 66210, 4)
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (5, N'Tails & Trails Dog Park', N'8005 E 139th St', N'Grandview', N'MO', 64030, 4)
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (6, N'West Terrace Dog Park', N'750 Pennsylvania Ave', N'Kansas City', N'MO', 64105, 4)
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit]) VALUES (7, N'Betty Brook', N'8646 Lee Blvd', N'Leawood', N'KS', 66206, 5)
SET IDENTITY_INSERT [dbo].[ResortLocations] OFF
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (1, N'22ad946e-4315-4d6f-9d52-4fa631d8d132', N'5627 N Delta Ave                                                                                                        ', N'Kansas City         ', N'MO', N'64151     ', CAST(0x03010B00 AS Date), N'7198391071    ')
INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (2, N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'8700 State Line Road, Suite 200                                                                                         ', N'Leawood             ', N'KS', N'66206     ', CAST(0xE5210B00 AS Date), N'816-555-1212  ')
INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (3, N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'8700 State Line Road, Suite 200                                                                                         ', N'Leawood             ', N'KS', N'66206     ', CAST(0xD81D0B00 AS Date), N'816-555-1212  ')
INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (4, N'8a324957-3c21-4386-8ddb-91d474138b06', N'8700 State Line Road, Suite 200                                                                                         ', N'Leawood             ', N'KS', N'66206     ', CAST(0x96180B00 AS Date), N'816-555-1212  ')
INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (5, N'8f792774-0e1b-4378-90c5-8773c9030421', N'5627 N Delta Ave                                                                                                        ', N'Kansas City         ', N'MO', N'64151     ', CAST(0x69200B00 AS Date), N'719-839-1071  ')
INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (6, N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'8700 State Line Road, Suite 200                                                                                         ', N'Leawood             ', N'KS', N'66206     ', CAST(0x13220B00 AS Date), N'816-555-1212  ')
INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (7, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'8700 State Line Road, Suite 200                                                                                         ', N'Leawood             ', N'KS', N'66206     ', CAST(0x15230B00 AS Date), N'816-555-1212  ')
INSERT [dbo].[UserDetails] ([Id], [AspNetUserId], [Address], [City], [State], [ZipCode], [Birthday], [Phone]) VALUES (18, N'97a8a591-ec48-4ad5-a0cb-fc53ed4c8e02', N'5627 N Delta Ave                                                                                                        ', N'Kansas City         ', N'MO', N'64151     ', CAST(0xA53E0B00 AS Date), N'719-839-1071  ')
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeNotes_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]'))
ALTER TABLE [dbo].[EmployeeNotes]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeNotes_AspNetUsers] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeNotes_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]'))
ALTER TABLE [dbo].[EmployeeNotes] CHECK CONSTRAINT [FK_EmployeeNotes_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeNotes_Pets]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]'))
ALTER TABLE [dbo].[EmployeeNotes]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeNotes_Pets] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pets] ([PetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EmployeeNotes_Pets]') AND parent_object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]'))
ALTER TABLE [dbo].[EmployeeNotes] CHECK CONSTRAINT [FK_EmployeeNotes_Pets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pets_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pets]'))
ALTER TABLE [dbo].[Pets]  WITH CHECK ADD  CONSTRAINT [FK_Pets_AspNetUsers] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Pets_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pets]'))
ALTER TABLE [dbo].[Pets] CHECK CONSTRAINT [FK_Pets_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Pets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Pets] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pets] ([PetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_Pets]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Pets]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_ResortLocations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_ResortLocations] FOREIGN KEY([ResortLocationID])
REFERENCES [dbo].[ResortLocations] ([ResortLocationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Reservations_ResortLocations]') AND parent_object_id = OBJECT_ID(N'[dbo].[Reservations]'))
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_ResortLocations]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
