# Script para leer datos desde facultad.csv con los nombres de las facultades a insertar
# que luego se insertan en la base de datos

# Se espera que facultad.csv este separado por tabs, 
# y que la seguna columna tenga las facultades que se quieren insertar 

# Se espera que haya una tabla facultad con una columna nombre

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

# Directorio donde se esta trabajando
getwd();

dat = read.csv("facultad.csv", sep="\t")

num = nrow(dat)
for(n in 1:num){
  d = dat[n,]
  strInsert = paste("INSERT INTO facultad (nombre) VALUES (\"", d[[2]],"\")", sep="")
  print(strInsert)
  
  comando = dbSendQuery(con, strInsert)
  dbClearResult(comando)
  
}

dbDisconnect(con)

