USE Assignment4
GO

CREATE PROCEDURE MyAddProcedure2
(
	@RecipeName nvarchar(50),
	@CategoryId int,
	@CuisineId int,
	@CookingTime int,
	@Portions int,
	@Privacy bit,
	@Description nvarchar(500),
	@SubmissionDate date
)
AS
INSERT INTO Project_Recipe
VALUES
(
	@RecipeName,
	@CategoryId,
	@CuisineId,
	@CookingTime,
	@Portions,
	@Privacy,
	@Description,
	@SubmissionDate
)
GO