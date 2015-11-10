--
-- Object:      sp_RemoteDbExists
--
-- Description: Takes a linked server name and db name, and returns True if the linked server and the db exist; False otherwise.
--
-- Author:      Michael Chaffee, 02/16/2015
--
-- History:     
--
-- Note:		This proc is pretty slow.  It's intended to be used for non-user-facing datasync operations.
--
-- Copyright 2014, Addus HealthCare.
--
create procedure [dbo].[sp_RemoteDbExists] @LinkedServerName nvarchar(max), @DbName nvarchar(max), @DbExists bit = 0 OUTPUT
as

exec sp_LinkedServerExists @LinkedServerName, @DbExists OUTPUT
if @DbExists = 0
  goto the_end

declare @Sql nvarchar(max)
SET @SQL = 'SELECT @DbExists = CASE WHEN DbExists = 0 THEN 0 ELSE 1 END
            FROM OPENQUERY(' + QUOTENAME(@LinkedServerName) 
            + ', ''SELECT DbExists = COUNT(*) 
                    FROM master.sys.databases
                    WHERE name = '''''+@DbName+''''''');';

exec sp_executeSql @SQL, N'@DbExists bit output', @DbExists OUT;

the_end:
-- the end