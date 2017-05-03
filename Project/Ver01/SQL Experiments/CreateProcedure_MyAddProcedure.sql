USE [Assignment4_Experiment]
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


