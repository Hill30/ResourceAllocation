CREATE TABLE [dbo].[EmployeeNotes]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Employee_Id] INT NOT NULL,
	[Author] VARCHAR(100) NOT NULL,
	[Text] TEXT,
	[CreatedAt] DATE NOT NULL DEFAULT getdate(),
	CONSTRAINT [FK_dbo.EmployeeNotes_dbo.Employees_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employees] ([Id]) ON DELETE CASCADE,
)
