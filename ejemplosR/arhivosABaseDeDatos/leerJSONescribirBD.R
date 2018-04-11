#install.packages("jsonlite")
#https://cran.r-project.org/web/packages/jsonlite/vignettes/json-aaquickstart.html

#install.packages("RMySQL")

library(DBI)
library(jsonlite)

# Crear Conexion
con <- dbConnect(RMySQL::MySQL(), 
                 dbname = "test",
                 host = "127.0.0.1",
                 port = 3306,
                 user = "root",
                 password = "root"
)

fileName <- "facultad.json"
f = readChar(fileName, file.info(fileName)$size)

myjson <- fromJSON(f)

num = nrow(myjson)
for(n in 1:num){
  d = myjson[n,]
  strInsert = paste("INSERT INTO facultad (nombre) VALUES (\"", d[[1]],"\")", sep="")
  print(strInsert)
  
  comando = dbSendQuery(con, strInsert)
  dbClearResult(comando)
}

dbDisconnect(con)

