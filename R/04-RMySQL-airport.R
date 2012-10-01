library(RMySQL)

con = dbConnect(MySQL(), user="root", dbname="test")

dbListFields(con, "airport")

data = dbGetQuery(con, "select * from airport")

dbDisconnect(con)

View(data)
