CREATE INDEX [IX_Schedules_EmployeeId]
	ON [dbo].[Schedules]
	([EmployeeId])	
	INCLUDE
	([StartDate], [ClientId], [ServiceCode], [Id])