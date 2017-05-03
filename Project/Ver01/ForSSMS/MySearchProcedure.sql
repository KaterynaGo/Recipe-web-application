CREATE PROCEDURE MyPrivateSearchProcedure
(
	@UserId int,
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
	INNER JOIN UserRecipe ON User.UserId = UserRecipe.UserId  
	INNER JOIN Recipe ON UserRecipe.RecipeId = Recipe.RecipeId  
	INNER JOIN Category ON Recipe.CategoryId = Category.CategoryId  
	INNER JOIN Cuisine ON Recipe.CuisineId = Cuisine.CuisineId  
		WHERE RecipeName LIKE @RecipeName  
		AND CategoryName LIKE @CategoryName  
		AND CuisineName LIKE @CuisineName  
		AND CookingTime LIKE @CookingTime  
		AND Portions LIKE @Portions  
		AND Privacy LIKE @Privacy  
		AND Description LIKE @Description 
		AND UserId = @UserId