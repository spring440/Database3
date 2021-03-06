USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoCities]    Script Date: 5/16/2017 2:31:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoCities]
  @cityName varchar(50),@stateId bigint,@cityStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Cities]
           ([CityName]
		   ,[StateId]
           ,[CityStatus])
     VALUES
           (@cityName,@stateId,@cityStatus)

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


