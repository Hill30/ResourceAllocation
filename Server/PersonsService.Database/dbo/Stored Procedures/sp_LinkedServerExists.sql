--
-- Object:      sp_LinkedServerExists
--
-- Description: Returns True (via OUT param) if the named linked server exists; otherwise False.
--
-- Author:      Michael Chaffee, 02/16/2015
--
-- Note:		This proc is pretty slow.  It's intended to be used for non-user-facing datasync operations.
--
-- History:     
--
-- Copyright 2014, Addus HealthCare.
--
CREATE procedure [dbo].[sp_LinkedServerExists] @LinkedServerName nvarchar(max), @LinkedServerExists bit = 0 OUTPUT
as
select @LinkedServerExists = 0

select @LinkedServerExists = 1 from sys.servers where name = @LinkedServerName