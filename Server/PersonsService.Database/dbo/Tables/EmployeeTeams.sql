CREATE TABLE [dbo].[EmployeeTeams] (
    [Employee_Id] INT NOT NULL,
    [Team_Id]     INT NOT NULL,
    CONSTRAINT [PK_dbo.EmployeeTeams] PRIMARY KEY CLUSTERED ([Employee_Id] ASC, [Team_Id] ASC),
    CONSTRAINT [FK_dbo.EmployeeTeams_dbo.Employees_Employee_Id] FOREIGN KEY ([Employee_Id]) REFERENCES [dbo].[Employees] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.EmployeeTeams_dbo.Teams_Team_Id] FOREIGN KEY ([Team_Id]) REFERENCES [dbo].[Teams] ([Id]) ON DELETE CASCADE
);

