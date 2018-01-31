drop table order_item;
drop table customer;
drop table product;

create table product(
product_id	number(5) primary key,
product_name varchar2(50),
supplier_name varchar2(50),
unit_price	number(5,2),
units number(3));

create table customer(
customer_id number(5) primary key,
customer_name varchar2(50))
;

create table order_item(
order_id	number(5) primary key,
product_id	number(5),
units	number(3),
customer number(5) ,
constraint ord_prod_fk foreign key (product_id) references product(product_id),
constraint ord_cust_fk foreign key (customer) references customer(customer_id)

);
insert into customer (customer_id,	customer_name) values (1,	'Infosys');
insert into customer (customer_id,	customer_name) values (2,	'Satyam');
insert into customer (customer_id,	customer_name) values (3,	'Wipro');
insert into customer (customer_id,	customer_name) values (4,	'TCS');

insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
100,	'Camera',	'Nikon',	300,	5);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
101,	'Television',	'Onida',	100,	26);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
102,	'Refrigerator',	'Vediocon',	150,	2);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
103,	'Ipod',	'Apple',	25,	25);
insert into product(product_id,	product_name,	supplier_name,	unit_price,	units) values(
104,	'Mobile',	'Nokia',	50,	28);

insert into order_item (order_id,	product_id	,units,	customer) values (5100,	104,	30,	1);
insert into order_item (order_id,	product_id	,units,	customer) values (5101,	102,	5,	2);
insert into order_item (order_id,	product_id	,units,	customer) values (5102,	103,	25,	3);
insert into order_item (order_id,	product_id	,units,	customer) values (5103,	101	,10	,4);

commit;


--1.	Write the SQL needed to return for each order item the order id, the name of the product ordered and the customer id.
Select ______, ______, ______
from ______
join ______;

--2.	Write the SQL needed to return for each order item the order id, the id of the product ordered, and the name of the customer who ordered it.
Select ______, ______,  ______
from ______
join ______;

--3.	Write the SQL needed to return the id of the product ordered, the quantity ordered, the quantity in stock and the id of the customer  for each order item where the units ordered are less than the units in stock.
select ______, ______, ______, ______, ______
from ______
join ______ on (______ < ______  and ______ <> ______);

--4.	What would a natural join between order_item and product produce?

select * from ______ natural join _______;