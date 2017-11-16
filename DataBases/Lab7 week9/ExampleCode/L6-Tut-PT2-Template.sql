#Assuming you are doing these in order so need to drop the other tables from tutorial part 1
drop table order_item;
drop table customer;
drop table product;

create table product(
product_id	number(5) primary key,
product_name varchar2(50),
supplier_name varchar2(50),
unit_price	number(5,2),
units number(3));



insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
100,	'Camera',	'Nikon',	300.19,	5);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
101,	'Television',	'Onida',	100.25,	26);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
102,	'Refrigerator',	'Vediocon',	150.45,	2);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
103,	'Ipod',	'Apple',	75.6,	25);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
104,	'Mobile',	'Nokia',	50.00,	28);


commit;

--1.	Write the SQL needed to return for each product the product id, the name of the product in uppercase and the 
--name of the supplier in lowercase.
select _____, ____(_____), ____(_____) from product;
--2.	Change you SQL for 1 to concatenate the name of the product and the name of the supplier.
select _____, _____(____(_____), ____(_____)) from product;
--3.	Change your SQL for 1 to include the unit_price rounded to 1 decimal place.
select _____, ____(_____), ____(_____),____(_____,_) from product;

--4.	Change your SQL for 1 to include the total value of stock for each product (unit_price * units) output with 0 decimal places.
select _____, ____(_____), ____(_____), ____(_____,0) from product;
--5.	Write the SQL to output a  sentence of the form
--The total value of stock for PRODUCT X  is 99999
select '_____________________' || ____(_____) || '__ ' || ____(_____,_) from product;

--6.	Find the names of all suppliers with the letter n as the last letter of their name.
select ________ from product where ______(_____,_,_)='n';
