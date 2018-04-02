# Documentacion RMySQL
# https://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf

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

# Leer los atributos
dbListFields(con, "facultad")

# 1 Leer toda la tabla, no usar con tablas grandes 
facultades = dbReadTable(con, "facultad")
facultades

# 2 Leer toda una consulta
dbGetQuery(con, "SELECT * FROM facultad LIMIT 5;")

# 3 Leer fila por fila (mas seguro)
query = dbSendQuery(con, "SELECT * FROM facultad;")
dbColumnInfo(query) #Columnas retornadas

while(!dbHasCompleted(query)){
  data = dbFetch(query, n = 1)
  dbGetRowCount(query)
  print(data)
}

dbClearResult(query)

# Cerrar Conexion
dbDisconnect(con)



