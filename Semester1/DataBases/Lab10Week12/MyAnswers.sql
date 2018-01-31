--Question1


Select compname 
From EventResult 
join competitor using (compID)
Where position between 1 an 3

UNION

Select compname 
From EventResult 
join competitor using (compID)
Where position between 4 an 6;


--Question2

Select compname 
From EventResult 
join competitor using (compID)
Where position between 1 an 3

INTERSECT

Select compname 
From EventResult 
join competitor using (compID)
Where position between 4 an 6;


--Qustion3

Select compname 
From EventResult 
join competitor using (compID)
Where position between 1 an 3

MINUS

Select compname 
From EventResult 
join competitor using (compID)
Where position between 4 an 6;

--or 

Select DISTINCT compname --distint means you will only see each name once
From EventResult 
join competitor using (compID)
Where compID in (select compID in EventResult where position between 1 and 3)
AND compID in (select compID in EventResult where position between 4 and 6)






--Question4

Select compname 
From EventResult 
join competitor using (compID)
Where position between 1 an 6
