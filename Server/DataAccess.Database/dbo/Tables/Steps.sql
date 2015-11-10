CREATE TABLE [dbo].[Steps] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Type]        NVARCHAR (100) NOT NULL,
    [Description] NVARCHAR (250) NULL,
    CONSTRAINT [PK_Steps] PRIMARY KEY CLUSTERED ([Id] ASC)
);

