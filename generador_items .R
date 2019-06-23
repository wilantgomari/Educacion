#Instalar paquete que nos generá los items
install.packages('eRm')

#Cargar librería
library(eRm)

#Generación de items para los campus A, B y C.
#Evaluación 2017-2018 (2018) y 2018-2019 (2019)
campus_A_2018 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_C_2018 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_B_2018 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_A_2019 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_C_2019 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_B_2019 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")

#Nombre filas
row.names(campus_A_2018) <- c("campus_A_2018_Alumno",1:500,sep=""))
row.names(campus_B_2018) <- c("campus_B_2018_Alumno",1:500,sep=""))
row.names(campus_C_2018) <- c("campus_C_2018_Alumno",1:500,sep=""))
row.names(campus_A_2019) <- c("campus_A_2019_Alumno",1:500,sep=""))
row.names(campus_B_2019) <- c("campus_B_2019_Alumno",1:500,sep=""))
row.names(campus_C_2019) <- c("campus_C_2019_Alumno",1:500,sep=""))

#Nombre columnas
col.names(campus_A_2018) <- c("Item",1:39,sep=""))
col.names(campus_B_2018) <- c("Item",1:39,sep=""))
col.names(campus_C_2018) <- c("Item",1:39,sep=""))
col.names(campus_A_2019) <- c("Item",1:39,sep=""))
col.names(campus_B_2019) <- c("Item",1:39,sep=""))
col.names(campus_C_2019) <- c("Item",1:39,sep=""))


write.csv(campus_A_2018,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2018.csv')
write.csv(campus_B_2018,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2018.csv')
write.csv(campus_C_2018,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2018.csv')
write.csv(campus_A_2019,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2019.csv')
write.csv(campus_B_2019,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2019.csv')
write.csv(campus_C_2019,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2019.csv')



