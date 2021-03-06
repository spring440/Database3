USE [s17guest03]
GO
/****** Object:  StoredProcedure [dboEvent].[BudapestTrackPresentations]    Script Date: 5/16/2017 1:50:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROC [dboEvent].[spBudapestTrackPresentations]
		--ENTER A TRACK
		--IF NO TRACK ENTERED DEFAULT VALUE OF 4 IS USED
		-- Budapest only has track #'s 1,2,3,4,5,6
		@trackId INT = 4
	AS
	--If invalid data raise error
	BEGIN TRY
		--display track, title, city
		select e.EventId,e.EventTitle,t.TrackId,t.TrackTitle,c.ClassId,c.ClassTitle,per.PersonId,per.FirstName,per.LastName,c1.CityName from dboEvent.PresentationSchedule p 
INNER JOIN dboEvent.Events e on e.EventId=p.EventId and e.EventStatus=1
inner join dboEvent.Locations l on l.LocationId=e.Locationid 
inner join dboEvent.Cities c1 on c1.CityId=l.CityId and c1.CityStatus=1
INNER join dboEvent.PrensenterBindWithClass pc on pc.BindingId=p.PresenterBindWithClassId and pc.BindingStatus=1
inner join dboEvent.Persons per on per.PersonId=pc.PersonId and per.PersonStatus=1
INNER join dboEvent.Classes c on c.ClassId=pc.ClassId and c.ClassStatus=1
inner join dboEvent.Tracks t on t.ClassId=c.ClassId and t.TrackStatus=1
where UPPER(c1.CityName)= UPPER('Budapest') and t.TrackId=@trackId
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
