USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoPersons]    Script Date: 5/16/2017 2:31:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoPersons]
  @firstName varchar(50),@lastName varchar(50),@Gender nchar(10), @emailId as varchar(50),@contactNo as varchar(50),
  @locationId as bigint,@status as tinyint,@createdOn as datetime


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Persons]
           ([FirstName]
           ,[LastName]
           ,[Gender]
           ,[EmailId]
           ,[ContactNo]
           ,[LocationId]
           ,[PersonStatus]
           ,[RecordCreatedOn])
     VALUES
           ( @firstName ,@lastName,@Gender , @emailId ,@contactNo ,
  @locationId ,@status ,@createdOn)

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


