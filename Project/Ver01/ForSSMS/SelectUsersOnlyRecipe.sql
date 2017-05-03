USE Assignment4
GO

SELECT UserName, RecipeName
	FROM aspnet_Users INNER JOIN ProjectUserRecipe ON aspnet_Users.UserId = ProjectUserRecipe.UserId
					  INNER JOIN Project_Recipe ON ProjectUserRecipe.RecipeId = Project_Recipe.RecipeId
		WHERE aspnet_Users.UserId = 'DFB236CD-010B-41E7-A183-07C62E322878'
GO