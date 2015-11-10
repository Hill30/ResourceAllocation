CREATE INDEX [IX_Schedules_ClientId]
	ON [dbo].[Schedules]
	([ClientId])	
	INCLUDE
	([StartDate], [EmployeeId], [Id])