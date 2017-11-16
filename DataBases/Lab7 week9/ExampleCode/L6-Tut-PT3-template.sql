#Assuming you are doing these in order so need to drop the table, recreate it and insert the data

drop table product;

create table product(
product_id	number(5) primary key,
product_name varchar2(50),
supplier_name varchar2(50),
unit_price	number(5,2),
units number(3));



insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
100,	'Camera',	'Nikon',	300.19,	5);
insert into product(product_id,	product_name,		unit_price,	units) values(
101,	'Television',	100.25,	26);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
102,	'Refrigerator',	'Vediocon',	150.45,	2);
insert into product(product_id,	product_name,	unit_price,	units) values(
103,	'Ipod',	75.6,	25);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
104,	'Mobile',	'Nokia',	50.00,	28);


commit;

--1.	Write the SQL needed to the name of each supplier or No supplier if the value is null.
select ___(_______,'_______') from product;
--2.	Write the SQL needed to output Supplier Known if a supplier name is not null, Supplier not known otherwise.
select ____(_______, '_______', '_______') from product;
--3.	Write the SQL needed to output the name of the product followed by Expensive if the product costs more than 150, Mid-range if the 
--product costs between 70 and 150 and Budget otherwise.
select product_name, 
case 
when _______then '_______'
when _______ then '_______'
else '_______'
end
from product;