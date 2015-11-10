CREATE TABLE [dbo].[Teams] (
    [Id]   INT           IDENTITY (1, 1) NOT NULL,
    [Code] NVARCHAR (10) NOT NULL,
    [Name] NVARCHAR (40) NOT NULL,
    CONSTRAINT [PK_dbo.Teams] PRIMARY KEY CLUSTERED ([Id] ASC)
);

