CREATE TABLE [dbo].[Schedules]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Source] VARCHAR(2) NOT NULL, 
    [ExtId] VARCHAR(50) NOT NULL, 
    [ClientId] INT NULL, 
    [EmployeeId] INT NULL, 
    [ServiceCode] VARCHAR(10) NOT NULL, 
    [StartDate] DATE NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndTime] TIME NOT NULL, 
    [CreatedAt] DATE NOT NULL DEFAULT getdate(), 
    [LastModified] DATE NOT NULL DEFAULT getdate(),
    CONSTRAINT [FK_dbo.Schedules_dbo.Client_Id] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([Id]),
	CONSTRAINT [FK_dbo.Schedules_dbo.Employees_Id] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employees] ([Id])
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'External Schedule ID. Corresponds to Horizon OrdSys.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Schedules',
    @level2type = N'COLUMN',
    @level2name = N'ExtId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Source System for ExtID.  HH for Horizon.',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Schedules',
    @level2type = N'COLUMN',
    @level2name = N'Source'