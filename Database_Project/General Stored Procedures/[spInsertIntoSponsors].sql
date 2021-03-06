USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoSponsors]    Script Date: 5/16/2017 2:31:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoSponsors]
  @PersonId bigint
           ,@SponsorTypeId bigint
           ,@SponsorStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Sponsors]
           ([PersonId]
           ,[SponsorTypeId]
           ,[SponsorStatus])
     VALUES
           ( @PersonId 
           ,@SponsorTypeId 
           ,@SponsorStatus )

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


