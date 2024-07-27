library(RSQLite)

#Create new Database
con = dbConnect(SQLite(),"restaurant.db")

#Create staff table
staff_df = data.frame(
  staff_id = 1:4,
  name = c("Jame","Joe","June","Jane")
)

#Create menu table
menu_df = data.frame(
  menU_id = 1:6,
  name = c("pizza","spaghetti","salad","bbq chicken","soup","french fries"),
  price = c(299,129,79,159,49,39)
)

#Create order table
order_df = data.frame(
  order_id = 0001:0015,
  order_date = c('20-06-2567', '20-06-2567', '20-06-2567', '20-06-2567', '20-06-2567',
                        '20-06-2567', '20-06-2567', '21-06-2567', '21-06-2567', '21-06-2567',
                        '21-06-2567', '21-06-2567', '21-06-2567', '21-06-2567', '21-06-2567'),
  staff_id = c(1, 2, 3, 4, 2, 1, 3, 4, 1, 2, 4, 2, 1, 3, 2),
  menu_id = c(1, 2, 3, 6, 5, 4, 1, 1, 2, 3, 1, 3, 4, 2, 1)
)

#Add tables to database
dbWriteTable(con,"staff",staff_df)
dbWriteTable(con,"menu",menu_df)
dbWriteTable(con,"orders",order_df)

#Check after add table to database
dbListTables(con)

dbGetQuery(con,"SELECT * FROM staff")
dbGetQuery(con,"SELECT * FROM menu")
dbGetQuery(con,"SELECT * FROM orders")


#1.With Clause
#Find the menu that most ordered in 20-06-2567 and how many order are there

dbGetQuery(con,"WITH most_order_20_06_67 AS(
  SELECT menu_id, COUNT(menu_id) AS order_count
  FROM orders
  WHERE order_date = '20-06-2567'
  GROUP BY menu_id
  LIMIT 1
)
SELECT t2.name,t1.order_count
FROM most_order_20_06_67 AS t1
JOIN menu AS t2 ON t1.menu_id = t2.menu_id;")


#2.AGG function
#Find the total income from each menu in 21-06-2567

dbGetQuery(con,"SELECT menu.name,SUM(menu.price) AS total_income
FROM orders 
JOIN menu ON orders.menu_id = menu.menu_id
WHERE order_date = '21-06-2567'
GROUP BY menu.name
ORDER BY total_income DESC;")


#3.Where Clause
#How many orders that Jame recieve

dbGetQuery(con,"SELECT COUNT(*) AS total_orders
           FROM orders 
           JOIN staff ON orders.staff_id = staff.staff_id
           WHERE staff.name = 'Jame' ")


