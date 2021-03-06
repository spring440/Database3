USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoLocations]    Script Date: 5/16/2017 2:31:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoLocations]
  @zipCode bigint,@countryId bigint,@stateId bigint, @cityId as bigint,@streetAddress as varchar(50)


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Locations]
           ([ZipCode]
           ,[CountryId]
           ,[StateId]
           ,[CityId]
           ,[StreetAddress])
     VALUES
           (@zipCode
           ,@countryId
           ,@stateId
           ,@cityId
           ,@streetAddress)

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


