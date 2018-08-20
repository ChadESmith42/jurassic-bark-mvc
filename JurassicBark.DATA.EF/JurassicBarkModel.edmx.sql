
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/18/2018 14:14:29
-- Generated from EDMX file: C:\Users\Student\Desktop\Project\src\JurassicBark.DATA.EF\JurassicBarkModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [jurassicbark];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetRoles_RoleId];
GO
IF OBJECT_ID(N'[dbo].[FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo_AspNetUserRoles_dbo_AspNetUsers_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeNotes_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeNotes] DROP CONSTRAINT [FK_EmployeeNotes_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_EmployeeNotes_Pets]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EmployeeNotes] DROP CONSTRAINT [FK_EmployeeNotes_Pets];
GO
IF OBJECT_ID(N'[dbo].[FK_Pets_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pets] DROP CONSTRAINT [FK_Pets_AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_Reservations_Pets]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_Reservations_Pets];
GO
IF OBJECT_ID(N'[dbo].[FK_Reservations_ResortLocations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reservations] DROP CONSTRAINT [FK_Reservations_ResortLocations];
GO
IF OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT [FK_UserDetails_AspNetUsers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AspNetRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserClaims]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserClaims];
GO
IF OBJECT_ID(N'[dbo].[AspNetUserRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUserRoles];
GO
IF OBJECT_ID(N'[dbo].[AspNetUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AspNetUsers];
GO
IF OBJECT_ID(N'[dbo].[EmployeeNotes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeeNotes];
GO
IF OBJECT_ID(N'[dbo].[Pets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pets];
GO
IF OBJECT_ID(N'[dbo].[Reservations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reservations];
GO
IF OBJECT_ID(N'[dbo].[ResortLocations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ResortLocations];
GO
IF OBJECT_ID(N'[dbo].[UserDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserDetails];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AspNetRoles'
CREATE TABLE [dbo].[AspNetRoles] (
    [Id] nvarchar(128)  NOT NULL,
    [Name] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'AspNetUsers'
CREATE TABLE [dbo].[AspNetUsers] (
    [Id] nvarchar(128)  NOT NULL,
    [Email] nvarchar(256)  NULL,
    [EmailConfirmed] bit  NOT NULL,
    [PasswordHash] nvarchar(max)  NULL,
    [SecurityStamp] nvarchar(max)  NULL,
    [PhoneNumber] nvarchar(max)  NULL,
    [PhoneNumberConfirmed] bit  NOT NULL,
    [TwoFactorEnabled] bit  NOT NULL,
    [LockoutEndDateUtc] datetime  NULL,
    [LockoutEnabled] bit  NOT NULL,
    [AccessFailedCount] int  NOT NULL,
    [UserName] nvarchar(256)  NOT NULL,
    [FName] nvarchar(max)  NULL,
    [LName] nvarchar(max)  NULL
);
GO

-- Creating table 'Pets'
CREATE TABLE [dbo].[Pets] (
    [PetID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(20)  NOT NULL,
    [OwnerID] nvarchar(128)  NOT NULL,
    [PetPhoto] varchar(50)  NULL,
    [SpecialNotes] varchar(300)  NULL,
    [IsActive] bit  NOT NULL,
    [DateAdded] datetime  NOT NULL
);
GO

-- Creating table 'Reservations'
CREATE TABLE [dbo].[Reservations] (
    [ReservationID] int IDENTITY(1,1) NOT NULL,
    [ResortLocationID] int  NOT NULL,
    [PetID] int  NOT NULL,
    [ReservationDate] datetime  NOT NULL
);
GO

-- Creating table 'ResortLocations'
CREATE TABLE [dbo].[ResortLocations] (
    [ResortLocationID] int IDENTITY(1,1) NOT NULL,
    [ResortName] varchar(50)  NOT NULL,
    [Address] varchar(100)  NOT NULL,
    [City] varchar(50)  NOT NULL,
    [State] char(2)  NOT NULL,
    [ZipCode] int  NOT NULL,
    [ReservationLimit] tinyint  NOT NULL,
    [Coordinates] nchar(30)  NULL
);
GO

-- Creating table 'EmployeeNotes'
CREATE TABLE [dbo].[EmployeeNotes] (
    [PetID] int  NOT NULL,
    [EmployeeID] nvarchar(128)  NOT NULL,
    [Note] nchar(500)  NOT NULL,
    [NoteDate] datetime  NOT NULL,
    [EmpNoteID] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'AspNetUserClaims'
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [ClaimType] nvarchar(max)  NULL,
    [ClaimValue] nvarchar(max)  NULL
);
GO

-- Creating table 'UserDetails'
CREATE TABLE [dbo].[UserDetails] (
    [Id] int  NOT NULL,
    [AspNetUserId] nvarchar(128)  NOT NULL,
    [Address] nchar(120)  NOT NULL,
    [City] nchar(20)  NOT NULL,
    [State] nchar(2)  NOT NULL,
    [ZipCode] nchar(12)  NOT NULL,
    [Birthday] datetime  NOT NULL,
    [Phone] nchar(14)  NOT NULL
);
GO

-- Creating table 'AspNetUserRoles'
CREATE TABLE [dbo].[AspNetUserRoles] (
    [AspNetRoles_Id] nvarchar(128)  NOT NULL,
    [AspNetUsers_Id] nvarchar(128)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AspNetRoles'
ALTER TABLE [dbo].[AspNetRoles]
ADD CONSTRAINT [PK_AspNetRoles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUsers'
ALTER TABLE [dbo].[AspNetUsers]
ADD CONSTRAINT [PK_AspNetUsers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [PetID] in table 'Pets'
ALTER TABLE [dbo].[Pets]
ADD CONSTRAINT [PK_Pets]
    PRIMARY KEY CLUSTERED ([PetID] ASC);
GO

-- Creating primary key on [ReservationID] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [PK_Reservations]
    PRIMARY KEY CLUSTERED ([ReservationID] ASC);
GO

-- Creating primary key on [ResortLocationID] in table 'ResortLocations'
ALTER TABLE [dbo].[ResortLocations]
ADD CONSTRAINT [PK_ResortLocations]
    PRIMARY KEY CLUSTERED ([ResortLocationID] ASC);
GO

-- Creating primary key on [EmpNoteID] in table 'EmployeeNotes'
ALTER TABLE [dbo].[EmployeeNotes]
ADD CONSTRAINT [PK_EmployeeNotes]
    PRIMARY KEY CLUSTERED ([EmpNoteID] ASC);
GO

-- Creating primary key on [Id] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [PK_AspNetUserClaims]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserDetails'
ALTER TABLE [dbo].[UserDetails]
ADD CONSTRAINT [PK_UserDetails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [AspNetRoles_Id], [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [PK_AspNetUserRoles]
    PRIMARY KEY CLUSTERED ([AspNetRoles_Id], [AspNetUsers_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OwnerID] in table 'Pets'
ALTER TABLE [dbo].[Pets]
ADD CONSTRAINT [FK_Pets_AspNetUsers]
    FOREIGN KEY ([OwnerID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Pets_AspNetUsers'
CREATE INDEX [IX_FK_Pets_AspNetUsers]
ON [dbo].[Pets]
    ([OwnerID]);
GO

-- Creating foreign key on [PetID] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [FK_Reservations_Pets]
    FOREIGN KEY ([PetID])
    REFERENCES [dbo].[Pets]
        ([PetID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reservations_Pets'
CREATE INDEX [IX_FK_Reservations_Pets]
ON [dbo].[Reservations]
    ([PetID]);
GO

-- Creating foreign key on [ResortLocationID] in table 'Reservations'
ALTER TABLE [dbo].[Reservations]
ADD CONSTRAINT [FK_Reservations_ResortLocations]
    FOREIGN KEY ([ResortLocationID])
    REFERENCES [dbo].[ResortLocations]
        ([ResortLocationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Reservations_ResortLocations'
CREATE INDEX [IX_FK_Reservations_ResortLocations]
ON [dbo].[Reservations]
    ([ResortLocationID]);
GO

-- Creating foreign key on [AspNetRoles_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
    FOREIGN KEY ([AspNetRoles_Id])
    REFERENCES [dbo].[AspNetRoles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [AspNetUsers_Id] in table 'AspNetUserRoles'
ALTER TABLE [dbo].[AspNetUserRoles]
ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers]
    FOREIGN KEY ([AspNetUsers_Id])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AspNetUserRoles_AspNetUsers'
CREATE INDEX [IX_FK_AspNetUserRoles_AspNetUsers]
ON [dbo].[AspNetUserRoles]
    ([AspNetUsers_Id]);
GO

-- Creating foreign key on [EmployeeID] in table 'EmployeeNotes'
ALTER TABLE [dbo].[EmployeeNotes]
ADD CONSTRAINT [FK_EmployeeNotes_AspNetUsers]
    FOREIGN KEY ([EmployeeID])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeNotes_AspNetUsers'
CREATE INDEX [IX_FK_EmployeeNotes_AspNetUsers]
ON [dbo].[EmployeeNotes]
    ([EmployeeID]);
GO

-- Creating foreign key on [PetID] in table 'EmployeeNotes'
ALTER TABLE [dbo].[EmployeeNotes]
ADD CONSTRAINT [FK_EmployeeNotes_Pets]
    FOREIGN KEY ([PetID])
    REFERENCES [dbo].[Pets]
        ([PetID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EmployeeNotes_Pets'
CREATE INDEX [IX_FK_EmployeeNotes_Pets]
ON [dbo].[EmployeeNotes]
    ([PetID]);
GO

-- Creating foreign key on [UserId] in table 'AspNetUserClaims'
ALTER TABLE [dbo].[AspNetUserClaims]
ADD CONSTRAINT [FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId'
CREATE INDEX [IX_FK_dbo_AspNetUserClaims_dbo_AspNetUsers_UserId]
ON [dbo].[AspNetUserClaims]
    ([UserId]);
GO

-- Creating foreign key on [AspNetUserId] in table 'UserDetails'
ALTER TABLE [dbo].[UserDetails]
ADD CONSTRAINT [FK_UserDetails_AspNetUsers]
    FOREIGN KEY ([AspNetUserId])
    REFERENCES [dbo].[AspNetUsers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserDetails_AspNetUsers'
CREATE INDEX [IX_FK_UserDetails_AspNetUsers]
ON [dbo].[UserDetails]
    ([AspNetUserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------