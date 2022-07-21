SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[A_SP_SYS_LOG]  
	@category varchar(50)   = null,
	@session_id varchar(50)  = null,
    @object_id varchar(50)  = null,
	@step_id varchar(50)   = null,
	@data   varchar(4000) = null,
    @site_id   varchar(20) = null

AS
BEGIN

SET NOCOUNT ON;
 
INSERT INTO [dbo].[A_SYS_LOG]
           ([session_id]
           ,[object_id]
           ,[step_id]
           ,[log_date]
           ,[log_time]
           ,[category]
           ,[data]
           ,site_id)
     values( 
            @session_id
           ,@object_id 
           ,@step_id 
           ,getdate()
           ,getdate()
           ,@category --[category]
           ,@data
           ,@site_id
		  )
		   
END
 
GO
