CREATE TABLE [dbo].[ProcessReasons] (
    [ProcessId] INT NOT NULL,
    [ReasonId]  INT NOT NULL,
    CONSTRAINT [PK_ProcessReason] PRIMARY KEY CLUSTERED ([ProcessId] ASC, [ReasonId] ASC),
    CONSTRAINT [FK_ProcessReason_Reasons] FOREIGN KEY ([ReasonId]) REFERENCES [dbo].[Reasons] ([Id]),
    CONSTRAINT [FK_ProcessReasons_Processes] FOREIGN KEY ([ProcessId]) REFERENCES [dbo].[Processes] ([Id])
);

