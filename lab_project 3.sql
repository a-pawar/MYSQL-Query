
create database lab_project3;
use lab_project3;
create table client(client_id varchar(20) primary key,client_name varchar(20) ,
address varchar(20),city varchar(20),pin int,state varchar(20),bal_due float);
insert into client values('cn01001','alak roy','b.d. para','amarpur',799101,'tripura',390.9);
insert into client values('cn01002','suman roy','puk para','agartala',799102,'tripura',2390.9 ),
('cn01003','moytree nayak','pachmile','tezpur',799152,'assam',9990.9),
('cn01004','priya das','chopra para','kamalpur',799301,'tripura',1390.9),
('cn01005','mita mia','kamal para','singur',799721,'tripura',190.9),
('cn01006','pulak roy','bircity','sonitpur',799141,'assam',110.9),
('cn01007','munni das','nappam','sonitpur',799152,'assam',190.9),
('cn01008','kusum roy','city_dos','tezpur',799141,'assam',110.9),
('cn01009','mina das','pachmile','tezpur',799152,'assam',190.9),
('cn01010','pauri mia','pachmile','tezpur',799152,'assam',2990.9),
('cn01011','manali das','satmile','tezpur',799154,'assam',3990.9);
desc client;

create table product(product_id varchar(5) primary key ,product_name varchar(15),
manufacturer_name varchar(20),product_rate decimal,sell_price decimal,
product_description varchar(10));
insert into product values('p001','lux_soap','lux_international',15.67,20.43,'soap'),
('p002','copy','times_copy_org',14.8,16.4,'copy'),
('p003','marry_biscuit','marigold_org',2218.8,2220.4,'biscuit'),
('p004','mitsubisi_pen','pen_international',2015.67,2120.43,'pen'),
('p005','learn_books','book_world',5104.8,5116.4,'book'),
('p006','tata_steel','tata_org',5118.8,5120.4,'tata'),
('p007','seagate_hdd','seagate_world',5104.8,5116.4,'HDD1034'),
('p008','dvd_writer','frontec_org',5118.8,5120.4,'DVDRW');

create table  sales_order(sales_order_no varchar(7) primary key, sales_order_date date,
client_id varchar(7), salesman_id varchar(4),
bill_payby_party varchar(3) check(bill_payby_party="yes" or bill_payby_party="no"),
delivery_date date, product_rate float, tot_quantity_order int, cancel_date date);
select * from sales_order;
insert into sales_order values("on01001","08-08-01","cn01001","s001","yes","08-08-20",2220.4,50,"00-00-00");
insert into sales_order values("on01002","08-08-12","cn01004","s001","yes","08-08-23",2220.4,15,"00-00-00");
insert into sales_order values("on01003","08-08-12","cn01005","s003","yes","08-08-26",2220.4,10,"00-00-00");
insert into sales_order values("on01004","08-08-13","cn01004","s001","yes","08-08-20",2220.4,15,"00-00-00");
insert into sales_order values("on01005","08-08-14","cn01002","s002","no","08-08-30",2220.4,52,"08-08-28");
insert into sales_order values("on01006","08-08-15","cn01001","s001","yes","08-08-31",2220.4,53,"00-00-00");
insert into sales_order values("on01007","08-01-16","cn01003","s004","yes","08-08-28",2220.4,54,"00-00-00");
insert into sales_order values("on01008","08-02-01","cn01004","s003","no","08-08-28",8220.4,54,"08-03-18");

create table salesman(salesman_id varchar(7) primary key,salesman_name varchar(20),address varchar(15), 
city varchar(15), pin int, state varchar(15),salary int);
insert into salesman values("s001","Rohan Das","nappam","Tezur",79970,"Assam",8000);
insert into salesman values("s002","Rohan Das","nappam","Tezur",799170,"Assam",8000);
insert into salesman values("s003","Smita Das","nirjuli","Itangar",799701,"Arunachal",9000);
insert into salesman values("s004","Kabir Bora","nappam","Tezur",799703,"Assam",8500);
insert into salesman values("s005","Neha Singh","borbota","Sonitput",795970,"Assam",9600);
insert into salesman values("s006","Priya Agrwal","gandhi road","32 district",799750,"Delhi",9900);
insert into salesman values("s007","Ashok Paul","filmcity","Munnabari",799740,"Mumbai",8900);

alter table sales_order add constraint fk foreign key(client_id) references client(client_id);
alter table sales_order add constraint fk1 foreign key(salesman_id) references salesman(salesman_id);

select * from product;
select * from client;
select * from sales_order;
select * from salesman;

#(1) Retrieve the list of names and the cities of all the clients.
select client_name,city from client;
#(2) List the various products available.
select product_name from product;
#(3) Find the names of all clients having ‘a’ as the second letter in their names.
select * from client where client_name like'_a%';
#(4) List all the clients who are located in TEZPUR.
select * from client where city ='TEZPUR';
#(5) Find the products whose selling price is greater than 2000 and less than or equal to 5000.
select * from product where 2000<sell_price and sell_price<=5000;
#(6) Add a new column NEW_PRICE into the product_master table.
alter table product add new_price int;
#(7) Rename the column product_rate of Sales_Order_Details to new_product_rate.
#alter table sales_order change product_rate  new_product_rate float;
alter table sales_order rename column product_rate to new_product_rate;
#(8) List the products in sorted order of their description.
select * from product order by product_description;
#(9) Display the order number and date on which the clients placed their order.
select sales_order_no,sales_order_date,client_name from sales_order,client where 
sales_order.client_id=client.client_id;
#(10) Delete all the records having delivery date before 25th August,2008.
delete from sales_order where delivery_date <'2008-08-25';
#(11) Change the delivery date of order number ON01008 to 16-08-2008.
update sales_order set delivery_date='2008-08-16' where sales_order_no='on01008';
#(12) Change the bal_due of client_no CN01003 to 1200.
update client set bal_due=1200 where client_id='cn01003';
#(13)Find the product with description as ‘HDD1034’ and ‘DVDRW’.
#select * from product  where product_description='hdd1034' or product_description='dvdrw';
select * from product  where product_description in('hdd1034' ,'dvdrw');
#(14) List the names, city and state of the clients not in the state of ‘ASSAM’.
#select client_name,city,state from client where state != 'assam';
select client_name,city,state from client where state not in ('assam');
#(15) List of all orders that were canceled in the of March.
select * from sales_order where month(cancel_date)='03';

(select * from client) union (select * from product);

#select * from sales_order where  some(select * from client where state='tripura');
select * from sales_order where not exists (select * from client where state='tripura');