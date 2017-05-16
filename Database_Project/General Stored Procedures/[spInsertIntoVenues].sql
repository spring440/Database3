USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoVenues]    Script Date: 5/16/2017 2:31:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoVenues]
@VenueTitle varchar(50)
           ,@LocationId bigint
           ,@VenueStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Venues]
           ([VenueTitle]
           ,[LocationId]
           ,[VenueStatus])
     VALUES
           (@VenueTitle 
           ,@LocationId 
           ,@VenueStatus )

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


