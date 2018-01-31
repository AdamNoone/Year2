-- Week 10 Solutions
-- This uses a set of tables for the olympics but slightly different to previous weeks
-- Major change is that event does not have a PRIZE column - you are going to add it
Drop table EventResult;
Drop table Competitor;
Drop table Event;
Drop table Sport;

Create table Sport (
sportCode Number(4) PRIMARY KEY,
sportName varchar2(30));

Create table Event(
eventID Number(4) PRIMARY KEY,
eventName varchar2(30),
eventDate Date,
sportCode Number(4),
Constraint event_sport_fk FOREIGN KEY (sportCode) REFERENCES Sport(sportCode));

Create table Competitor(
compID NUMBER(4) PRIMARY KEY,
compName varchar2(30),
compDOB date);

Create table EventResult(
eventID number(4),
compID  number(4),
Position number(4),
PRIMARY KEY (eventID, compID),
Constraint eventen_event_fk FOREIGN KEY (eventID) REFERENCES Event (eventID),
Constraint eventen_comp_fk FOREIGN KEY (compID) REFERENCES Competitor (compID));

insert into sport (sportCode, sportName) values(1, 'Athletics');
insert into sport (sportCode, sportName) values (2, 'Cycling');
insert into sport (sportCode, sportName)  values (3, 'Aquatics');


insert into event (eventID, eventName, eventDate, sportCode) values (1, '100m Mens Final',  '12 Jun 2012',1);
insert into event (eventID, eventName, eventDate, sportCode)values (2, '100m Womens Final',  '13 June 2012',1);
insert into event (eventID, eventName, eventDate, sportCode)values (3, '200m Mens Final',  '12 Jun 2012',1);
insert into event (eventID, eventName, eventDate, sportCode)values (4, '200m Womens Final', '13 June 2012',1);

insert into event (eventID, eventName, eventDate, sportCode)values (5, 'Kerrin Men Final', '01 Jun 2012',2);
insert into event (eventID, eventName, eventDate, sportCode)values (6, 'Omnium Men Final', '03 Jun 2012',2);
insert into event (eventID, eventName, eventDate, sportCode)values (7, 'Kerrin Women Final',  '01 Jun 2012',2);
insert into event (eventID, eventName, eventDate, sportCode)values (8, 'Omnium Women Final',  '03 Jun 2012',2);
insert into event (eventID, eventName, eventDate, sportCode)values (9, 'Individual Men Final',  '21 Jun 2012',2);
insert into event (eventID, eventName, eventDate, sportCode)values (10, 'Team Men Final', '23 Jun 2012',2);
insert into event (eventID, eventName, eventDate, sportCode)values (11, 'Individual Women Final',  '14 Jun 2012',2);
insert into event (eventID, eventName, eventDate, sportCode)values (12, 'Team Women Final', '08 Jun 2012',2);

insert into event (eventID, eventName, eventDate, sportCode)values (13, '100m Backstroke Final','09 Jun 2012',3);
insert into event (eventID, eventName, eventDate, sportCode)values (14, '50m butterfly women Final','04 Jun 2012',3 );
insert into event (eventID, eventName, eventDate, sportCode)values (15, '800m freestyle men Final','06 Jun 2012',3 );

insert into event (eventID, eventName, eventDate, sportCode)values (16, 'Synchronised Duet Women Final', '09 Jun 2012',3 );
insert into event (eventID, eventName, eventDate, sportCode)values (17, 'Synchronised Team Women Final', '10 Jun 2012',3);

insert into competitor (compId, compName, compDOB) values (1, 'J Black', '12 DEC 1990');
insert into competitor (compId, compName, compDOB) values (2, 'K White', '04 APR 1984');
insert into competitor (compId, compName, compDOB) values (3, 'B Green', '01 MAY 1992');


insert into EventResult (eventID, compID, position) values (2, 1, 5);
insert into EventResult (eventID, compID, position) VALUES (4, 1, 3);
insert into EventResult (eventID, compID, position) VALUES (7, 1, 7);
insert into EventResult (eventID, compID, position) VALUES (5, 2, 1);
insert into EventResult (eventID, compID, position) VALUES (6, 2, 2);
insert into EventResult (eventID, compID, position) VALUES (12, 3, 8);
insert into EventResult (eventID, compID, position) VALUES (14, 3, 1);
insert into EventResult (eventID, compID, position)  values (5,3,8);
commit;
--Revision
/*1.	For all sports return the name of the sport and the name of all events in that sport. 
Format your output so that it matches the table below. (Hint: use concatenate to change the output 
and an alias to change the name of the column displayed 
You will have 17 rows in your output as there are 17 events setup in this example*/

SELECT SPORTNAME || ' has an event ' || EVENTNAME  "Sport Listing"
FROM EVENT 
JOIN SPORT USING (SPORTCODE);

/*2.	Amend the previous SQL statement so that for each sport return the name of the sport and 
the number of events in that sport. (Hint: use a group function) e.g.  ATHLETICS has 4 events*/
SELECT SPORTNAME || ' has ' || count(eventid)  || ' events.'   "Sport Listing"
FROM EVENT 
JOIN SPORT USING (SPORTCODE)
GROUP BY SPORTNAME;

--3. For each COMPETITOR output their max, min and averge position achieved
SELECT COMPNAME,
  MAX(position),
  MIN(position),
  ROUND(AVG(position),2)
FROM EVENTResult
JOIN COMPETITOR USING (COMPID)
GROUP BY COMPNAME;

--New material
--4.	Add a column PRIZE to the event table which can accept values up to 99999.99.
-- Use an alter table statement, add 
ALTER TABLE EVENT ADD PRIZE NUMBER(7,2);

--5.	Set the value of the PRIZE column to be SPORTCODE * 1000.
-- Use an update statement
UPDATE EVENT 
SET PRIZE=SPORTCODE *1000 ;

--6.	Modify this column so that it is not null.
-- use an alter table statement, modify
ALTER TABLE EVENT MODIFY PRIZE NOT NULL;

--7.	Add a constraint to the table so that it can accept values between 1000.00 and 3500.00.
-- Use an alter table, add constraint
ALTER TABLE EVENT 
ADD CONSTRAINT CHK_PRIZE CHECK (PRIZE BETWEEN 1000 AND 3500);

/*8.	Add a constraint to the EVENTResult table so that the value of position will be unique for each event
(Hint: Think about what is unique - it is not position on its own).*/
-- use alter table, add constraint
ALTER TABLE EVENTResult 
ADD CONSTRAINTS UNIQ_POS UNIQUE(EVENTID, POSITION);


/*9.	Athletics prize money is being increased by 25%. 
Write the SQL to update the prize columns of all Athletics events. Use a sub-query in your wqhere clause.*/
-- Hint: What would the SQL be to find the name of each sport? This is your sub-query
-- Remeber that sub-queries are enclosed in ()
UPDATE event
SET prize        =PRIZE*1.25
WHERE sportcode       IN
  (SELECT sportcode FROM sport WHERE upper(sportname)='ATHLETICS'
  );
  


  /*10.	Add a column to the EVENT table called PRIZE_FUND which can accept values up to 999999999.99. 
  You need to drop the constraint on event also.
Populate this column with a value 1,000,000 if the event is ATHLETICS; 900,000 if CYCLING; 500,000 otherwise 
--use an update statement
Use the sportcode in a case statement as part of the set in the update
*/
alter table event modify PRIZE number (11,2);
ALTER TABLE EVENT 
drop  CONSTRAINT CHK_PRIZE;

UPDATE EVENT 
SET PRIZE=
CASE 
WHEN SPORTCODE=1 THEN 1000000.00
WHEN SPORTCODE=2 THEN 900000.00
ELSE 5000000.00
END;

--11.	Delete all results for all CYCLING events 
--Hint: Think about this. What table references the event table?
-- So do you need to delete records from that first? 
-- How would would you structure your delete so that it uses the sportname - you need to use a subquery.
-- then you need to delete the event itselg

  DELETE FROM EVENTResult
  WHERE EVENTID in (SELECT EVENTID FROM EVENT WHERE 
  SPORTCODE IN (SELECT SPORTCODE FROM SPORT WHERE UPPER(SPORTNAME)='CYCLING')
  );
  
--12.and then delete all cycling events; 
  DELETE FROM EVENT WHERE SPORTCODE IN 
  (SELECT SPORTCODE FROM SPORT WHERE UPPER(SPORTNAME)='CYCLING');
 
  
--13.	Add a column to the EVENTResult table called PRIZE which can accept values up to 99,999.99;
ALTER TABLE EVENTResult
ADD PRIZE NUMBER(7,2);




--
--14.	Delete the column PRIZE from the event table. 
-- Use alter table, drop column
ALTER TABLE EVENT DROP COLUMN PRIZE;


