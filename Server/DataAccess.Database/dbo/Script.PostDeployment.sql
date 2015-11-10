/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET IDENTITY_INSERT [dbo].[Reasons] ON 
GO
INSERT [dbo].[Reasons] ([Id], [Name]) VALUES (1, N'Family Emergency')
GO
SET IDENTITY_INSERT [dbo].[Reasons] OFF
GO

-- Caller Types:
-- Any = 0,
-- Employee = 1,
-- Client = 2,
-- Operator = 3

-- Call Types: 
-- Any = 0,
-- Inbound = 1,
-- Outbound = 2
SET IDENTITY_INSERT [dbo].[Processes] ON 
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (1, N'CMN', N'Common', 0, 0, 1000)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (2, N'CLF', N'Call Off', 1, 1, 10)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (3, N'CIC', N'CIC reported', 1, 1, 20)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (4, N'CCS', N'Client changes schedule', 1, 2, 30)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (5, N'ECS', N'Employee changes Schedule', 1, 1, 40)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (6, N'ETE', N'Employee Termination', 1, 1, 50)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (7, N'HCL', N'Hospitalized client', 1, 0, 60)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (8, N'LCK', N'Lock Out', 1, 1, 70)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (9, N'LCP', N'Log Complaint', 1, 2, 80)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (10, N'NCL', N'New Client', 1, 1, 90)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (11, N'PTO', N'PTO Request', 1, 1, 100)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (12, N'RDT', N'Redetermination', 1, 2, 110)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (13, N'RFO', N'Refusal of offer', 1, 1, 120)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (14, N'RST', N'Re-Staff', 1, 2, 130)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (15, N'SVT', N'Service Termination', 1, 2, 140)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (16, N'SVI', N'Short term service interruption', 1, 2, 150)
GO
INSERT [dbo].[Processes] ([Id], [Code], [Name], [CallType], [CallerType], [SortOrder]) VALUES (17, N'TRQ', N'Training queue', 1, 1, 900)
GO
SET IDENTITY_INSERT [dbo].[Processes] OFF
GO

INSERT [dbo].[ProcessReasons] ([ProcessId], [ReasonId]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[Steps] ON 

GO
INSERT [dbo].[Steps] ([Id], [Type], [Description]) VALUES (1, N'DomainModel.ProcessSteps.Calendar', NULL)
GO
INSERT [dbo].[Steps] ([Id], [Type], [Description]) VALUES (2, N'DomainModel.ProcessSteps.Visits', NULL)
GO
INSERT [dbo].[Steps] ([Id], [Type], [Description]) VALUES (3, N'DomainModel.ProcessSteps.Notes', NULL)
GO
SET IDENTITY_INSERT [dbo].[Steps] OFF

GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (1, 1, 0, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (1, 2, 0, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (1, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (2, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (2, 2, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (2, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (3, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (3, 2, 1, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (3, 3, 0, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (4, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (4, 2, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (4, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (5, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (5, 2, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (5, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (6, 1, 1, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (6, 3, 0, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (7, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (7, 2, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (7, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (8, 1, 1, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (8, 2, 1, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (8, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (9, 1, 0, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (9, 2, 0, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (9, 3, 0, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (10, 1, 0, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (10, 3, 0, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (11, 1, 0, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (11, 3, 0, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (12, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (13, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (14, 3, 0, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (15, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (15, 2, 1, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (15, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (16, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (16, 2, 1, N'Single')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (16, 3, 1, NULL)
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (17, 1, 1, N'Range')
GO
INSERT [dbo].[ProcessSteps] ([ProcessId], [StepId], [Mandatory], [Params]) VALUES (17, 2, 0, N'Range')
GO
