
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
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
105,	'Smartphone',	'Nokia',	90.00,	40);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
106,	'iPad',	'Apple',	200.00,	10);



commit;

--1.	Write the SQL needed to output the name of each supplier and the number of different products they supply.
select supplier_name, ____(_____) from product group by ______;

--2.	Write the SQL needed to output the name of each supplier the max, min and average price of products for each supplier.
select supplier_name, max(_____), min(_____), avg(______) from product group by ______;

--3.	Write the SQL needed to output the supplier name and the total value of products (units * unit price) in stock for each supplier.
select  supplier_name, sum(_______*_____) from product group by ______;
