USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoRoleAssign]    Script Date: 5/16/2017 2:31:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoRoleAssign]
  @roleId bigint
           ,@personId bigint
           ,@oleAssignStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[RoleAssings]
           ([RoleId]
           ,[PersonId]
           ,[RoleAssignStatus])
     VALUES
           ( @roleId 
           ,@personId 
           ,@oleAssignStatus )

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


