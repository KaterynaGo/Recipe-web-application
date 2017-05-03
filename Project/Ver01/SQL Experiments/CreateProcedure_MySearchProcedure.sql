USE [Assignment4_Experiment]
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


