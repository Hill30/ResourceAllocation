CREATE TABLE [dbo].[Processes] (
    [Id]         INT           IDENTITY (1, 1) NOT NULL,
    [Code] NVARCHAR(4) NOT NULL , 
    [Name]       NVARCHAR (50) NOT NULL,
    [CallType]   INT           NOT NULL,
    [CallerType] INT           NOT NULL,
    [SortOrder] INT NULL, 
    CONSTRAINT [PK_Processes] PRIMARY KEY CLUSTERED ([Id] ASC)
);

