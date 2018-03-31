# Documentacion RMySQL
# https://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf
# https://www.slideshare.net/RsquaredIn/rmysql-tutorial-for-beginners

#install.packages("RMySQL")

library(DBI)
# Crear Conexion
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "test",
                 host = "127.0.0.1",
                 port = 3306,
                 user = "root",
                 password = "root"
                 )

summary(con)
dbGetInfo(con)
dbListTables(con)

dbListFields(con, "city")

# No usar para tablas grandes 
ciudades = dbReadTable(con, "city")

# 1
dbGetQuery(con, "SELECT * FROM city LIMIT 5;")

# 2
query = dbSendQuery(con, "SELECT * FROM city;")
print(paste("Numero filas: ", numeroFilas))

while(!dbHasCompleted(query)){
  data = dbFetch(query, n = 1)
  dbGetRowCount(query)
  print(data)
}

dbClearResult(query)

#3
agregar = dbSendQuery(con, "INSERT INTO city (name) VALUES (\"Nueva York\")")
dbGetRowsAffected(agregar)

# Transaccciones
#------------------------------
dbBegin(con)
dbRollback(con)
dbCommit(con)
#-----------------------------

# Cerrar Conexion
dbDisconnect(con)


