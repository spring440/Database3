USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoTracks]    Script Date: 5/16/2017 2:31:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoTracks]
 @TrackTitle varchar(50)
           ,@ClassId bigint
           ,@TrackStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Tracks]
           ([TrackTitle]
           ,[ClassId]
           ,[TrackStatus])
     VALUES
           ( @TrackTitle 
           ,@ClassId 
           ,@TrackStatus )

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


