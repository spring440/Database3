USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoPresentationSchedule]    Script Date: 5/16/2017 2:31:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoPresentationSchedule]
  @eventId bigint,@presenterBindWithClassId bigint,
           @roomsBindWithVenueId bigint
           ,@scheduleStatus as tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[PresentationSchedule]
           ([EventId]
           ,[PresenterBindWithClassId]
           ,[RoomsBindWithVenueId]
           ,[ScheduleStatus])
     VALUES
           (@eventId ,@presenterBindWithClassId ,
           @roomsBindWithVenueId 
           ,@scheduleStatus)

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


