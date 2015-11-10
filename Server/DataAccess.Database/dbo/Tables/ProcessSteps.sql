CREATE TABLE [dbo].[ProcessSteps] (
    [ProcessId] INT            NOT NULL,
    [StepId]    INT            NOT NULL,
    [Mandatory] BIT            NOT NULL,
    [Params]    NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_ProcessSteps] PRIMARY KEY CLUSTERED ([ProcessId] ASC, [StepId] ASC),
    CONSTRAINT [FK_ProcessSteps_Processes] FOREIGN KEY ([ProcessId]) REFERENCES [dbo].[Processes] ([Id]),
    CONSTRAINT [FK_ProcessSteps_Steps] FOREIGN KEY ([StepId]) REFERENCES [dbo].[Steps] ([Id])
);

