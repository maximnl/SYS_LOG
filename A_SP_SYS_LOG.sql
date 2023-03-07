 -- SP Procedure for inserting logs into log table
/****** Object:  StoredProcedure [dbo].[A_SP_SYS_LOG]    Script Date: 7-3-2023 10:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[A_SP_SYS_LOG]
	@category varchar(50)   = null,
	@session varchar(50)  = null,
    @object varchar(70)  = null,
    @object_sub varchar(70)  = null,
    @object_id bigint = null,
	@step varchar(50)   = null,
	@data   varchar(2000) = null,
    @site   varchar(20) = null,
    @duration real = null,
    @result varchar(20) = null,
    @value real = null,
    @logtime datetime = null,
    @server varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;
 
INSERT INTO [dbo].[A_SYS_LOG]
           ([session]
           ,[object]
           ,object_sub
           ,object_id
           ,[step]
           ,[log_date]
           ,[log_time]
           ,[category]
           ,[data]
           ,[site]
           ,duration
           ,result
           ,[value]
           ,[server])
     values( 
            @session
           ,@object
           ,@object_sub
           ,@object_id
           ,@step
           ,isnull(@logtime,getdate())
           ,isnull(@logtime,getdate())
           ,@category  
           ,@data
           ,@site
           ,@duration
           ,isnull(@result,'Succeeded')
           ,@value
           ,isnull(@server,@@SERVERNAME)
		  )
		   
END
 
