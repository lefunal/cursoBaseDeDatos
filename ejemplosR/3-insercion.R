# Documentacion RMySQL
# https://cran.r-project.org/web/packages/RMySQL/RMySQL.pdf

#install.packages("RMySQL")

# Con RMySQL insert, update y delete se manejan de forma similar

library(DBI)
# Crear Conexion
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "test",
                 host = "127.0.0.1",
                 port = 3306,
                 user = "root",
                 password = "root"
)

#Insercion
comando = dbSendQuery(con, "INSERT INTO facultad (nombre) VALUES (\"Nueva Facultad\")")
#Cuantas filas se agregaron
dbGetRowsAffected(comando)

dbClearResult(comando)

#Insercion con manejo de errores
tryCatch(
  {
    #Insercion
    comando = dbSendQuery(con, "INSERT INTO facultad (id_facultad, nombre) VALUES (1, \"Nueva Facultad\")")
    dbClearResult(comando)
    comando = dbSendQuery(con, "INSERT INTO facultad (id_facultad, nombre) VALUES (1, \"Nueva Facultad\")")
    dbClearResult(comando)
  },
  error = function(cond){
    print("Error:")
    cond
  },
  warning = function(cond){
    print("Warning:")
    cond
  },
  finally = {
    dbClearResult(comando)
  }
)



# Cerrar Conexion
dbDisconnect(con)


