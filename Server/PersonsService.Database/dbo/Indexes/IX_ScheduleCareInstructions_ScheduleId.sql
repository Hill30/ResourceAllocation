CREATE INDEX [IX_ScheduleCarePlanTasks_ScheduleId]
	ON [dbo].[ScheduleCarePlanTasks]
	([ScheduleId])
	INCLUDE
	([TaskId], [SortOrder], [Id])
