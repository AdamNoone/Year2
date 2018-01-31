-- Week 10 Solutions
-- This uses a set of tables for the olympics but slightly different to previous weeks
-- Major change is that event does not have a prizefund column - you are going to add it
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
Constraint evente_event_fk FOREIGN KEY (eventID) REFERENCES Event (eventID),
Constraint evente_comp_fk FOREIGN KEY (compID) REFERENCES Competitor (compID));

insert into sport (sportCode, sportName) values(1, 'Athletics');
insert into sport (sportCode, sportName) values (2, 'Cycling');
insert into sport (sportCode, sportName)  values (3, 'Aquatics');
insert into sport (sportCode, sportName) values (4, 'Wrestling');

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
insert into competitor (compId, compName, compDOB) values (4, 'JB Green', '01 MAY 1990');

insert into EventResult (eventID, compID, position) values (2, 1, 5);
insert into EventResult (eventID, compID, position) VALUES (4, 1, 3);
insert into EventResult (eventID, compID, position) VALUES (7, 1, 7);
insert into EventResult (eventID, compID, position) VALUES (5, 2, 1);
insert into EventResult (eventID, compID, position) VALUES (6, 2, 2);
insert into EventResult (eventID, compID, position) VALUES (12, 3, 8);
insert into EventResult (eventID, compID, position) VALUES (14, 3, 1);
insert into EventResult (eventID, compID, position)  values (5,3,8);
commit;
/* This script will create a set of tables to model a small game rental shop */

-- Drop all the tables
-- Tables need to be dropped in a particular order to respect foreign key constraints.
DROP TABLE MM_Game_Type CASCADE CONSTRAINTS PURGE;
DROP TABLE MM_Customer CASCADE CONSTRAINTS PURGE;
DROP TABLE MM_Game CASCADE CONSTRAINTS PURGE;
DROP TABLE MM_Rental CASCADE CONSTRAINTS PURGE;


/* MM_Game_Type table  will store game categories each type has a code (game_type_id) and a description
- means you reduce the amount of data stored within the MM_Game table
Primary key is game_type_id  */
CREATE TABLE MM_Game_Type
     (game_type_id   NUMBER(2),
      game_type_description VARCHAR(20) NOT NULL,
      CONSTRAINT game_type_id_pk PRIMARY KEY (game_type_id));
	  
/* MM_Customer table will be used to store details about customers of the rental shop
*/
CREATE TABLE MM_Customer
   (customer_id  NUMBER(5),
   lastname     VARCHAR(20) NOT NULL,
   firstname    VARCHAR(20) NOT NULL,
   email		varchar(50)  NOT NULL,
   credit_card  VARCHAR(12)  NOT NULL,
   on_mailing_list CHAR(1) DEFAULT 'Y',
   CONSTRAINT customer_custid_pk PRIMARY KEY (customer_id),
   CONSTRAINT on_mailing_list_chk CHECK (on_mailing_list IN ('Y', 'N')),
   CONSTRAINT email_chk CHECK (email like '%@%')
   );
   
/* MM_Customer table will be used to store details about customers of the rental shop
*/   
CREATE TABLE MM_Game
     (game_id     NUMBER(5),
      game_title  VARCHAR(40) NOT NULL,
      game_type_id   NUMBER(2),
      game_price  NUMBER(5,2) NOT NULL,
      game_qty NUMBER(2) NOT NULL,
      CONSTRAINT games_id_pk PRIMARY KEY (game_id),
      CONSTRAINT game_type_fk FOREIGN KEY (game_type_id)
            REFERENCES MM_Game_Type(game_type_id),
	  CONSTRAINT price_chk CHECK (game_price > 8),
	  CONSTRAINT qty_chk CHECK(game_qty between 1 and 20)
				
);

-- MM_Rental table stores details of all transactions of the shop - rental of games  			
CREATE TABLE MM_Rental
      (rental_id NUMBER(5),
       customer_id   NUMBER(4),
       game_id      NUMBER(4),
       checkout_date DATE DEFAULT SYSDATE,
       return_date  DATE,
       CONSTRAINT rentals_pk PRIMARY KEY (rental_id),
       CONSTRAINT customer_id_fk FOREIGN KEY (customer_id)
            REFERENCES MM_Customer(customer_id),
       CONSTRAINT game_id_fk FOREIGN KEY (game_id)
            REFERENCES MM_Game(game_id));
			

-- insert data into the customer table
INSERT INTO MM_Customer (customer_id, lastname, firstname, email,  credit_card, on_mailing_list)
   VALUES (10, 'Robinson', 'Mary', 'mrobin@aras.ie', '111111111','N');
-- for this next insert the default value for on_mailing_list should be used as it is not provided
INSERT INTO MM_Customer (customer_id, lastname, firstname, email, credit_card)
   VALUES (11, 'McAleese', 'Mary', 'mmcal@aras.ie', '222222222');
INSERT INTO MM_Customer (customer_id, lastname, firstname,  email, credit_card, on_mailing_list)
   VALUES (12, 'Higgins', 'Michael D.','mickd@aras.ie', '333333333',  'Y');
INSERT INTO MM_Customer (customer_id, lastname, firstname,  email, credit_card, on_mailing_list)
   VALUES (13, 'Hillery', 'Patrick', 'phill@aras.ie', '444444444', 'N');
INSERT INTO MM_Customer (customer_id, lastname, firstname,  email, credit_card, on_mailing_list)
   VALUES (14, 'Childers', 'Erskine', 'erskchil@aras.ie', '555555555',  'Y');
   
 -- insert data into the game type table  
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '1', 'Adventure');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '2', 'Combat');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '3', 'Simulation');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '4', 'Action');
INSERT INTO MM_Game_Type (game_type_id, game_type_description)
  VALUES ( '5', 'Sports');
  
-- insert data into the game table (game type table needs to have data in it before we can do this : Foreign Key)
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (1, 'Discworld Noir', '1', 10.00, 5);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (2, 'Soma', '1', 9.00, 3);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (3, 'Indiana Jones and  the Fate of Atlantis', '1', 15.00, 11);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (4,'Bayonetta', '2', 9.00, 2);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (5, 'Doom', '2', 9.00,1);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (6, 'Flight Simulator X', '3', 9.00,2);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (7, 'F1 2015', '3', 9.00,1);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (8, 'Titan Fall 2', '4', 9.00,1);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (9, 'Battlefield I', '4', 9.00,3);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (10, 'For Honour', '4', 12.00,4);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (11, 'FIFA 2017', '5', 14.00,3);
INSERT INTO MM_Game (game_id, game_title, game_type_id, game_price, game_qty)
  VALUES (12, 'WWE 2k16', '5', 15.00,5);

-- insert data into the rental table (game  and customer tables need to have data in it before we can do this : Foreign Key) 
-- Using a partial insert so the checkout date will be today
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (1,'10', '11');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (2,'10', '8');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (3,'12', '6');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (4,'13', '3');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (5,'13', '5');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (6,'13', '11');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (7,'14', '10');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (8,'14', '7');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (9,'12', '4');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (10,'12', '12');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (11,'12', '3');
INSERT INTO MM_Rental (rental_id, customer_id, game_id)
  VALUES (12,'13', '4');
  

 
COMMIT;

Select * From Event;
Select * From Sport;
Select * From Competitor;
Select * From EventResult;
Select * From MM_Game_Type;
Select * From MM_Customer;
Select * From MM_Game;
Select * From MM_Rental;





select game_id,customer_id
from MM_Rental
right outer join MM_Customer using (customer_id)
Where game_id is null;

