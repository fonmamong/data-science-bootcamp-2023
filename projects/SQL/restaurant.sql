.open restaurant.db
   
    --- create table and insert values---
    
create table if not exists customers (
    id_customers int unique,
    name text);
insert into  customers values 
    (1,"Fon"),
    (2,"Jan"),
    (3,"Dan"),
    (4,"May"),
    (5,"John"),
    (6,"Marry"),
    (7,"Joy"),
    (8,"Kim"),
    (9,"Fa"),
    (10,"TA");
.table
    
create table if not exists menu (
    id_menu int unique,
    name_menu text,
    price real);
    
insert into menu values 
(1,"Corndog",60),
(2,"Fried_chicken",60),
(3,"Spring_rolls",60),
(4,"Fried_shrimp",100),
(5,"French_fried",40),
(6,"Nugget",60),
(7,"Coke",40),
(8,"Water",20);



create table if not exists order_sep_2023 (
    id_customers int,
    id_order int unique,
    id_menu int);

insert into order_sep_2023 values 
    (5,202301,8),
    (1,202302,5),
    (2,202303,4),
    (4,202304,8),
    (9,202305,2),
    (8,202306,1),
    (3,202307,4),
    (6,202308,7),
    (7,202309,6);

-- Join table -- 
.mode table 
select ord.id_order,
    menu.price,
    menu.name_menu as menu,
    cus.name
    from menu 
join order_sep_2023 as ord 
on menu.id_menu = ord.id_menu
join customers as cus 
on ord.id_customers = cus.id_customers;

 -- Q'ty order of Fried_shrimp--
with sub1  as (
    select * from order_sep_2023
    where id_menu =4
) , sub2 as (
    select * from menu 
    where id_menu = 4
)
select sub2.name_menu as menu_popular ,count(sub1.id_customers) as "Q'ty order" 
from sub1
join sub2
on sub1.id_menu = sub2.id_menu;


-- TTL price-- 
.mode table 
select 
    sum(menu.price) as TTL_price
    from menu 
join order_sep_2023 as ord 
on menu.id_menu = ord.id_menu;
