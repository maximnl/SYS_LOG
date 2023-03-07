SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- this table for data processing logs
-- [category] is free to use for filtering, very handy
-- [session_id] keeps GUID for every data processing jobs
-- [object]
-- [object_sub]
-- [object_id] numeric id of the object
-- [step] a step in a data processing job (you can use several error handing places in SP, these will be the milestones/steps
-- [log_date] we split the login timestamp in date and time for faster search/filtering reasons
-- [data] will keep anything , messages, parameters. there is [dbo].[A_FN_SYS_ErrorJson] function that you can use 
-- to store data in json format
-- [site] is for multisite/domains/business situations 
-- [duration] duration of the stap
-- result , state of the step
-- [value] any numeric value to be logged 

/****** Object:  Table [dbo].[A_SYS_LOG]    Script Date: 7-3-2023 10:59:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[A_SYS_LOG](
	[log_date] [date] NULL,
	[log_time] [datetime2](7) NULL,
	[category] [varchar](50) NULL,
	[object] [varchar](70) NULL,
	[object_sub] [varchar](70) NULL,
	[object_id] [bigint] NULL,
	[step] [varchar](70) NULL,
	[data] [varchar](2000) NULL,
	[duration] [real] NULL,
	[result] [varchar](20) NULL,
	[value] [real] NULL,
	[site] [varchar](20) NULL,
	[session] [varchar](50) NULL,
	[server] [varchar](20) NULL
) ON [PRIMARY]
GO

CREATE CLUSTERED COLUMNSTORE INDEX [idx_A_SYS_LOG_CI] ON  dbo.A_SYS_LOG
