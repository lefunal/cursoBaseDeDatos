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

query = dbSendQuery(con, "SELECT * FROM facultad JOIN profesor ON(profesor.id_facultad = facultad.id_facultad);")
dbColumnInfo(query) #Columnas retornadas

while(!dbHasCompleted(query)){
  data = dbFetch(query, n = 1)
  dbGetRowCount(query)
  print(data)
}

dbClearResult(query)

# Cerrar Conexion
dbDisconnect(con)

