/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/18/2018 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/18/2018 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/18/2018 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeNotes]    Script Date: 8/18/2018 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeNotes](
	[EmpNoteID] [int] IDENTITY(1,1) NOT NULL,
	[PetID] [int] NOT NULL,
	[EmployeeID] [nvarchar](128) NOT NULL,
	[Note] [nchar](500) NOT NULL,
	[NoteDate] [date] NOT NULL,
 CONSTRAINT [PK_EmployeeNotes] PRIMARY KEY CLUSTERED 
(
	[EmpNoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pets]    Script Date: 8/18/2018 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 8/18/2018 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Table [dbo].[ResortLocations]    Script Date: 8/18/2018 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResortLocations](
	[ResortLocationID] [int] IDENTITY(1,1) NOT NULL,
	[ResortName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[ReservationLimit] [tinyint] NOT NULL,
	[Coordinates] [nchar](30) NULL,
 CONSTRAINT [PK_ResortLocations] PRIMARY KEY CLUSTERED 
(
	[ResortLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a1ce66bf-cd92-4f51-b78a-bd6b78cc932a', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b9133139-3498-4e96-9b6c-8c79a86d13cd', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b93c605c-a321-4e58-ad35-8c56a5348a8e', N'Customer')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'b9133139-3498-4e96-9b6c-8c79a86d13cd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8a324957-3c21-4386-8ddb-91d474138b06', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'b9133139-3498-4e96-9b6c-8c79a86d13cd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'efb22f43-831e-4b69-aeb9-c8d51c6e1c01', N'a1ce66bf-cd92-4f51-b78a-bd6b78cc932a')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'79c9cc6f-cf8b-4cc6-871c-7e71dbfb6c0e', N'chad@codingbychad.com', 0, N'APR7Ge8rXKfUeR62/mGi/xBD2pQ6ja7jtAZPvKfErtXeO5mMdm61XjX8Ea4e0RdsMA==', N'79ef0d78-5561-4150-8c08-8556700724ef', NULL, 0, 0, NULL, 1, 0, N'chad@codingbychad.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'scoish.velociraptor.maloish@sdstate.edu', 0, N'AKh/95gJZT6EM1q3GNLOkC/+IPLj4x/zBrrBmtA446QX6GXchpjlQWN+fAQNsCUgrQ==', N'5f15edab-2535-4e3e-b920-4f524c6c4369', NULL, 0, 0, NULL, 1, 0, N'scoish.velociraptor.maloish@sdstate.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8a324957-3c21-4386-8ddb-91d474138b06', N'quatro.quatro@sjsu.edu', 0, N'AEFIHOdUha8wHU44AQZUghxXiMK28Pj2nrM4G9R1DnW0lEv/5P6yvq+y1fw8Kp7tcQ==', N'02b5b232-ed54-47a2-adb6-c70024d3ada7', NULL, 0, 0, NULL, 1, 0, N'quatro.quatro@sjsu.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'jackmerius.tacktheritrix@msu.edu', 0, N'ABwQvXYLVUesBqix/YcsxbWKDwhfufgI4HOrPQ7uX+tnY3S+t+MhTU0h+pIRQQDxEw==', N'7b30fbd8-d5d5-47ae-b82d-0c99bd096cd5', NULL, 0, 0, NULL, 1, 0, N'jackmerius.tacktheritrix@msu.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'tyroil.smoochi-wallace@miami.edu', 0, N'AKOknASXMms3duNcMFelRnifRsIZwpu7dVl10vmtjYeeWo2zFeLjfm1EKmgLNnaukg==', N'eda26a9d-17d5-4812-92c8-1fa9e84c6e26', NULL, 0, 0, NULL, 1, 0, N'tyroil.smoochi-wallace@miami.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e0d24cd5-459e-47e2-8e5e-138faa2da7a3', N'Hingle.McCringleberry@psu.edu', 0, N'AIS4U/jhQFOvcuTW6HALtykZhmcF6FgJsBfEEdCiO+l1dllbWhy+AJr7P/9u/1MzMA==', N'a14e68c6-e26a-44c1-8e16-54b45e4e3101', NULL, 0, 0, NULL, 1, 0, N'Hingle.McCringleberry@psu.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'efb22f43-831e-4b69-aeb9-c8d51c6e1c01', N'admin@example.com', 0, N'APamgRYS0KnskKmOol0QmjrzepCgMYtlGbhwVAt9t6CiacusvrfJA8i7m/SwtNQhVg==', N'32a5ff52-51bb-40f0-925a-d73bce234ed7', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
SET IDENTITY_INSERT [dbo].[EmployeeNotes] ON 

INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (1, 6, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'Loves belly rubs.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', CAST(0x6B3E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (2, 6, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'Spent 4 hours playing fetch. He never gets tired.                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', CAST(0x6C3E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (3, 6, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'Drool. There is drool everywhere. He needs a sponge.                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', CAST(0x6D3E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (5, 2, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'Licks everything.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   ', CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (6, 7, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'Ate my assistant today. My assistant would sometimes steal my lunch, so ... Way to go, Blue?                                                                                                                                                                                                                                                                                                                                                                                                                        ', CAST(0x933E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (7, 7, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'Ate my assistant today. My assistant would sometimes steal my lunch, so ... Way to go, Blue?                                                                                                                                                                                                                                                                                                                                                                                                                        ', CAST(0x933E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (8, 2, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'Test                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', CAST(0x8A3E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (9, 2, N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'She''s a good girl.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ', CAST(0x6C3E0B00 AS Date))
INSERT [dbo].[EmployeeNotes] ([EmpNoteID], [PetID], [EmployeeID], [Note], [NoteDate]) VALUES (10, 8, N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'May not be vegetarian. Think he ate my assistant''s ham sandwich. Not able to verify, because my assistant is also missing.                                                                                                                                                                                                                                                                                                                                                                                          ', CAST(0x983E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[EmployeeNotes] OFF
SET IDENTITY_INSERT [dbo].[Pets] ON 

INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (2, N'Mittens', N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'20180817100048072_mittens.jpg', N'She likes to drink water from the skulls of her enemies.', 1, CAST(0x973E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (3, N'Buttons', N'8a324957-3c21-4386-8ddb-91d474138b06', N'20180817101839235_buttons.jpg', N'Loves to cuddle.', 1, CAST(0x973E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (6, N'Buddy', N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'20180814130504963_buddy.jpg', N'Loves fetch. Will play for days.', 1, CAST(0x973E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (7, N'Blue', N'8a324957-3c21-4386-8ddb-91d474138b06', N'20180814130542399_blue.jpg', N'Can be bitey when hungry.', 1, CAST(0x843E0B00 AS Date))
INSERT [dbo].[Pets] ([PetID], [Name], [OwnerID], [PetPhoto], [SpecialNotes], [IsActive], [DateAdded]) VALUES (8, N'Rex', N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'20180814130629539_rex.jpg', N'Vegetarian', 1, CAST(0x963E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Pets] OFF
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (1, 1, 2, CAST(0xA93E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (2, 1, 6, CAST(0xA93E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (3, 2, 8, CAST(0xA93E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (4, 2, 2, CAST(0xA93E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (5, 2, 3, CAST(0xA93E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (6, 5, 2, CAST(0xAA3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (7, 5, 3, CAST(0xAA3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (8, 5, 6, CAST(0xAA3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (9, 5, 7, CAST(0xAA3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (10, 5, 8, CAST(0xAB3E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (11, 1, 2, CAST(0x983E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (12, 2, 2, CAST(0x983E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (13, 2, 3, CAST(0x983E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (14, 2, 6, CAST(0x983E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (15, 2, 7, CAST(0x983E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (16, 1, 2, CAST(0x983E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (17, 1, 8, CAST(0x993E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (18, 1, 2, CAST(0x993E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (19, 1, 3, CAST(0x993E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (20, 1, 6, CAST(0x993E0B00 AS Date))
INSERT [dbo].[Reservations] ([ReservationID], [ResortLocationID], [PetID], [ReservationDate]) VALUES (21, 1, 7, CAST(0x993E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Reservations] OFF
SET IDENTITY_INSERT [dbo].[ResortLocations] ON 

INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit], [Coordinates]) VALUES (1, N'Betty Brook', N'8646 Lee Blvd', N'Leawood', N'KS', 66206, 5, N'-94.614705, 38.971796         ')
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit], [Coordinates]) VALUES (2, N'Leawoof', N'106th & Lee Boulevard', N'Leawood', N'KS', 66211, 4, N'-94.6116024, 38.9332894       ')
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit], [Coordinates]) VALUES (3, N'Swope Dog Park', N'5051 E Gregory Blvd', N'Kansas City', N'MO', 64132, 4, N'-94.5275897, 38.9966864       ')
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit], [Coordinates]) VALUES (4, N'Penn Valley Park', N'W 28th & Wyandotte St', N'Kansas City', N'MO', 64108, 5, N'-94.588766, 39.0757432        ')
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit], [Coordinates]) VALUES (5, N'Stoll Off-Leash Dog Park', N'12500 W 119th St', N'Overland Park', N'KS', 66210, 4, N'-94.730676, 38.916525         ')
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit], [Coordinates]) VALUES (6, N'Tails & Trails Dog Park', N'8005 E 139th St', N'Grandview', N'MO', 64030, 4, N'-94.507984, 38.871705         ')
INSERT [dbo].[ResortLocations] ([ResortLocationID], [ResortName], [Address], [City], [State], [ZipCode], [ReservationLimit], [Coordinates]) VALUES (7, N'West Terrace Dog Park', N'750 Pennsylvania Ave', N'Kansas City', N'MO', 64105, 4, N'-94.59091, 39.105213          ')
SET IDENTITY_INSERT [dbo].[ResortLocations] OFF
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[EmployeeNotes]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeNotes_AspNetUsers] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[EmployeeNotes] CHECK CONSTRAINT [FK_EmployeeNotes_AspNetUsers]
GO
ALTER TABLE [dbo].[EmployeeNotes]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeNotes_Pets] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pets] ([PetID])
GO
ALTER TABLE [dbo].[EmployeeNotes] CHECK CONSTRAINT [FK_EmployeeNotes_Pets]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Pets] FOREIGN KEY([PetID])
REFERENCES [dbo].[Pets] ([PetID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Pets]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_ResortLocations] FOREIGN KEY([ResortLocationID])
REFERENCES [dbo].[ResortLocations] ([ResortLocationID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_ResortLocations]
GO
