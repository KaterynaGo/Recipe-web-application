USE [Assignment4_Experiment]
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


