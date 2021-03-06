USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[BudapestTrackPresentations]    Script Date: 5/16/2017 1:50:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE [dboEvent].[spInsertNewPresentaion]
  @classTitle varchar(50),
  @description varchar(250),
  @DurationInMinutes bigint,
  @difficultyLevelId bigint,
  @classDateTime datetime,
  @classStatus tinyint


AS
BEGIN
  BEGIN TRY

insert into dboEvent.Classes  VALUES(@classTitle,@description,@DurationInMinutes,@difficultyLevelId,@classDateTime,@classStatus)

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


