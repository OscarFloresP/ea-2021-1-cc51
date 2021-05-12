library(lessR)
#1. Visualización cantidad de reservas por tipo de hotel
TiempoEspera <- table(DFHotel_Limpio$days_in_waiting_list,DFHotel_Limpio$hotel)
Cancelado <- table(DFHotel_Limpio$hotel, DFHotel_Limpio$is_canceled)

#Gráfico de cancelaciones
CanCity <- Cancelado[1,2] #Reservas canceladas en el City Hotel
CanResort <- Cancelado [2,2] #Reservas canceladas en el Resort Hotel
Can <- c(CanCity, CanResort) #Tabla con las reservas canceladas de ambos hoteles
hoteles <- c("CityHotel", "Resort Hotel")

barplot(Can,
     main = "Reservas canceladas en ambos hoteles",
     xlab = "Tipo de hotel", ylab = "Cantidad reservas canceladas",
     col = c("lightcoral", "hotpink"))

legend("topright", legend = hoteles,
       fill =  c("lightcoral", "hotpink"))

#Gráfico días en la lista de espera
f_porc <- round((prop.table(TiempoEspera)*100),2) #Frecuencia porcentual días lista de espera para ambos hoteles
F_Acum_City <-f_porc[1:128, 1] #Frecuencia porcentual días lista de espera City Hotel
F_Acum_Resort <- f_porc[1:128, 2] #Frecuencia porcentual días lista de espera Resort Hotel

barplot(F_Acum_City,
        main = "Frecuencia porcentual de días en la lista de espera City Hotel",
        xlab = "Días en la lista de espera", ylab = "Frecuencia porcentual",
        col = c(100: 228),
        border = c(100:228))

barplot(F_Acum_Resort,
        main = "Frecuencia porcentual de días en la lista de espera Resort Hotel",
        xlab = "Días en la lista de espera", ylab = "Frecuencia porcentual",
        col = c(2:129),
        border = c(2:129))


#2. Visualización Espacios de estacionamiento
A <- table(DFHotel_Limpio$hotel,DFHotel_Limpio$required_car_parking_spaces) #Tabla que contiene los estacionamientos requeridos por tipo de hotel
etiquetas <- c("0 espacios", "1 espacio", "2 espacios", "3 espacios", "8 espacios")

#Estacionamientos requeridos en el City Hotel
EstCity <- sum(A[1,2], A[1,3], A[1,4], A[1,5]) 
City <- c(A[1,1], A[1,2], A[1,3], A[1,4], A[1,5]) #Contiene sólo los estacionamientos del City Hotel

#Estacionamientos requeridos en el Resort Hotel
EstResort <- sum(A[2,2], A[2,3], A[2,4], A[2,5])
Resort <- c(A[2,2], A[2,3], A[2,4], A[2,5]) #Contiene sólo los estacionamientos del City Hotel

EstCity

#Gráfico de estacionamientos con ambos hoteles
pie(table(DFHotel_Limpio$hotel,DFHotel_Limpio$required_car_parking_spaces), 
    main = "Estacionamientos requeridos en ambos hoteles",
    cex = 0.000000000001,
    col = c("deeppink", "orange", "darkturquoise", "yellow", "red"),
    border = c("deeppink", "orange", "darkturquoise", "yellow", "red"))

legend("topleft", legend = etiquetas,
       fill =  c("deeppink", "orange", "darkturquoise", "yellow", "red"))

#Gráfico de estacionamientos del City Hotel
pie(City, 
    main = "Estacionamientos requeridos en el City Hotel",
    cex = 0.000000000001,
    col = c("aquamarine", "deepskyblue", "blue", "forestgreen", "khaki4"),
    border = c("aquamarine", "deepskyblue", "blue", "forestgreen", "khaki4"))

legend("topleft", legend = etiquetas,
       fill =  c("aquamarine", "deepskyblue", "blue", "forestgreen", "khaki4"))

#Gráfico de estacionamientos del Resort Hotel
pie(Resort, 
    main = "Estacionamientos requeridos en el Resort Hotel",
    cex = 0.000000000001,
    col = c("mediumorchid1", "orange", "darkturquoise", "yellow", "red"),
    border = c("mediumorchid1", "orange", "darkturquoise", "yellow", "red"))

legend("topleft", legend = etiquetas,
       fill =  c("mediumorchid1", "orange", "darkturquoise", "yellow", "red"))



