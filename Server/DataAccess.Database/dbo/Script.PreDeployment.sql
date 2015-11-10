/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
IF OBJECT_ID('dbo.ProcessSteps', 'U') IS NOT NULL
	DELETE FROM [dbo].[ProcessSteps]

IF OBJECT_ID('dbo.ProcessReasons', 'U') IS NOT NULL
	DELETE FROM [dbo].[ProcessReasons]

IF OBJECT_ID('dbo.Reasons', 'U') IS NOT NULL
DELETE FROM [dbo].[Reasons]

IF OBJECT_ID('dbo.Steps', 'U') IS NOT NULL
	DELETE FROM [dbo].[Steps]

IF OBJECT_ID('dbo.Processes', 'U') IS NOT NULL
	DELETE FROM [dbo].[Processes]
