--Question1
 
 SELECT sportCode, COUNT(EventID)
 FROM event
 GROUP BY sportCode;
 
 
 
--Question2
 
	
SELECT event.sportCode,COUNT(event.EventID), sport.sportName
FROM event
INNER JOIN sport
ON event.sportCode=sport.sportCode
group by event.sportCode, sport.sportName;


--Question3

SELECT compName,compID, AVG(Position)
as "Average finishing position"
FROM eventenrollment
join Competitor using (compID)
Group By compID;


--Question4


SELECT compName,compID, AVG(Position)
as "Average finishing position"
FROM eventenrollment
join Competitor using (compID)
Group By compID;


--Question5



SELECT compName,compID, AVG(Position)
as "Average finishing position"
FROM eventenrollment
WHERE CompName LIKE 'i%';
join Competitor using (compID)
Group By compID;




--Question6

SELECT compName,compID, AVG(Position)
as "Average finishing position"
FROM eventenrollment
WHERE (Average finishing position > 2)  --OR  (AVG(Position) > 2
join Competitor using (compID)
Group By compID;






--Question7


SELECT sportCode, AVG(prizeFund)
 FROM event
 GROUP BY sportCode;
 
 
 
 --Question8
SELECT sportCode, AVG( NVL (prizeFund,0)
 FROM event
 GROUP BY sportCode;



--Question9


SELECT sportCode,TO_CHAR ( AVG(prizeFund) , '$99,999.00')
 FROM event
 GROUP BY sportCode;
 
 --Question10


SELECT sportCode,TO_CHAR ( AVG(prizeFund) , '$99,999.00'),to_char(eventDate,’D’)
 FROM event
 Where to_char(eventDate,’D’) = 3 || 7
 Where sportCode = 2
 GROUP BY sportCode;
 
 
 
 
 --Question 11  NVL (prizeFund,0)
-- look up



1. Grouping



*1. Write the SQL to output the number of events in each sport. Include the sportcode in the output.
What table has information about events and a sportcode column?
Use COUNT as the function. Think about what is being counted (events so what column is unique for each event?). Think about what forms the groups – you want to get the number of events in each sport so which column do you use in the group by clause?
You should have 3 rows in your output.

2. Change the SQL for 2 to include the sportname in the output
How would be get the sportname – think about what table sportname is in?
What has to change in the group by clause? Think about an error we talked about in class?

3. Write the SQL to output the average finishing position for each competitor. Include the competitor ID in the output.
What is the function? What table has information about finishing position and a competitorID column?
Think about what forms the groups?
You should have 11 rows in your output.

4. Change the SQL for 3 to include the competitor name in the output.
Think about what table competitor name is in.
What has to change in the group by clause?

5. Change the SQL for 4 so that it will only include competitors with a lowercase letter i in their name.
How to restrict what goes into a group by? What clause do you need? You need to use a function.
You should get 9 rows in your output

6. Change the SQL for 5 to only show the output for competitors with an average finishing position higher than 2.
What additional clause is needed?
You should have 4 rows in your output

7. Write the SQL to find the average prizefund for each sport.
Could you amend the SQL you wrote for 1?

8. Change the SQL you wrote for 7 so that instead of null values for average prizefund, 0 is output.
What function could you use to handle nulls?

9. Change the SQL you wrote for 8 so that the average prize fund is output preceded by the euro symbol and as a 6 digits with 2 decimal places.
Use the to_char function, U is the local currency symbol.

10. Write the SQL to output the average prizefund for events that happened on a Wednesday or on a Sunday.
How would you figure out the day of the week a date happened on? To_char(datex,’D’)
Monday is considered day 1.

11. Change the SQL you wrote for 10 so that it will only include events for sportcode 2.
Remember the rules of precedence.

12. Change the SQL you wrote for 11 so that it will only output averages that have no value.
How do you check if a value is null?








