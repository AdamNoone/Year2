--Question 1

Select sportname,eventname
From sport 
Left outer join event using (sportcode);



--Qustion 2

Select sportname,nvl(eventname,'no events found')
From sport 
Left outer join event using (sportcode);






--Question3

Select sportname,count(eventname)
From sport 
Left outer join event using (sportcode)
Group By sportName;



--Question4
Select sportname,count(eventname)
From sport 
Left outer join event using (sportcode)
Group By sportName
Having count (eventName = 0)


--Question 5 (need to fix)



Select eventname
From event 
left outer join eventresult using eventID 
Group by eventname 



--6

select compname,count(eventid)
from competitor
left outer join evntresult using compID 
group By compname

--7 (need to fix)

select compname, eventname
from competitor
left outer join {select eventname,compID,eventrResult
                  inner join event using eventID}
group By evntres on eventre.compid = competitor.copmid








--8

create view currentStandings as 
select compname as compName,count(eventid) as NumEvents
from competitor
left outer join eventresult using (compID )
group By compname;



select * from currentStandings;



--9



select game_id,customer_id 
from MM_game 
Left outer join MM_Rental using (game_id);







--10


select game_id,count(customer_id )
from MM_game 
Left outer join MM_Rental using (game_id)
Group by game_id;




--11


create view  GameStandings as
select game_title as name,count(customer_id ) as NumRentals
from MM_game 
Left outer join MM_Rental using (game_id)
Group by game_title


--12 
select game_title as name,count(customer_id ) as NumRentals
from MM_game 
Left outer join MM_Rental using (game_id)
Group by game_title
having count(customer_id ) = 0;


--13


select game_id,customer_id
from MM_Rental
right outer join MM_Customer using (customer_id)
Where game_id is null;




