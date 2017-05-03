--CREATE OR REPLACE PROCEDURE MySearchProcdure_NEW
--@RecipeName nvarchar(50),
--	@CategoryName nvarchar(50),
--	@CuisineName nvarchar(50),
--	@CookingTime nvarchar(50),
--	@Portions nvarchar(50),
--	@Privacy nvarchar(50),
--	@Description nvarchar(500)

	use Assignment4
	GO

	Select RecipeName, CookingTime, Portions, Description, UserName, Privacy
	From [Assignment4].[dbo].[User] 
	inner Join UserRecipe on UserRecipe.UserId = [Assignment4].[dbo].[User].UserId 
	inner Join Recipe on Recipe.RecipeId=UserRecipe.RecipeId
	where Privacy = 0
	 Union
	 Select RecipeName, CookingTime, Portions, Description, UserName, Privacy
	From [Assignment4].[dbo].[User] 
	inner Join UserRecipe on UserRecipe.UserId = [Assignment4].[dbo].[User].UserId 
	inner Join Recipe on Recipe.RecipeId=UserRecipe.RecipeId
	where privacy = 1 and UserName=@UserName
	Go