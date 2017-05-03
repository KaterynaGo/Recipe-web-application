USE [Assignment4_Experiment]
GO

/****** Object:  Table [dbo].[Cuisine]    Script Date: 11/22/2016 3:09:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cuisine](
	[CuisineId] [int] IDENTITY(1,1) NOT NULL,
	[CuisineName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cuisine] PRIMARY KEY CLUSTERED 
(
	[CuisineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


