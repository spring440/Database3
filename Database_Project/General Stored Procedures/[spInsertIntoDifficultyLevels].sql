USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoDifficultyLevels]    Script Date: 5/16/2017 2:31:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoDifficultyLevels]
  @difficultyLevelTitle varchar(50),@difficultyLevelStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[ClassDifficultyLevel]
           ([DifficultyLevelTitle]
           ,[DifficultyLevelStatus])
     VALUES
           (@difficultyLevelTitle,@difficultyLevelStatus)

END TRY
   BEGIN CATCH
  DECLARE @ErrorMessage NVARCHAR(4000);
  DECLARE @ErrorSeverity INT;
  DECLARE @ErrorState INT;
  SELECT
    @ErrorMessage = ERROR_MESSAGE(),
    @ErrorSeverity = ERROR_SEVERITY(),
    @ErrorState = ERROR_STATE();

  RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END


