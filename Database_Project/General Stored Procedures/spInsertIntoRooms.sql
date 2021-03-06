USE [s17guest123]
GO
/****** Object:  StoredProcedure [dboEvent].[spInsertIntoRooms]    Script Date: 5/16/2017 2:31:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dboEvent].[spInsertIntoRooms]
  @RoomTitle varchar(50)
           ,@Capacity bigint
           ,@RoomStatus  bigint


AS
BEGIN
  BEGIN TRY

INSERT INTO [dboEvent].[Rooms]
           ([RoomTitle]
           ,[Capacity]
           ,[RoomStatus])
     VALUES
           (@RoomTitle 
           ,@Capacity 
           ,@RoomStatus  )

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


