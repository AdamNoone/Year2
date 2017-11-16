
create table order_item(
order_id	number(5) primary key,
product_id	number(5),
ord_date date,
units	number(3),
customer number (5),
ord_tot number(7,2) 

);


insert into order_item (order_id,	product_id	, ord_date, units,	customer, ord_tot) values (5100,	104,'12 Jun 2017',	30,	1, 530.4);
insert into order_item (order_id,	product_id	,ord_date, units,	customer, ord_tot) values (5101,	102,	'11 Jul 2017', 5,	2, 324.55);
insert into order_item (order_id,	product_id	,ord_date, units,	customer, ord_tot) values (5102,	103,'11 Aug 2017',	25,	3, 100.12);
insert into order_item (order_id,	product_id	,ord_date, units,	customer, ord_tot) values (5103,	101	,'23 Jul 2017', 10	,4,99.22);

commit;


--1.	Write the SQL needed to the output the order date formatted as dd/mm/yyyy.
select to_char(ord_date, '________') from order_item;
--2.	Write the SQL needed to output order total with the local currency symbol followed by 5 digits plus two decimal places.
select to_char(ord_tot, '_________') from order_item;
--3.	Change the SQL for 2 to include leading zeroes
select to_char(ord_tot, '__________') from order_item;