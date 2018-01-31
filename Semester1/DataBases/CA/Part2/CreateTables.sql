-- Databases I
-- Contiuous Assessment 2
-- Student Number  :C16448216
-- Student Name : Adam Noone
--Course Code : DT228

  
-- 1. Create your data structures and insert data
-- Drop tables to clear any existing structures with the same name
-- Drop tables to clear any existing structures with the same name
Drop table SpecProd CASCADE CONSTRAINTS PURGE;
Drop table Product CASCADE CONSTRAINTS PURGE;
Drop table ProdType CASCADE CONSTRAINTS PURGE;
Drop table Specification CASCADE CONSTRAINTS PURGE;
Drop table Designer CASCADE CONSTRAINTS PURGE;
Drop table Client CASCADE CONSTRAINTS PURGE;



--Create the tables

--Create table Client
Create table Client (
clientID Number(6),
fullName varchar2(50) NOT NULL,
emailAdr varchar2(30) NOT NULL,
CONSTRAINT client_pk PRIMARY KEY (clientID),
constraint client_emailAdr_uniqe UNIQUE(emailAdr),
constraint client_emailAdr_chk CHECK(emailAdr like '%@%.com')


);



--Create table Designer
Create table Designer (
designerID Number(6),
dName varchar(50) NOT NULL,
emailAdr varchar2(30),
dRateofPay number(4,2),
CONSTRAINT designer_pk PRIMARY KEY (designerID),
constraint designer_emailAdr_uniqe UNIQUE(emailAdr),
Constraint dRateofPay_chk CHECK (dRateofPay < 75.99)

);



--Create table Specification
Create table Specification (
specID Number(6),
clientID Number(6),
designerID Number(6),
specDate DATE,
specDesc varchar(50),
specCommision Number(7,2),
designHrsWorked number(3),
CONSTRAINT specification_pk PRIMARY KEY (specID),
Constraint Client_Specification_FK FOREIGN KEY (clientID) REFERENCES Client (clientID),
Constraint Designer_Specification_FK FOREIGN KEY (designerID) REFERENCES Designer (designerID),
Constraint specCommision_chk CHECK (specCommision < 16001),
Constraint designHrsWorked_chk CHECK (designHrsWorked < 151)
);


--Create table ProdType
Create table ProdType (
	prodCat char(1),
	catDesc varchar(50),
	CONSTRAINT prodCat_pk PRIMARY KEY (prodCat),
	CONSTRAINT prodCat_chk CHECK (prodCat IN ('G', 'L', 'C','S','X')),
	CONSTRAINT catDesc_chk CHECK (catDesc IN ('Garden Lighting', 'Lamps and Bulbs', 'Cables','Shades','Christmas'))


);


--Create table Product 
Create table Product (
prodCat char(1),
prodID varchar(6),
prodDesc varchar(50),
prodPrice number(4,2),
prodQtyInStock number(3),
CONSTRAINT product_pk PRIMARY KEY (prodID),
Constraint Product_Prodtype_fk FOREIGN KEY (prodCat) REFERENCES ProdType(prodCat),
Constraint prodPrice_chk CHECK (prodPrice  BETWEEN 5.00 AND 45.50 )

);


--Create table SpecProd
Create table SpecProd (

specID Number(6),
prodID Varchar(6),
prodCat char(1),
qtyUsed number(3),
Constraint SpecProd_Specification_fk FOREIGN KEY (specID) REFERENCES Specification(specID),
Constraint SpecProd_Product_fk FOREIGN KEY (prodID) REFERENCES Product(prodID),
Constraint SpecProd_ProdType_fk FOREIGN KEY (prodCat) REFERENCES ProdType(prodCat)
);

-- Inserting your data


-- Insert into Client Table
insert into Client (clientID, fullName,emailAdr) values(101, 'J.J. Abrams','jjab@sw.com');
insert into Client (clientID, fullName,emailAdr) values(201, 'Lawrence Kasdan','lkas@sw.com');
insert into Client (clientID, fullName,emailAdr) values(301, 'Daisy Ridley','drid@sw.com');
insert into Client (clientID, fullName,emailAdr) values(401, 'John Boyega','jboy@sw.com');

-- Insert into Designer Table
insert into Designer (designerID, dName,emailAdr,dRateofPay) values(101, 'Kelly Hoppen','khop@gmail.com.uk',65.00);
insert into Designer (designerID, dName,emailAdr,dRateofPay) values(201, 'Philippe Starck','pstark@stark.com',72.50);
insert into Designer (designerID, dName,emailAdr,dRateofPay) values(301, 'Victoria Hagan','vichag@gmail.com',75.00);
insert into Designer (designerID, dName,emailAdr,dRateofPay) values(401, 'Marmol Radziner','marmrad@gmail.com',45.50);

-- Insert into Specification Table
insert into Specification (specID, specDate,specDesc,specCommision,designHrsWorked,clientID,designerID) values(101, '12 Jun 2017','Full house',10000,10,101,101);
insert into Specification (specID, specDate,specDesc,specCommision,designHrsWorked,clientID,designerID) values(102, '14 Jul 2017','Garden Patio',12000,20,101,101);
insert into Specification (specID, specDate,specDesc,specCommision,designHrsWorked,clientID,designerID) values(103, '15 Aug 2017','Summerhouse',8000,5,201,301);
insert into Specification (specID, specDate,specDesc,specCommision,designHrsWorked,clientID,designerID) values(104, '10 Sep 2017','Christmas decorations',5000,5,301,201);

-- Insert into ProdType Table
insert into ProdType (prodCat, catDesc) values('G','Garden Lighting');
insert into ProdType (prodCat, catDesc) values('L','Lamps and Bulbs');
insert into ProdType (prodCat, catDesc) values('C','Cables');
insert into ProdType (prodCat, catDesc) values('X','Christmas');
insert into ProdType (prodCat, catDesc) values('S','Shades');

-- Insert into Product Table
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('G101','Outdoor Wall Light',40.00,26,'G');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('G102', 'Patio Lights',41.00,27,'G');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('L101', 'E14 Engery Saving Bulb',6.00,28,'L');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('L102', 'E27 Led Bulb ',9.00,30,'L');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('C101', '2-Core Black Braided Flexible Rubber Cable',10.00,50,'C');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('C102', 'Southwire 250-Ft 2-Conductor Landscape Lighting',11.00,78,'C');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('X101', 'LED string lights German Christmas 10-light',15.50,55,'X');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('X102', 'LED heart string lights',20.00,12,'X');
insert into Product(prodID,prodDesc,prodPrice,prodQtyInStock,prodCat) values('S101', 'Fabric Cylinder Shade Red',30.00,100,'S');


-- Insert into SpecProd Table
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(20,101,'L101','L');
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(30,101,'L102','L');
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(10,101,'C101','C');
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(20,102,'G101','G');
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(25,102,'G102','G');
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(10,103,'C101','C');
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(3,103,'C102','C');
insert into SpecProd (qtyUsed,specID,prodID,prodCat) values(20,104,'X101','X');



commit;


-- Retrieve all the data
select * from Client;
select * from Designer;
select * from Specification;
select * from Product;
select * from ProdType;
select * from SpecProd;


