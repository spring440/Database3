USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[spSelectSpeakerPresentation]    Script Date: 5/16/2017 1:56:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--This Procedure selects a speaker and returns their presentations
--enter the name in this format: selectSpeakerPresentations 'Paul Rizza'
alter PROC [dboEvent].[spSelectSpeakerPresentation]
  @speakerFirstName VARCHAR(80),
  @speakerLastName varchar(80)
  AS
  BEGIN TRY

		  select v.firstname,v.lastname,v.classtitle from dboEvent.presentationtrackingview v where UPPER(firstname)=UPPER(@speakerFirstName) and UPPER(lastname)=UPPER(@speakerLastName)
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


