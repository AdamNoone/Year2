--1.

--A listing for all designers of the specifications they have worked on including in the output their name,
--email address and a 10 character description of the specification in uppercase sorted in descending order
--of designer id and then specification description.

SELECT dName,designerID,emailAdr,UPPER (SUBSTR(specDesc, 1, 10)) -- Will select items (first 10 letters of specDsec in Uppercase)
FROM Specification												 -- Selects from the Specification table
join Designer using (designerID)								 -- join the Designer Table to the Specification table using designerID
ORDER BY designerID,specDesc DESC;                               -- Order by designerID and specDesc in descending order



--2.

-- A listing of all products. Including one column which combines the product ID and the product category code;
-- the product category description (in uppercase);  product description (in uppercase); product price (preceded by the Euro symbol).
-- The listing should be sorted by product category description in ascending order and descending order of product price within each category.



SELECT prodID,UPPER(catDesc) ,UPPER (prodDesc),to_char(prodPrice,'u99.99') -- Will select items (catDesc and prodDesc in uppercase ) and (prodPrice with a euro symbol)
FROM Product															   -- Selects from the Product table
join ProdType using (prodCat)                                              -- Join the ProdType Table to the Product table using prodCat
ORDER BY prodDesc ASC, prodPrice DESC; 									   -- Order by prodDesc in ascending order and prodPrice in descending order


--3.

-- A listing of all specifications showing the specification ID, client ID, client name, specification description,
-- specification date (formatted as dd/mm/yyyy) and specification commission(including the Euro symbol) sorted in 
--descending order of commission.


SELECT specID,clientID,fullName,specDesc,to_char(specDate,'fmDD/MM/YYYY'),to_char(specCommision,'u999,999.99') --Will select items (specDate in DD/MM/YYYY format  ) and (specCommision with a euro symbol)
FROM Specification																							   -- Selects from the Specification table
JOIN Client using (clientID)																				   -- join the Client Table to the Specification table using clientID
ORDER BY specCommision DESC;																				   -- Order by specCommision in descending order





--4.
--A listing of all specifications showing the specification ID, client ID, client name, designer ID, designer name, 
--specification description, specification date (formatted as dd/mm/yyyy) and specification commission(including the Euro symbol) 
--sorted in descending order of commission. The following headers should be used SPECIFICATION ID CLIENT NAME DESIGNER NAME DESCRIPTION COMMISSION DATE COMMISSION AMT

--Will select items and change header in output (specDate in DD/MM/YYYY format  ) and (specCommision with a euro symbol)
SELECT specID AS SPECIFICATION_ID,clientID AS CLIENT ,fullName AS NAME ,designerID AS DESIGNER ,dName AS NAME_ ,specDesc AS DESCRIPTION ,to_char(specDate,'fmDD/MM/YYYY') AS COMMISSION_DATE ,to_char(specCommision,'u999,999.99') AS COMMISSION_AMT
FROM Specification                                                               -- Selects from the Specification table
JOIN Client using (clientID)												     -- Join the Client Table to the Specification table using clientID
JOIN DESIGNER using (designerID);												 -- join the Designer Table to the Specification table using designerID




--5.
--A listing for each product used as part of a specification the specification ID, specification description,
--the product name, product price, number of each product used and a total price per product per specification (price x quantity used).

SELECT specID,specDesc,prodDesc,prodPrice,qtyUsed, prodPrice*qtyUsed AS total_price_of_prod_per_spec  -- Will select items with an additional column showing (prodPrice*qtyUsed) called total_price_of_prod_per_spec 
FROM SpecProd																					      -- Selects from the SpecProd table
JOIN Specification  using (specID)																	  -- Join the Specification Table to the SpecProd table using specID	
JOIN Product  using (prodID);																		  -- Join the Product Table to the SpecProd table using prodID





--6.

--A listing for each specification including the specification ID,
--specification description and total cost of the specification
--(commission + Sum of quantity used  x product price for all products used).
--Hint: Involves a group 

SELECT specID,specDesc,SUM (prodPrice*qtyUsed )+ specCommision AS Total_cost -- Will select items with an additional column showing ((prodPrice*qtyUsed )+ specCommision) called Total_cost  
FROM SpecProd 														         -- Selects from the SpecProd table
JOIN Specification  using (specID)                                           -- Join the Specification Table to the SpecProd table using specID	
JOIN Product  using (prodID)                                                 -- Join the Product Table to the SpecProd table using prodID
GROUP BY specID,specDesc,specCommision                                       -- Group the attributes specID,specDesc,specCommision of thay contain the same values 
ORDER BY specID ASC;                                                         -- Display in ascendingorder of specID



--7. 


-- A listing showing details required for report 6 but including an additional column in the output which categorises
-- the specification as ‘High Value’ if the total cost is > 10,000, ‘Medium Cost’ if the total cost is between 8,000 and 10,000 
-- and ‘Low Cost’ otherwise. Hint: Involves using a selection statement


SELECT specID,specDesc,SUM (prodPrice*qtyUsed )+ specCommision AS Total_cost, -- Will select items with an additional column showing ((prodPrice*qtyUsed )+ specCommision) called Total_cost  
CASE 																		  -- Check each of the following when clauses
	WHEN SUM (prodPrice*qtyUsed )+ specCommision > 10000 THEN 'High Value'    -- if (prodPrice*qtyUsed )+ specCommision is more than 10,000
    WHEN SUM (prodPrice*qtyUsed )+ specCommision BETWEEN  8000 AND 10000 THEN 'Medium Cost' -- if (prodPrice*qtyUsed )+ specCommision is more than 8,000 but less than 10,000
    ELSE  'Low Cost'                                                          --If neither of the 2 conditions above have been satisfied, print this 
	END
	AS Cost                                                                   --Name of column in table 
FROM SpecProd                                                                 -- Selects from the SpecProd table
JOIN Specification  using (specID)                                            -- Join the Specification Table to the SpecProd table using specID
JOIN Product  using (prodID)                                                  -- Join the Product Table to the SpecProd table using prodID
GROUP BY specID,specDesc,specCommision                                        -- Group the attributes specID,specDesc,specCommision of thay contain the same values
ORDER BY specID ASC;                                                          -- Display in ascending order of specID







--8 

--  A listing showing details required for report 6 but including only specifications with a total cost more than 10000. 
--  Output should in the form of a sentence for each specification and the output column should be called ‘High Value Specifications’.
--  All numeric fields should be formatted appropriately for numerical/monetary field and trimmed of leading spaces to give a consistent output. E.g.
--  Specification 102 Garden Patio used a total of 45 products at a cost of €1825.00 and the total cost including commission was €13825.00
--  Hint: involves a group but including only selected values in the output with all output concatenated.


																															
    -- Will select items in the form of a sentance containing the following 
--	   |------>  The sum of qty of product used
--	   |------> (prodPrice*qtyUsed) with a euro symbol and a left trim 
--	   |------> (prodPrice*qtyUsed ) + specCommision with a euro symbol and a left trim 
--	   |------>  All with a header of High_Value_Specification
SELECT 'Specification ' || specID ||' '|| SpecDesc || ' used a total of ' || SUM (qtyUsed ) || ' products at a cost of ' || LTRIM (to_char(SUM(prodPrice*qtyUsed),'u9999.99')) || 
		' and the total cost including commission was ' || LTRIM (to_char((SUM (prodPrice*qtyUsed ) + specCommision),'u999,999.99')) AS High_Value_Specification
FROM SpecProd                                                         -- Selects from the SpecProd table
JOIN Specification  using (specID)                                    -- Join the Specification Table to the SpecProd table using specID
JOIN Product  using (prodID)                                          -- Join the Product Table to the SpecProd table using prodID
GROUP BY specID,specDesc,specCommision                                -- Group the attributes specID,specDesc,specCommision of thay contain the same values
HAVING ( SUM (prodPrice*qtyUsed )+ specCommision >  10000)            -- Only show options where (prodPrice*qtyUsed )+ specCommision  is more than 10000
ORDER BY specID ASC;                                                  -- Display in ascending order of specID





--CONSTRAINTS ERROR CHECKING 

--                            CLIENT EMAIL MUS BE UNIQUE
--insert into Client (clientID, fullName,emailAdr) values(101, 'J.J. Abrams','jjab@sw.com');
--insert into Client (clientID, fullName,emailAdr) values(101, 'J.J. Abrams','jjab@sw.com');(this line will give a error as email is the same as another in table)



--                            DESIGNER EMAIL MUS BE UNIQUE
--insert into Designer (designerID, dName,emailAdr,dRateofPay) values(101, 'Kelly Hoppen','khop@gmail.com.uk',65.00);
--insert into Designer (designerID, dName,emailAdr,dRateofPay) values(101, 'Kelly Hoppen','khop@gmail.com.uk',65.00);(this line will give a error as email is the same as another in table)



--           	ALL EMAIL ADDRESSES MUST CONTAIN THE @ SYMBOL AND A THE . SYMBOL AND THESE CANNOT BE THE FIRST CHARACTER OF THE EMAIL ADDRESS
-- insert into Client (clientID, fullName,emailAdr) values(101, 'J.J. Abrams','jjabsw.com') ;(will give error as there is no @ symbol)
-- insert into Client (clientID, fullName,emailAdr) values(101, 'J.J. Abrams','jjab@swcom');(will give error as there is no . symbol)
-- insert into Client (clientID, fullName,emailAdr) values(101, 'J.J. Abrams','@swcom'); (will give error as @ is at start)


--                                 DESIGNER RATE OF PAY MUST BE < 75.99.
----insert into Designer (designerID, dName,emailAdr,dRateofPay) values(101, 'Kelly Hoppen','khop@gmail.com.uk',120.00); (will give error as dRateofPay is 120.00)


--                                 PRODUCT UNIT PRICE MUST BE BETWEEN 5.00 AND 45.50.
-- insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('G101','Outdoor Wall Light',50.00,26,'G');(will give error as prodPrice is 50.00)


--                          	THE COMMISSION PRICE FOR A SPECIFICATION CANNOT BE MORE THAN 16,000.
--insert into Specification (specID, specDate,specDesc,specCommision,designHrsWorked,clientID,designerID) values(104, '10 Sep 2017','Christmas decorations',25000,5,301,201);(will give error as specCommision is 25,000)


--                                	THE HOURS WORKED BY A DESIGNER ON A SPECIFICATION CANNOT BE MORE THAN 150.
--insert into Specification (specID, specDate,specDesc,specCommision,designHrsWorked,clientID,designerID) values(104, '10 Sep 2017','Christmas decorations',25000,999,301,201);(will give error as designHrsWorked is 999)



--                         	VALID PRODUCT CATEGORIES ARE G GARDEN LIGHTING, L LAMPS & BULBS, C CABLES, S SHADES, X CHRISTMAS.
-- insert into ProdType (prodCat, catDesc) values('Z','Garden Lighting');(will give error as prodCat is 'Z')
--insert into ProdType (prodCat, catDesc) values('G','Paint'); (will give error as catDesc is 'Paint')





