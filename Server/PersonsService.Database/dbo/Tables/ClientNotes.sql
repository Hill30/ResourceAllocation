CREATE TABLE [dbo].[ClientNotes]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[Client_Id] INT NOT NULL,
	[Author] VARCHAR(100) NOT NULL,
	[Text] TEXT,
	[CreatedAt] DATE NOT NULL DEFAULT getdate(),
	CONSTRAINT [FK_dbo.ClientNotes_dbo.Client_Id] FOREIGN KEY ([Client_Id]) REFERENCES [dbo].[Clients] ([Id]) ON DELETE CASCADE,
)
