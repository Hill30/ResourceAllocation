--
-- Object:      sp_RemoteObjectExists
--
-- Description: Returns True if the specified object exists on the specified server in the specified database.  Else False.
--
-- Author:      Michael Chaffee, 02/16/2015
--
-- History:     
--
-- Note:		This proc is pretty slow.  It's intended to be used for non-user-facing datasync operations.
--
-- Copyright 2014, Addus HealthCare.
--
create procedure sp_RemoteObjectExists @LinkedServerName nvarchar(max), @RemoteDbName nvarchar(max), @ObjectName nvarchar(max),
	@ObjectExists bit = 0 OUTPUT
as
exec sp_RemoteDbExists @LinkedServerName, @RemoteDbName, @ObjectExists OUTPUT
if @ObjectExists = 0
  goto the_end

declare @SQL nvarchar(max)
SET @SQL = 'SELECT @ObjectExists = CASE WHEN ObjectExists = 0 THEN 0 ELSE 1 END
            FROM OPENQUERY(' + QUOTENAME(@LinkedServerName) 
            + ', ''SELECT ObjectExists = COUNT(*) 
                    FROM '+QUOTENAME(@RemoteDbName)+'.sys.objects
                    WHERE name = '''''+@ObjectName+''''''');';

execute sp_executesql @SQL, N'@ObjectExists bit OUTPUT', @ObjectExists OUT;

the_end:
-- the end	