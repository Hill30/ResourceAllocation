CREATE TABLE [dbo].[BranchTeams] (
    [Branch_Id] INT NOT NULL,
    [Team_Id]   INT NOT NULL,
    CONSTRAINT [PK_dbo.BranchTeams] PRIMARY KEY CLUSTERED ([Branch_Id] ASC, [Team_Id] ASC),
    CONSTRAINT [FK_dbo.BranchTeams_dbo.Branches_Branch_Id] FOREIGN KEY ([Branch_Id]) REFERENCES [dbo].[Branches] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.BranchTeams_dbo.Teams_Team_Id] FOREIGN KEY ([Team_Id]) REFERENCES [dbo].[Teams] ([Id]) ON DELETE CASCADE
);

