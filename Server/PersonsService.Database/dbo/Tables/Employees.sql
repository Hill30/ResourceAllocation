CREATE TABLE [dbo].[Employees] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [ExtId]        INT            NULL,
    [BranchId]     INT            DEFAULT ((0)) NOT NULL,
    [FirstName]    NVARCHAR (100) DEFAULT ('') NULL,
    [LastName]     NVARCHAR (100) DEFAULT ('') NOT NULL,
    [Phone]        NVARCHAR (20)  DEFAULT ('') NULL,
    [Address]      NVARCHAR (100) DEFAULT ('') NULL,
    [City]         NVARCHAR (50)  DEFAULT ('') NULL,
    [State]        NVARCHAR (2)   DEFAULT ('') NULL,
    [Zip]          NVARCHAR (10)  NULL,
    [IsAmpUser]    BIT            DEFAULT ((0)) NOT NULL,
    [PseudoPerson] BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.Employees] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Employees_dbo.Branches_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branches] ([Id]) ON DELETE CASCADE
);

