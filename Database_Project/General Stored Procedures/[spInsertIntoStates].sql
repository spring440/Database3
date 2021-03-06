USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoStates]    Script Date: 5/16/2017 2:31:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoStates]
		   @CountryId bigint
           ,@StateName varchar(50)
           ,@StateStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[States]
           (
		   [CountryId]
           ,[StateName]
           ,[StateStatus])
     VALUES
           (
		   @CountryId 
           ,@StateName 
           ,@StateStatus )

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


