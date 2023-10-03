install.packages("RPostgreSQL")
library(RPostgreSQL)

## making connection
con <- dbConnect(PostgreSQL(),
                 host = 'arjuna.db.elephantsql.com',
                 port = 5432,
                 user = 'jboldpvv',
                 password = 'owLLcjzgkjy4yd0ERKBhtK_d9g9XraZH',
                 dbname = 'jboldpvv')

## create menu tabel
menu <- data.frame(menu_id = 1:3, name = c("Cheese Burger", "Hot dog", "Pizza"),
                                      price = c(5, 3, 10))

## create member tabel
member <- data.frame(member_id = 1:3, name = c("Toy", "Pun", "Blue"), city = c("London", "Bangkok", "Newyork"))

## create order table
orders <- data.frame(order_id = 1:5, customer_id = c(1, NA, 3, NA, 2), menu_id = c(1,3,2,1,3))


## wirte table
dbWriteTable(con, "menu", menu)
dbWriteTable(con, "member", member)
dbWriteTable(con, "orders", orders)


## list all table
dbListTables(con)

##
dbGetQuery(con, "select * from menu")
dbGetQuery(con, "select * from member")
dbGetQuery(con, "select * from orders")

##
dbGetQuery(con, "SELECT * FROM orders AS A join menu AS B ON A.menu_id = B.menu_id")

##
dbDisconnect(con)
