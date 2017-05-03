USE [master]
GO
CREATE LOGIN [Assignment4_Experiment_B] WITH PASSWORD='Assignment4_Experiment_B', DEFAULT_DATABASE=[Assignment4_Experiment_B], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO




USE [Assignment4_Experiment_B]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 11/22/2016 3:05:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



USE [Assignment4_Experiment_B]
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


USE [Assignment4_Experiment_B]
GO

/****** Object:  Table [dbo].[User]    Script Date: 11/22/2016 3:13:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [Assignment4_Experiment_B]
GO

/****** Object:  Table [dbo].[Recipe]    Script Date: 11/22/2016 3:16:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Recipe](
	[RecipeId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CuisineId] [int] NOT NULL,
	[CookingTime] [int] NULL,
	[Portions] [int] NULL,
	[Privacy] [bit] NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO

ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_Category]
GO

ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_Cuisine] FOREIGN KEY([CuisineId])
REFERENCES [dbo].[Cuisine] ([CuisineId])
GO

ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_Cuisine]
GO


USE [Assignment4_Experiment_B]
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


USE [Assignment4_Experiment_B]
GO

INSERT INTO Category
VALUES ('')
GO

INSERT INTO Category
VALUES ('Sweets')
GO

INSERT INTO Category
VALUES ('')
GO

INSERT INTO Category
VALUES ('Lunch')
GO

INSERT INTO Category
VALUES ('Breakfast')
GO

USE [Assignment4_Experiment_B]

INSERT INTO Cuisine
VALUES ('')
GO

INSERT INTO Cuisine
VALUES ('Canada')
GO

INSERT INTO Cuisine
VALUES ('Ukraine')
GO

INSERT INTO Cuisine
VALUES ('Japan')
GO

INSERT INTO Cuisine
VALUES ('Vietnam')
GO


USE [Assignment4_Experiment_B]
GO

INSERT INTO [dbo].[User]
           ([UserName])
     VALUES
           ('')
GO

INSERT INTO [dbo].[User]
           ([UserName])
     VALUES
           ('Kate')
GO

INSERT INTO [dbo].[User]
           ([UserName])
     VALUES
           ('Bren')
GO

USE [Assignment4_Experiment_B]
GO

INSERT INTO [dbo].[Recipe]
           ([RecipeName]
           ,[CategoryId]
           ,[CuisineId]
           ,[CookingTime]
           ,[Portions]
           ,[Privacy]
           ,[Description])
     VALUES
           ('Ramen'
           ,2
           ,3
           ,30
           ,2
           ,0
           ,'This is a description for Ramen...')
GO

USE [Assignment4_Experiment_B]
GO

INSERT INTO [dbo].[UserRecipe]
           ([UserId]
           ,[RecipeId])
     VALUES
           (2
           ,1)
GO


USE [Assignment4_Experiment_B]
GO

/****** Object:  StoredProcedure [dbo].[MySelect]    Script Date: 11/22/2016 4:19:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MySelect]
(
	@RecipeShit int
)
AS
SELECT *
	FROM Recipe
GO

USE [Assignment4_Experiment_B]
GO

/****** Object:  StoredProcedure [dbo].[MySearchProcedure]    Script Date: 11/22/2016 4:21:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MySearchProcedure]
(
	@RecipeName nvarchar(50),
	@CategoryName nvarchar(50),
	@CuisineName nvarchar(50),
	@CookingTime nvarchar(50),
	@Portions nvarchar(50),
	@Privacy nvarchar(50),
	@Description nvarchar(500)
)
AS
SELECT RecipeName, CategoryName, CuisineName, CookingTime, Portions, Privacy, Description  
	FROM Recipe  
	INNER JOIN Category ON Recipe.CategoryId = Category.CategoryId  
	INNER JOIN Cuisine ON Recipe.CuisineId = Cuisine.CuisineId  
		WHERE RecipeName LIKE @RecipeName  
		AND CategoryName LIKE @CategoryName  
		AND CuisineName LIKE @CuisineName  
		AND CookingTime LIKE @CookingTime  
		AND Portions LIKE @Portions  
		AND Privacy LIKE @Privacy  
		AND Description LIKE @Description 
GO

USE [Assignment4_Experiment_B]
GO

/****** Object:  StoredProcedure [dbo].[MyAddProcedure]    Script Date: 11/22/2016 4:22:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MyAddProcedure]
(
	@RecipeName nvarchar(50),
	@CategoryId int,
	@CuisineId int,
	@CookingTime int,
	@Portions int,
	@Privacy bit,
	@Description nvarchar(500)
)
AS
INSERT INTO Recipe
VALUES
(
	@RecipeName,
	@CategoryId,
	@CuisineId,
	@CookingTime,
	@Portions,
	@Privacy,
	@Description
)
GO






