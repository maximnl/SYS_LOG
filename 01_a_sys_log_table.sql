SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- this table for data processing logs
-- [category] is free to use for filtering, very handy
-- [session_id] keeps GUID for every data processing jobs
-- [object_id] is flexibly, can be the caller SP for instance
-- [step_id] a step in a data processing job (you can use several error handing places in SP, these will be the milestones/steps
-- [log_date] we split the login timestamp in date and time for faster search/filtering reasons
-- [data] will keep anything , messages, parameters. there is [dbo].[A_FN_SYS_ErrorJson] function that you can use 
-- to store data in json format
-- [site_id] is for multisite/domains/business situations 
-- duration of the stap
-- result , state of the step

 CREATE TABLE [A_SYS_LOG](
	[category] [varchar](50) NULL,
	[session_id] [varchar](50) NULL,
	[object_id] [varchar](50) NULL,
	[step_id] [varchar](50) NULL,
	[log_date] [date] NULL,
	[log_time] [datetime2](7) NULL,
	[data] [varchar](4000) NULL,
	[site_id] [int] NULL,
	 duration real NULL ,
	 result varchar(20)
) ON [PRIMARY]
GO
