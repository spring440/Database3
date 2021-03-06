USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoClasses]    Script Date: 5/16/2017 10:30:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoClasses]
  @ClassTitle varchar(50)
           ,@Description varchar(max)
           ,@DurationInMinutes bigint
		   ,@DifficultyLevelId bigint
           ,@ClassDateTime datetime
           ,@ClassStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Classes]
           ([ClassTitle]
           ,[Description]
           ,[DurationInMinutes]
           ,[DifficultyLevelId]
           ,[ClassDateTime]
           ,[ClassStatus])
     VALUES
           (@ClassTitle
		   ,@Description 
           ,@DurationInMinutes 
		   ,@DifficultyLevelId 
           ,@ClassDateTime 
           ,@ClassStatus )

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


