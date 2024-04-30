create database swiggy;
use swiggy;


-- find customer who have never ordered-----
select * from users;
select * from order_details;
select* from orders;

select user_id from users;

select name from users
 where user_id not in (select user_id from orders);
 
 -- avg price/dish-----
 select * from restaurants;
 select * from food;
 select * from menu;
 select * from order_details;
 select * from users;
 -- avg price/dish-----
 select f.f_name,avg(price) from menu m join food f on m.f_id-f.f_id group by f.f_name order by f.f_name asc;
 
 select avg(price) from menu group by f_id ;
 select f.f_name, avg(price) from menu m join food f on m.f_id=f.f_id group by f_id;
 
 select f.f_name ,avg(price) as'avg price' from menu m
 join food f 
 on m.f_id = f.f_id 
 group by m.f_id;
 
 -- find top restautant in terms of no. of orders for a given months----
select r.r_name ,count(*) as 'month' 
from orders o
join restaurants r
on o.r_id=r.r_id
where monthname(date) like 'june'
group by o.r_id
order by count(*) desc limit 1;

select * from orders;

select r.r_name ,monthname(date) from orders o join restaurants r on o.r_id=r.r_id group by r.r_name;


-- restaurants with monthly sales greater than x 

select r_id , sum(amount) as 'revenu' 
from orders
where monthname(date) like 'june'
group by r_id  having revenu >500;

select r.r_name , sum(amount) as 'revenu' 
from orders o
join restaurants r
on o.r_id=r.r_id
where monthname(date) like 'june'
group by o.r_id 
 having revenu >500;
 
 -- Show all orders with order details for a particular customer in a particular date range
 select o.order_id, r.r_name
 from orders o 
 join restaurants r
 on r.r_id=o.r_id
 where user_id=(select user_id from users where name like 'Ankit')
 and (date >'2012-06-10' and date <'2022-07-10');
 
 
  select o.order_id, r.r_name,f.f_name
 from orders o 
 join restaurants r
 on r.r_id=o.r_id
 join order_details od
 on o.order_id=od.order_id
 join food f
 on f.f_id=od.f_id
 where user_id=(select user_id from users where name like 'Ankit')
 and (date >'2012-06-10' and date <'2022-07-10');