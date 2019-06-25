#Instalar paquetes
install.packages('TAM')
install.packages('tidyverse')

#Cargar librería
library(TAM)
library(tidyverse)


#Cargar los archivos de evaluaciones de los Campus A,B y C
#Para los diferentes ciclos 2017-2018 (2018) y 2018-2019 (2019)
campus_A_2018 <- read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2018.csv",row.names=1)
campus_B_2018 <- read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2018.csv",row.names=1)
campus_C_2018 <- read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2018.csv",row.names=1)
campus_A_2019 <- read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2019.csv",row.names=1)
campus_B_2019 <- read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2019.csv",row.names=1)
campus_C_2019 <- read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2019.csv",row.names=1)

#Nombre de los alumnos por campus
alumnos_campus_A_2018 <- as_tibble(read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2018.csv",sep="")[,1]) %>% rename(alumnos=value)
alumnos_campus_B_2018 <- as_tibble(read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2018.csv",sep="")[,1]) %>% rename(alumnos=value)
alumnos_campus_C_2018 <- as_tibble(read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2018.csv",sep="")[,1]) %>% rename(alumnos=value)
alumnos_campus_A_2019 <- as_tibble(read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_A_2019.csv",sep="")[,1]) %>% rename(alumnos=value)
alumnos_campus_B_2019 <- as_tibble(read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_B_2019.csv",sep="")[,1]) %>% rename(alumnos=value)
alumnos_campus_C_2019 <- as_tibble(read.csv("/home/wilantgomari/Dropbox/Trabajos/Git/knotion/Modelo de Rasch/prueba1/results/campus_C_2019.csv",sep="")[,1]) %>% rename(alumnos=value)



#Unir las evaluaciones del 2018 y 2019 
datos2018 <- rbind(campus_A_2018,campus_B_2018,campus_C_2018)
datos2019 <- rbind(campus_A_2019,campus_B_2019,campus_C_2019)


#Aplicar modelo de Rasch para dos parámetros en las evaluaciones de 2018 y 2019
rasch2018 <- TAM::tam.mml.2pl(datos2018,irtmodel="2PL")
rasch2019 <- TAM::tam.mml.2pl(datos2019,irtmodel="2PL")

#Selecionar las variables AXsi_.Cat1 y B.Cat1.Dim1 que son las variables 
#de dificultad y descriminación del item respectivamente, y las renombramos
item2018 <- rasch2018$item %>% select(AXsi_.Cat1, B.Cat1.Dim1)%>% rename(Dificultad=AXsi_.Cat1, Discriminación=B.Cat1.Dim1)
item2019 <- rasch2019$item %>% select(AXsi_.Cat1, B.Cat1.Dim1)%>% rename(Dificultad=AXsi_.Cat1, Discriminación=B.Cat1.Dim1)


#Habilidad de los estudiantes para el 2018 y 2019 
#Utilizar la funcion tam.wle() (ver documentación del package TAM)
habilidad2018 <- tam.wle(rasch2018)
habilidad2019 <- tam.wle(rasch2019)

n1<-nrow(campus_A_2018)
n2<-n1+nrow(campus_B_2018)
n3<-n2+nrow(campus_C_2018)

m1<-nrow(campus_A_2019)
m2<-m1+nrow(campus_B_2019)
m3<-m2+nrow(campus_C_2019)


#Rankin de los alumnos por campus 


#ciclo 2018
habilidad_campus_A_2018 <- habilidad2018 %>% select(theta)%>% rename(habilidad=theta) %>% slice(1:n1)
habilidad_campus_B_2018 <- habilidad2018 %>% select(theta)%>% rename(habilidad=theta) %>% slice((n1+1):n2)                                                                                                                                            
habilidad_campus_C_2018 <- habilidad2018 %>% select(theta)%>% rename(habilidad=theta) %>% slice((n2+1):n3)                                                                                                                                            

#Rankin de los alumnos 2018
alumnos_campus_A_2018$habilidad <- habilidad_campus_A_2018[[1]]
alumnos_campus_B_2018$habilidad <- habilidad_campus_B_2018[[1]]
alumnos_campus_C_2018$habilidad <- habilidad_campus_C_2018[[1]]

order_alumnos_campus_A_2018 <- arrange(alumnos_campus_A_2018,habilidad)
order_alumnos_campus_B_2018 <- arrange(alumnos_campus_B_2018,habilidad)
order_alumnos_campus_C_2018 <- arrange(alumnos_campus_C_2018,habilidad)



#ciclo 2019
habilidad_campus_A_2019 <- habilidad2019 %>% select(theta)%>% rename(habilidad=theta) %>% slice(1:m1)
habilidad_campus_B_2019 <- habilidad2019 %>% select(theta)%>% rename(habilidad=theta) %>% slice((m1+1):m2)                                                                                                                                            
habilidad_campus_C_2019 <- habilidad2019 %>% select(theta)%>% rename(habilidad=theta) %>% slice((m2+1):m3)     

#Rankin de los alumnos 2019
alumnos_campus_A_2019$habilidad <- habilidad_campus_A_2019[[1]]
alumnos_campus_B_2019$habilidad <- habilidad_campus_B_2019[[1]]
alumnos_campus_C_2019$habilidad <- habilidad_campus_C_2019[[1]]

order_alumnos_campus_A_2019 <- arrange(alumnos_campus_A_2019,habilidad)
order_alumnos_campus_B_2019 <- arrange(alumnos_campus_B_2019,habilidad)
order_alumnos_campus_C_2019 <- arrange(alumnos_campus_C_2019,habilidad)




#Rankin de las escuelas 2018
nivel_campus_A_2018 <- habilidad_campus_A_2018 %>% summarise(mean = mean(habilidad))
nivel_campus_B_2018 <- habilidad_campus_B_2018 %>% summarise(mean = mean(habilidad))
nivel_campus_C_2018 <- habilidad_campus_C_2018 %>% summarise(mean = mean(habilidad))

campus_2018 <- c("campus_A_2018","campus_B_2018","campus_C_2018")
nivel_académico_2018 <- c(nivel_campus_A_2018$mean,nivel_campus_B_2018$mean,nivel_campus_C_2018$mean)
nivel_académico_campus_2018 <- data.frame(campus_2018,nivel_académico_2018)
order_nivel_académico_campus_2018 <- arrange(nivel_académico_campus_2018,nivel_académico_2018)

#Rankin de las escuelas 2019
nivel_campus_A_2019 <- habilidad_campus_A_2019 %>% summarise(mean = mean(habilidad))
nivel_campus_B_2019 <- habilidad_campus_B_2019 %>% summarise(mean = mean(habilidad))
nivel_campus_C_2019 <- habilidad_campus_C_2019 %>% summarise(mean = mean(habilidad))

campus_2019 <- c("campus_A_2019","campus_B_2019","campus_C_2019")
nivel_académico_2019 <- c(nivel_campus_A_2019$mean,nivel_campus_B_2019$mean,nivel_campus_C_2019$mean)
nivel_académico_campus_2019 <- data.frame(campus_2019,nivel_académico_2019)
order_nivel_académico_campus_2019 <- arrange(nivel_académico_campus_2019,nivel_académico_2019)







