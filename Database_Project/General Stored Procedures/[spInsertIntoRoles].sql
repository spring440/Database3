USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoRoles]    Script Date: 5/16/2017 2:31:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoRoles]
  @RoleName varchar(50)
           ,@RoleDiscription varchar(max)
           ,@RoleStatus tinyint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Roles]
           ([RoleName]
           ,[RoleDiscription]
           ,[RoleStatus])
     VALUES
           (  @RoleName 
           ,@RoleDiscription 
           ,@RoleStatus )

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


