CREATE TABLE [dbo].[ClientTeams] (
    [Client_Id] INT NOT NULL,
    [Team_Id]   INT NOT NULL,
    CONSTRAINT [PK_dbo.ClientTeams] PRIMARY KEY CLUSTERED ([Client_Id] ASC, [Team_Id] ASC),
    CONSTRAINT [FK_dbo.ClientTeams_dbo.Clients_Client_Id] FOREIGN KEY ([Client_Id]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.ClientTeams_dbo.Teams_Team_Id] FOREIGN KEY ([Team_Id]) REFERENCES [dbo].[Teams] ([Id]) ON DELETE CASCADE
);

