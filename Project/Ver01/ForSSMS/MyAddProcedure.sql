CREATE PROCEDURE MyAddProcedure
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