CREATE TABLE [dbo].[SYSTEM_FUNCS](
	[FUNC_ID] [numeric](3, 0) IDENTITY NOT NULL,
	[FUNC_KEY] [nvarchar](50) NOT NULL,
	[FUNC_DESC] [nvarchar](255) NULL,
	[CREATE_BY] [nvarchar](50) NULL,
	[CREATE_DATE] [datetime2](7) NULL,
	[LASTUPD_BY] [nvarchar](50) NULL,
	[LASTUPD_DATE] [datetime2](7) NULL,
	[ROWVERSION] [int] NULL,
 CONSTRAINT [PK_SYSTEM_FUNCS] PRIMARY KEY CLUSTERED 
(
	[FUNC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[ROLES](
	[ROLE_ID] [numeric](3, 0) IDENTITY NOT NULL,
	[ROLE_CODE] [nvarchar](30) NOT NULL,
	[ENG_DESC] [nvarchar](100) NULL,
	[CHI_DESC] [nvarchar](100) NULL,
	[CREATE_BY] [nvarchar](50) NULL,
	[CREATE_DATE] [datetime2](7) NULL,
	[LASTUPD_BY] [nvarchar](50) NULL,
	[LASTUPD_DATE] [datetime2](7) NULL,
	[ROWVERSION] [int] NULL,
 CONSTRAINT [PK_ROLES] PRIMARY KEY CLUSTERED 
(
	[ROLE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[USERS](
	[USER_ID] [nvarchar](10)   NOT NULL,
	[USER_NAME] [nvarchar](30) NOT NULL,
	[CHI_NAME] [nvarchar](10) NULL,
	[USER_PASSWORD] [nvarchar](50) NULL,
	[USER_STATUS] [int](10) NULL,
	[USER_PASSWORD_TIME] [datetime2](7) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[CREATE_BY] [nvarchar](50) NULL,
	[CREATE_DATE] [datetime2](7) NULL,
	[LASTUPD_BY] [nvarchar](50) NULL,
	[LASTUPD_DATE] [datetime2](7) NULL,
	[ROWVERSION] [int] NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[USER_ROLES](
	[USER_ID] [nvarchar](10)   NOT NULL,
	[ROLE_ID] [numeric](3, 0) NOT NULL,
	[CREATE_BY] [nvarchar](50) NULL,
	[CREATE_DATE] [datetime2](7) NULL,
	[LASTUPD_BY] [nvarchar](50) NULL,
	[LASTUPD_DATE] [datetime2](7) NULL,
	[ROWVERSION] [int] NULL,
CONSTRAINT [PK_USER_ROLE] PRIMARY KEY CLUSTERED 
(
	[USER_ID] ASC,
	[ROLE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[FUNC_ENTITLES](
	[FUNC_ID] [numeric](3, 0) NOT NULL,
	[ROLE_ID] [numeric](3, 0) NOT NULL,
	[CREATE_BY] [nvarchar](50) NULL,
	[CREATE_DATE] [datetime2](7) NULL,
	[LASTUPD_BY] [nvarchar](50) NULL,
	[LASTUPD_DATE] [datetime2](7) NULL,
	[ROWVERSION] [int] NULL,
CONSTRAINT [PK_FUNC_ENTITLE] PRIMARY KEY CLUSTERED 
(
	[FUNC_ID] ASC,
	[ROLE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[USER_ROLES]  WITH CHECK ADD  CONSTRAINT [UR_USER_FK] FOREIGN KEY([USER_ID]) REFERENCES [dbo].[USERS] ([USER_ID])
GO
ALTER TABLE [dbo].[USER_ROLES]  WITH CHECK ADD  CONSTRAINT [UR_ROLE_FK] FOREIGN KEY([ROLE_ID]) REFERENCES [dbo].[ROLES] ([ROLE_ID])
GO
ALTER TABLE [dbo].[FUNC_ENTITLES]  WITH CHECK ADD  CONSTRAINT [FE_ROLE_FK] FOREIGN KEY([ROLE_ID]) REFERENCES [dbo].[ROLES] ([ROLE_ID])
GO
ALTER TABLE [dbo].[FUNC_ENTITLES]  WITH CHECK ADD  CONSTRAINT [FE_FUNCTION_FK] FOREIGN KEY([FUNC_ID]) REFERENCES [dbo].[SYSTEM_FUNCS] ([FUNC_ID])
GO

