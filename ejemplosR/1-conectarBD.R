# Documentacion RMySQL
# https://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf
# https://github.com/r-dbi/RMySQL

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

# Informacion de la conexion
summary(con)
dbGetInfo(con)

# Lista de las tablas
dbListTables(con)


# Cerrar Conexion
dbDisconnect(con)


