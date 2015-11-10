CREATE TABLE [dbo].[Clients] (
    [Id]                    INT            IDENTITY (1, 1) NOT NULL,
    [ExtId]                 INT            NULL,
    [BranchId]              INT            NOT NULL,
    [FirstName]             NVARCHAR (100) NOT NULL,
    [LastName]              NVARCHAR (100) NOT NULL,
    [Phone]                 NVARCHAR (20)  NULL,
    [Address]               NVARCHAR (100) NULL,
    [City]                  NVARCHAR (50)  NULL,
    [State]                 NVARCHAR (2)   NULL,
    [Zip]                   NVARCHAR (10)  NULL,
    [PseudoPerson]          BIT            DEFAULT ((0)) NOT NULL,
    [FamilyCaregiverClient] BIT            DEFAULT ((0)) NOT NULL,
    [IvrClient]             BIT            DEFAULT ((0)) NOT NULL,
    [ManagedCareClient]     BIT            DEFAULT ((0)) NOT NULL,
    [Latitude]              DECIMAL (9, 6) NULL,
    [Longitude]             DECIMAL (9, 6) NULL,
    CONSTRAINT [PK_dbo.Clients] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Clients_dbo.Branches_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branches] ([Id]) ON DELETE CASCADE
);

