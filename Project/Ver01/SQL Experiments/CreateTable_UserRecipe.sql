USE [Assignment4_Experiment]
GO

/****** Object:  Table [dbo].[UserRecipe]    Script Date: 11/22/2016 3:17:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserRecipe](
	[UserId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
 CONSTRAINT [PK_UserRecipe] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserRecipe]  WITH CHECK ADD  CONSTRAINT [FK_UserRecipe_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO

ALTER TABLE [dbo].[UserRecipe] CHECK CONSTRAINT [FK_UserRecipe_Recipe]
GO

ALTER TABLE [dbo].[UserRecipe]  WITH CHECK ADD  CONSTRAINT [FK_UserRecipe_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO

ALTER TABLE [dbo].[UserRecipe] CHECK CONSTRAINT [FK_UserRecipe_User]
GO


