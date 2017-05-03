USE [Assignment4_Experiment]
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


