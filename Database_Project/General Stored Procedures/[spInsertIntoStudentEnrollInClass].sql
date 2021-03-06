USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoStudentEnrollInClass]    Script Date: 5/16/2017 2:31:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoStudentEnrollInClass]
 @ClassId bigint
           ,@PersonId bigint
           ,@BindingStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[StudentEnrollInClass]
           ([ClassId]
           ,[PersonId]
           ,[BindingStatus])
     VALUES
           ( @ClassId 
           ,@PersonId 
           ,@BindingStatus )

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


