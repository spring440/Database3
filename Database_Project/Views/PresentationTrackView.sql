
create view dboevent.PresentationTrackingView
as

select e.EventId,e.EventTitle,c.ClassId,c.ClassTitle,per.PersonId,per.FirstName,per.LastName,l.StreetAddress as PersonAddress,per.EmailId,r.RoleId,ra.RoleAssignId from dboEvent.PresentationSchedule p 
INNER JOIN dboEvent.Events e on e.EventId=p.EventId and e.EventStatus=1
INNER join dboEvent.PrensenterBindWithClass pc on pc.BindingId=p.PresenterBindWithClassId and pc.BindingStatus=1
INNER join dboEvent.Classes c on c.ClassId=pc.ClassId and c.ClassStatus=1
inner join dboEvent.Persons per on per.PersonId=pc.PersonId and per.PersonStatus=1
inner join dboEvent.Locations l on l.LocationId = per.LocationId 
INNER join dboEvent.RoleAssings ra on ra.PersonId=per.PersonId and ra.RoleAssignStatus=1
INNER join dboEvent.Roles r on r.RoleId=ra.RoleId and ra.RoleAssignStatus =1
where r.RoleName='Presenter'


