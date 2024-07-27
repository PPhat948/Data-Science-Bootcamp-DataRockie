/*
Create database อย่างน้อย 3 table
write sql queries at least 3 query(select)
- 1 with clause/ subquery
- agg function & group by
- where
สร้างเกี่ยวกับร้านอาหาร เช่น table menu,staff,ingredient...
*/
CREATE TABLE staff(
  staff_id INT PRIMARY KEY,
  name text,
  tel_number text UNIQUE
);

INSERT INTO staff values 
(1,'Jame','0812345678'),
(2,'Joe','0823456789'),
(3,'June','0612345678'),
(4,'Jane','0912345678');

CREATE TABLE menu(
  menu_id INT PRIMARY KEY,
  name text,
  price int
);
INSERT INTO menu values
(1,'pizza',299),
(2,'spaghetti',129),
(3,'salad',79),
(4,'bbq chicken',159),
(5,'soup',49),
(6,'french fries',39);

CREATE TABLE orders(
  order_id INT PRIMARY KEY,
  order_date date,
  staff_id INT,
  menu_id INT
);
INSERT INTO orders values
(0001,'20-06-2567',1,1),
(0002,'20-06-2567',2,2),
(0003,'20-06-2567',3,3),
(0004,'20-06-2567',4,6),
(0005,'20-06-2567',2,5),
(0006,'20-06-2567',1,4),
(0007,'20-06-2567',3,1),
(0008,'21-06-2567',4,1),
(0009,'21-06-2567',1,2),
(0010,'21-06-2567',2,3),
(0011,'21-06-2567',4,1),
(0012,'21-06-2567',2,3),
(0013,'21-06-2567',1,4),
(0014,'21-06-2567',3,2),
(0015,'21-06-2567',2,1);

--1.With Clause
--Find the menu that most ordered in 20-06-2567 and how many order are there
WITH most_order_20_06_67 AS(
  SELECT menu_id, COUNT(menu_id) AS order_count
  FROM orders
  WHERE order_date = '20-06-2567'
  GROUP BY menu_id
  LIMIT 1
)
SELECT t2.name,t1.order_count
FROM most_order_20_06_67 AS t1
JOIN menu AS t2 ON t1.menu_id = t2.menu_id;
--The most ordered menu in 20-06-2567 is pizza.It was ordered 2 times.

--2.AGG function
--Find the total income from each menu in 21-06-2567
SELECT menu.name,SUM(menu.price) AS total_income
FROM orders 
JOIN menu ON orders.menu_id = menu.menu_id
WHERE order_date = '21-06-2567'
GROUP BY menu.name
ORDER BY total_income DESC;
--pizza 897
--spaghetti 258
--bbq chicken 159
--salad 158


--3.Where Clause
--How many orders that Jame recieved
SELECT COUNT(*) AS total_orders
FROM orders 
JOIN staff ON orders.staff_id = staff.staff_id
WHERE staff.name = 'Jame'
--Jame recieved 4 orders 





