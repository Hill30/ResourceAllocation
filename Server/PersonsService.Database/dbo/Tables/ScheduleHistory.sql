CREATE TABLE [dbo].[ScheduleHistory]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ScheduleId] INT NOT NULL, 
    [Source] VARCHAR(2) NOT NULL,
	[ExtId] VARCHAR(50) NOT NULL, 
    [ClientId] INT NOT NULL, 
    [EmployeeId] INT NOT NULL, 
    [ServiceCode] VARCHAR(10) NOT NULL, 
    [StartDate] DATE NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndTime] TIME NULL, 
	[Disposition] CHAR(1) NOT NULL,
    [CreatedAt] DATE NOT NULL DEFAULT getdate(), 
	CONSTRAINT [FK_dbo.ScheduleHistory_dbo.ScheduleCarePlanTasks_ScheduleId] FOREIGN KEY ([ScheduleId]) REFERENCES [dbo].[Schedules] ([Id]),
)
