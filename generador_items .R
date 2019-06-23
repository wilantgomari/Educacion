#Instalar paquetes 
#Genera los items
install.packages('eRm')
#Manipula el dataframe
install.packages('tidyverse')

#Cargar librería
library(eRm)
library(tidyverse)

#Generación de items para los campus A, B y C.
#Evaluación 2017-2018 (2018) y 2018-2019 (2019)
campus_A_2018 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_B_2018 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_C_2018 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_A_2019 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_B_2019 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")
campus_C_2019 <- sim.rasch(500, 39, seed = NULL, cutpoint = "randomized")

#usamos la función tibble para el data frame
campus_A_2018 <- as_tibble(campus_A_2018)
campus_B_2018 <- as_tibble(campus_B_2018)
campus_C_2018 <- as_tibble(campus_C_2018)
campus_A_2019 <- as_tibble(campus_A_2019)
campus_B_2019 <- as_tibble(campus_B_2019)
campus_C_2019 <- as_tibble(campus_C_2019)

#Nombre filas
rownames(campus_A_2018) <- c(paste("campus_A_2018_Alumno",1:500,sep=""))
rownames(campus_B_2018) <- c(paste("campus_B_2018_Alumno",1:500,sep=""))
rownames(campus_C_2018) <- c(paste("campus_C_2018_Alumno",1:500,sep=""))
rownames(campus_A_2019) <- c(paste("campus_A_2019_Alumno",1:500,sep=""))
rownames(campus_B_2019) <- c(paste("campus_B_2019_Alumno",1:500,sep=""))
rownames(campus_C_2019) <- c(paste("campus_C_2019_Alumno",1:500,sep=""))

#Nombre columnas
colnames(campus_A_2018) <- c(paste("Item",1:39,sep=""))
colnames(campus_B_2018) <- c(paste("Item",1:39,sep=""))
colnames(campus_C_2018) <- c(paste("Item",1:39,sep=""))
colnames(campus_A_2019) <- c(paste("Item",1:39,sep=""))
colnames(campus_B_2019) <- c(paste("Item",1:39,sep=""))
colnames(campus_C_2019) <- c(paste("Item",1:39,sep=""))


write.csv(campus_A_2018,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2018.csv')
write.csv(campus_B_2018,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2018.csv')
write.csv(campus_C_2018,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2018.csv')
write.csv(campus_A_2019,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2019.csv')
write.csv(campus_B_2019,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2019.csv')
write.csv(campus_C_2019,'/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2019.csv')



