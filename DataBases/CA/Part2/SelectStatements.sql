--1.

--A listing for all designers of the specifications they have worked on including in the output their name,
--email address and a 10 character description of the specification in uppercase sorted in descending order
--of designer id and then specification description.

SELECT dName,designerID,emailAdr,UPPER(specDesc)
FROM Specification
join Designer using (designerID)
ORDER BY designerID,specDesc DESC;



--2.

-- A listing of all products. Including one column which combines the product ID and the product category code;
-- the product category description (in uppercase);  product description (in uppercase); product price (preceded by the Euro symbol).
-- The listing should be sorted by product category description in ascending order and descending order of product price within each category.

--need to figure out how to do euro symbol

SELECT prodID ,UPPER (prodDesc),UPPER(prodCat),to_char(prodPrice,'99.99') 
FROM Product
ORDER BY prodDesc ASC, prodPrice DESC;


--3.

-- A listing of all specifications showing the specification ID, client ID, client name, specification description,
-- specification date (formatted as dd/mm/yyyy) and specification commission(including the Euro symbol) sorted in 
--descending order of commission.

--need to figure out how to do euro symbol
SELECT specID,clientID,fullName,specDesc,to_char(specDate,'fmDD/MM/YYYY'),to_char(specCommision,'999,999.99')
FROM Specification
JOIN Client using (clientID)
ORDER BY specCommision DESC;





--4.
--A listing of all specifications showing the specification ID, client ID, client name, designer ID, designer name, 
--specification description, specification date (formatted as dd/mm/yyyy) and specification commission(including the Euro symbol) 
--sorted in descending order of commission. The following headers should be used SPECIFICATION ID CLIENT NAME DESIGNER NAME DESCRIPTION COMMISSION DATE COMMISSION AMT

--need to figure out how to do euro symbol
SELECT specID AS SPECIFICATION_ID,clientID AS CLIENT ,fullName AS NAME ,designerID AS DESIGNER ,dName AS NAME_ ,specDesc AS DESCRIPTION ,to_char(specDate,'fmDD/MM/YYYY') AS COMMISSION_DATE ,to_char(specCommision,'999,999.99') AS COMMISSION_AMT
FROM Specification
JOIN Client using (clientID)
JOIN DESIGNER using (designerID);




--5.
--A listing for each product used as part of a specification the specification ID, specification description,
--the product name, product price, number of each product used and a total price per product per specification (price x quantity used).

SELECT specID,specDesc,prodDesc,prodPrice,qtyUsed, prodPrice*qtyUsed AS total_price_of_prod_per_spec
FROM SpecProd
JOIN Specification  using (specID)
JOIN Product  using (prodID);




--6.

--A listing for each specification including the specification ID, specification description and total cost of the specification
--(commission + Sum of price x product price for all products used).
--Hint: Involves a group 

--NEED TO FIGURE OUT

SELECT specID,specDesc,
SUM (prodPrice*qtyUsed ) AS Total_cost
FROM SpecProd
JOIN Specification  using (specID)
JOIN Product  using (prodID)
GROUP BY specID,specDesc;

--or


SELECT specID,specDesc,
SUM (prodPrice*qtyUsed + (specCommision/ Count (specID)))AS Total_cost
FROM SpecProd
JOIN Specification  using (specID)
JOIN Product  using (prodID)
GROUP BY specID,specDesc,specCommision;







