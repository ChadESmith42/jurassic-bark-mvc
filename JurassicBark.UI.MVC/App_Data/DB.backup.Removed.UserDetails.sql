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
/****** Object:  Table [dbo].[ResortLocations]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResortLocations]') AND type in (N'U'))
DROP TABLE [dbo].[ResortLocations]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reservations]') AND type in (N'U'))
DROP TABLE [dbo].[Reservations]
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pets]') AND type in (N'U'))
DROP TABLE [dbo].[Pets]
GO
/****** Object:  Table [dbo].[EmployeeNotes]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]') AND type in (N'U'))
DROP TABLE [dbo].[EmployeeNotes]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/17/2018 12:02:23 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 8/17/2018 12:02:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/17/2018 12:02:23 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/17/2018 12:02:23 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/17/2018 12:02:23 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/17/2018 12:02:23 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/17/2018 12:02:23 PM ******/
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EmployeeNotes]    Script Date: 8/17/2018 12:02:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeNotes]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Pets]    Script Date: 8/17/2018 12:02:23 PM ******/
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
/****** Object:  Table [dbo].[Reservations]    Script Date: 8/17/2018 12:02:23 PM ******/
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
/****** Object:  Table [dbo].[ResortLocations]    Script Date: 8/17/2018 12:02:23 PM ******/
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
	[Coordinates] [nchar](30) NULL,
 CONSTRAINT [PK_ResortLocations] PRIMARY KEY CLUSTERED 
(
	[ResortLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201808131450502_InitialCreate', N'IdentitySample.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2D31E27CE8E2F98B607791BB025765B1889D24A94D7C6225F96877C527E214589BAF0A64BB7DCDD5E2CB09816C953C5E221592C16FDBFFFFC77FAD37318584F3849FD889CD9479343DBC2C48D3C9FACCEEC8C2E7FF860FFF4E31FFF30FDE485CFD6D7B2DE09AB072D497A663F521A9F3A4EEA3EE210A593D07793288D9674E246A183BCC8393E3CFC9B7374E46080B001CBB2A65F3242FD10E73FE0E72C222E8E698682EBC8C341CABF43C93C47B56E5088D318B9F8CCBEF230B4A52F7314C6019E140D6CEB3CF0112833C7C1D2B61021114514543D7D48F19C261159CD63F88082FB971843BD250A52CCBB705A57EFDB9BC363D61BA76E5842B9594AA37020E0D109378F23375FCBC876653E30E0A7DC58ACD7B9116BFB7D890230802CF0741624ACF2997D5D89384FE31B4C2765C34901799900DCAF51F27DD2443CB07AB73BA8E8743C3964FF1D58B32CA05982CF08CE68828203EB2E5B04BEFB337EB98FBE63727672B4589E7C78F71E7927EFFF8A4FDE357B0A7D857AC207F8749744314E4037BCACFA6F5B8ED8CE911B56CD1A6D0AAB00976066D8D6357AFE8CC98A3EC29C39FE605B97FE33F6CA2F9C5C0FC48789048D6892C1CF9B2C08D022C055B9D32A93FDBF45EAF1BBF7A348BD414FFE2A1F7A493E4C9C04E6D5171CE4A5E9A31F17D34B18EF6FBCDA651285ECB7C8AFA2F4DB3CCA129775263256B947C90A5351BBA95393B717A519D4F8B42E51F79FDA4C5395DEDAAAAC43EBCC8452C4B66743A9EFEBCAEDCDB8F33886C1CBA9C52CD24638ED7E3591000EAC7F66094A53DFFD88807A0F5793EBAFB39A45477D5944A077BFE745F15388FC608455B18714F049967E12E2AA971F23E020228375BE83718545C1FB074A1F5B54877F8EA0FA1CBB59C2D846816EAF2EEDEE3122F8260B176C0A6C4FD6684373FF6B74895C1A259F086BB531DEE7C8FD1E65F413F12E10C50FD42D01D9CF7B3FEC0F308A3AE7AE8BD3F412C88CBD59042E77097845E8C9F16038B650EDDA2B9905C80FF56E89B4A47E2BABD6AE89BE86E29E18AAE95C9436553F472B9FF453B5AC6A56B5A8D1A92AAF36545506D64F535ED3AC685EA153CFA2D6684E5F3E42E37B7D39ECFEBB7D9B6DDEA6B5A061C639AC90F8EF98E0049631EF0E518A13528F409F756317CE423E7C4CE8ABEF4DB9A4AF28C8C616B5D66CC81781F167430EBBFFB32157133E3FF91EF34A7A9C85CACA00DFABBEFE98D53DE724CDB63D1D846E6E5BF876D600D374394FD3C8F5F359A08982F11886A83FF870567740A3E88D1C14818E01D17DB6E5C117E89B2D93EA965CE000536C9DBB45947086521779AA19A143DE00C5CA1D55A3581D1C1195FB8B2213988E13D608B143500A33D527549D163E71FD18059D56925AF6DCC258DF2B1972C9058E3161023B2DD147B83E16C214A8E44883D265A1A9D3605C3B110D5EAB69CCBB5CD87ADC9510C55638D9E13B1B78C9FDB7572166BBC5B640CE7693F451C018D7DB0541F959A52F01E483CBBE11543A311908CA5DAAAD1054B4D80E082A9AE4CD11B438A2F61D7FE9BCBA6FF4140FCADBDFD65BCDB5036E0AF6D8336A16BE27B4A1D002272A3D2F16AC103F53CDE10CF4E4E7B394BBBA3245F24B044CC5904DEDEF6AFD50A71D4426511B604DB40E507E23A80029136A8072652CAF553BEE450C802DE36EADB07CED97601B1C50B19B37A38D8AE6FB53999CBD4E1F55CF2A362824EF755868E06808212F5E62C77B18C51497550DD3C7171EE20D373AC607A3C5401D9EABC148656746B75249CD6E2BE91CB2212ED9465692DC278395CACE8C6E25CED16E23699C82016EC1462612B7F091265B19E9A8769BAA6CEA143953FCC3D43124574DAF511CFB64D548B6E25FAC79916935FB613E3CFF282C301C37D5A42155DA56926894A015964A4134687AE92729BD40142D108BF3CCBC50A9A6DD5B0DCB7F29B2B97DAA8358EE03656DF66F716D17EFF185ED56F54738CC257432644E4D1E49D75040DFDC62F96F28408926783F8B822C24661FCBDCBAB8C26BB62FBEA8085347D25FF1A11483299EAE68FD5E63A3CE8BF1C6A9F262D61F2B3384C9E2A50FDAB4B9C92F35A39461AA268A2974B5B3B133B93343C74B7616870F5727C2EBCC2E9EA1D204E09F066234921C14B046597F54310FA5892996F44794924D9A9052D1002D9B29258292CD82B5F00C16D5D7E82F414D2269A2ABA5FD9135E9244D684DF11AD81A9DE5B2FEA89A8C9326B0A6B83F769D7E22AFA37BBC7F198F309B6C60C54177B31DCC80F13A8BE2381B60E33EBF09D4F83C108BDFD82B60FCFB5E12CA78DADB845045886333421930CCEB8F70192E2E3FAD37F8664CE1865B58E2DB6EF8CD78C368FBAAE450CE7B72954A7A75EE93CE77537ED6EA7E61A31CBE8A2AB6559A11B6F79794E270C22A4CE6BF04B3C0C76C312F2B5C23E22F714A8BAC0EFBF8F0E8587AA1B33FAF659C34F502CD59D5F464461CB32D2468912794B88F2851D32536785152832A91E82BE2E1E733FBB7BCD5691ED460FFCA3F1F5857E903F17FC9A0E03EC9B0F56F35FD739C0CFBF6D3D69EBE87E86FD5AB7F7D2B9A1E58B709CC9853EB50B2E53A232CBE9218A44DD174036DD67E3BF1762794F01A418B2A4D88F51F1F2C7C3ACAC38352CB3F85E8F9CF4355D33E2ED80851F380602CBC514C687A20B00E96F17180073F69FE38605867F58F05D651CDF850C027C3C1E46702FD97A1B2E50EB71ACDB1681B4B526EE7CE34EB8D722E77BD3729D9D81B4D7435E37A00DC0659D56B30E38D25248FB63B6AF28D47C3DE25B55F3DC9785FF28AEB8C8FDDA6136F3383B8E57EE8779538BC07A96E9AD49DDDA7076F9B6BA650EE9EE7580E4B02DE33B2F184AEDDA7FA6E9B6CA630EF9E936D5042EF9E716D57FBE78E99D67B0BDD797AAE9A6964B892D1C582BBD26F8BC0399CF0171190A0F0288B5793FA7C2F93B09A2C46817515B35073A2992C5899388A5CA546BBD8617DE51B7E6B67799D76B186F4CC36D97CFD6F95CDEBB4CB36243DEE2271589B76A84BE6EE58C7DAB2A1DE52A2B0D0938EBCF42E9FB5F57EFD2DE5058F621461F618EE88DF4E1AF028261973EA0C48FB55AF7B61EF6CFCD945D8BF537F5543B03FC248B02BEC9A559D2BB28CCACD5BD2A8AC224568AE31451E6CA9E709F597C8A550CC62CCF9B3EF3C6EC76E3A16D8BB22B7198D330A5DC6E12210025ECC0968939FE7368B3A4F6FE3FC2F988CD10550D367B1F95BF231F303AFD2FB521313324030EF824774D9585216D95DBD54483711E909C4CD573945F7388C03004B6FC91C3DE1757403FA7DC62BE4BED411401348F74088669F5EF86895A030E518757BF8091CF6C2E71FFF0F6DD643B47D540000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a1ce66bf-cd92-4f51-b78a-bd6b78cc932a', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b93c605c-a321-4e58-ad35-8c56a5348a8e', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'b9133139-3498-4e96-9b6c-8c79a86d13cd', N'Employee')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'efb22f43-831e-4b69-aeb9-c8d51c6e1c01', N'a1ce66bf-cd92-4f51-b78a-bd6b78cc932a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'b9133139-3498-4e96-9b6c-8c79a86d13cd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'b9133139-3498-4e96-9b6c-8c79a86d13cd')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8a324957-3c21-4386-8ddb-91d474138b06', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'b93c605c-a321-4e58-ad35-8c56a5348a8e')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4b11b45d-0ccb-4581-b34e-fc8b89622c9b', N'Hingle.McCringleberry@psu.edu', 0, N'AGsIPApfE9j1W3LkaAnltIfTmC95flPvBk+N6XaJSg7vuWcLIY4fd1Ae1/HJzu4L+g==', N'0756966d-6247-43c7-a902-1b59ca6cbcab', NULL, 0, 0, NULL, 1, 0, N'Hingle.McCringleberry@psu.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8050e07f-e735-4acf-9bf9-840b2b94ec77', N'scoish.velociraptor.maloish@sdstate.edu', 0, N'AKh/95gJZT6EM1q3GNLOkC/+IPLj4x/zBrrBmtA446QX6GXchpjlQWN+fAQNsCUgrQ==', N'5f15edab-2535-4e3e-b920-4f524c6c4369', NULL, 0, 0, NULL, 1, 0, N'scoish.velociraptor.maloish@sdstate.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8a324957-3c21-4386-8ddb-91d474138b06', N'quatro.quatro@sjsu.edu', 0, N'AEFIHOdUha8wHU44AQZUghxXiMK28Pj2nrM4G9R1DnW0lEv/5P6yvq+y1fw8Kp7tcQ==', N'02b5b232-ed54-47a2-adb6-c70024d3ada7', NULL, 0, 0, NULL, 1, 0, N'quatro.quatro@sjsu.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b4b84bb1-83a8-4d9f-a0ca-3acbca71041a', N'jackmerius.tacktheritrix@msu.edu', 0, N'ABwQvXYLVUesBqix/YcsxbWKDwhfufgI4HOrPQ7uX+tnY3S+t+MhTU0h+pIRQQDxEw==', N'7b30fbd8-d5d5-47ae-b82d-0c99bd096cd5', NULL, 0, 0, NULL, 1, 0, N'jackmerius.tacktheritrix@msu.edu')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c9b3f94f-fe6b-4dd2-83fa-4164b7ce871f', N'tyroil.smoochi-wallace@miami.edu', 0, N'AKOknASXMms3duNcMFelRnifRsIZwpu7dVl10vmtjYeeWo2zFeLjfm1EKmgLNnaukg==', N'eda26a9d-17d5-4812-92c8-1fa9e84c6e26', NULL, 0, 0, NULL, 1, 0, N'tyroil.smoochi-wallace@miami.edu')
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
