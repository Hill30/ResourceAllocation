CREATE TABLE [dbo].[Tasks]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Description] VARCHAR(255) NOT NULL, 
    [ClinicalMeasurement] BIT NOT NULL , 
    [CelltrakId] VARCHAR(20) NOT NULL, 
    [Available] BIT NOT NULL, 
    [Observation] BIT NOT NULL
)
