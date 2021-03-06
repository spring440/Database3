USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoEvents]    Script Date: 5/16/2017 2:31:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoEvents]
  @eventTitle varchar(50),@locationId bigint,@eDateTime datetime, @eStatus as tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Events]
           ([EventTitle]
           ,[Locationid]
           ,[EventDateTime]
           ,[EventStatus])
     VALUES
           (@eventTitle,@locationId,@eDateTime,@eStatus)

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


