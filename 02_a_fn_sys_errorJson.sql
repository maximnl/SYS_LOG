SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [A_FN_SYS_ErrorJson]
( 
)
RETURNS nvarchar(2000)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @data nvarchar(2000)

set  @data='{}'
set  @data=JSON_MODIFY( @data,'$.Severity',CONVERT(varchar(5), ERROR_SEVERITY()))
set  @data=JSON_MODIFY( @data,'$.State',CONVERT(varchar(5), ERROR_STATE()))
set  @data=JSON_MODIFY( @data,'$.Procedure',ISNULL(ERROR_PROCEDURE(), '-'))
set  @data=JSON_MODIFY( @data,'$.Line',CONVERT(varchar(5), ERROR_LINE()))
set  @data=JSON_MODIFY( @data,'$.Message',ERROR_MESSAGE())

    RETURN @data
END
