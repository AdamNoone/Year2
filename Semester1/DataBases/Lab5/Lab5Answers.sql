
--SECTION TWO SIMPLE PROJECTION AND RESTRICTION USING COMPARISON OPERATORS AND LOGICAL CONDITIONS
--Select Statement 1
--Find the price of the game called Soma
SELECT  GAME_PRICE
FROM   MM_Game
WHERE GAME_TITLE = 'Soma';

--Select Statement 2
--Find the title of all games with more than 3 in stock; include the quantity in the output
SELECT GAME_TITLE, GAME_QTY
FROM MM_Game
WHERE GAME_QTY > 3;

--Select statement 3
--Use the BETWEEN condition to display rows based on a range of values.
--Find the title of all games with quantities between 3 and 7 in stock; include the quantity in the output
SELECT GAME_TITLE, GAME_QTY
FROM   MM_Game
WHERE  GAME_QTY BETWEEN 3 and 7;

--Select statement 4
--Use the IN membership condition to test for values in a list.
--Find the quantities between in stock for the following games Soma, Doom, Bayonetta; include the title in the output
SELECT GAME_QTY,GAME_TITLE
FROM   MM_Game
WHERE  GAME_QTY IN (1,2,3,4,5,6,7,8,9);

--Select statement 5
--Use the LIKE condition to perform wildcard searches of valid search string values.
--Search conditions can contain a pattern with either literal characters or numbers:
--% denotes zero or many characters.
--_ denotes one character.--Find the titles of all games with a lower case letter o anywhere in its name
SELECT GAME_TITLE
FROM MM_Game
WHERE GAME_TITLE LIKE '_o%';

--Select statement 6
--Use the LIKE condition to perform wildcard searches of valid search string values.
--Search conditions can contain a pattern with either literal characters or numbers:
--% denotes zero or many characters.
--_ denotes one character.
--Find the titles of all games with a lower case letter o as the third letter of its name.
SELECT GAME_TITLE
FROM MM_Game
WHERE GAME_TITLE LIKE 'o%'; ---need to fix this one 


--Select statement 7
--Test for nulls with the IS NULL operator.
--Find details of all rentals with a return date of null
SELECT *
FROM   MM_Rental
WHERE  return_date IS NULL ;

--Select statement 8
--Test for non null values with the IS NOT NULL operator.
--Find all rentals with a value in their return date
SELECT rental_id
FROM   MM_Rental
WHERE return_date IS NOT NULL ;


--Select statement 9
--AND requires both conditions to be true.
--Find all titles with a lowercase letter o in their title with more than 3 in stock
--Include the title and the quantity in the output:
SELECT game_title, game_qty
FROM   MM_Game
WHERE  GAME_TITLE LIKE '_o%'
AND    GAME_QTY > 3;

--Select statement 10
--AND requires both conditions to be true.
--Find all titles with a lowercase letter o in their title with 3 or more in stock
--Include the title and the quantity in the output:
SELECT game_title, game_qty
FROM   MM_Game
WHERE  GAME_TITLE LIKE '_o%'
AND    GAME_QTY > 3;

--Select statement 11
--NOT requires a condition to be FALSE.
--Find the titles of all games that DO NOT have a price of 9, 10 or 12 using the IN operator
--Include the title and the price in the output
SELECT game_title, game_price
FROM   MM_Game
WHERE  game_price NOT IN (9,10,12);

--Select statement 12
--Rules of Precedence apply
SELECT game_title, game_qty
FROM   mm_game
WHERE  (game_title like 'F%'
OR     game_title like '_o%')
AND    game_qty > 3;



--Select statement 13
--Rules of precedence - here the parentheses are controlling what is considered in the AND
SELECT game_title, game_qty
FROM   mm_game
WHERE  (game_title like 'F%'
OR     game_title like '_o%')
AND    game_qty > 3;


--Select statement 14
--Sort retrieved rows with the ORDER BY clause:
--ASC: ascending order, default
--DESC: descending order
--The ORDER BY clause comes last in the SELECT statement.
--Find the titles of all games where game type is 2 or 3 and  sort in ascending order of game_type_id; include game_type_id in the output
SELECT game_title,game_type_id
FROM mm_game
WHERE game_type_id = 2
OR    game_type_id = 3
ORDER BY game_type_id ASC;


--SECTION 3 SELECT STATEMETNS TO RETRIEVE DATA FROM MULTIPLE TABLES USING INNER JOINS
--Select statment 15
--Return the names and categories of all games sorted in order of type showing the name of the type rather than the ID 
SELECT game_title, game_type_description
from MM_Game
join MM_Game_Type
using (game_type_id);


--Select statement 16
--Suppose we want to sort them in order of the type description
SELECT game_title, game_type_description,game_type_id
from MM_Game
join MM_Game_Type
using (game_type_id)
ORDER BY game_type_id ASC;


--Select statement 17
--Suppose now we only wanted to find games from a type with the letter o somewhere in its name?
SELECT game_title, game_type_description
from MM_Game
join MM_Game_Type
using (game_type_id);
WHERE game_type_description LIKE '_o%';


--Select statement 18
--We can join a table to more than one table in a select statement
--Suppose we want to get the following details for each rental:
--Customer name
--Game title
--Date checkedout
--We need to join our rental table to both the game and the customer table to achieve it
--Rental table is our main table since it holds the links to both of the other table
SELECT firstname , game_title, checkout_date
FROM MM_Rental
JOIN MM_Game USING (game_id between MM_Rental and MM_Game)
JOIN MM_Customer USING (customer_id between MM_Rental and MM_Customer);




Select * from MM_Game_Type;
Select * from MM_Customer;
Select * from MM_Game;
Select * from MM_Rental;