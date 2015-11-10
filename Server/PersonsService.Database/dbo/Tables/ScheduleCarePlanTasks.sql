CREATE TABLE [dbo].[ScheduleCarePlanTasks]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ScheduleId] INT NOT NULL, 
    [TaskId] INT NOT NULL, 
    [SortOrder] INT NOT NULL,
	CONSTRAINT [FK_dbo.Schedules_dbo.ScheduleCarePlanTasks_ScheduleId] FOREIGN KEY ([ScheduleId]) REFERENCES [dbo].[Schedules] ([Id]),
	CONSTRAINT [FK_dbo.Tasks_dbo.ScheduleCarePlanTasks_TaskId] FOREIGN KEY ([TaskId]) REFERENCES [dbo].[Tasks] ([Id]),
)
