#3. Pre-Procesamiento de datos

#Identificación de valores NA
ValoresVacios <- is.na(DFHotel_Ruido)
View(ValoresVacios)
summary(ValoresVacios)

#Reemplazo por promedio:
mean.valor <- function(x){
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- round(mean(x.obs))
  return (valorado)
}

mean.df <- function(df, cols){
  nombres <- names(df)
  for (col in cols) {
    nombre <- paste(nombres[col], sep = ".")
    df[nombre] <- mean.valor(df[,col])
  }
  df
}

DFHotel_Limpio <- mean.df(DFHotel_Ruido, c(3,4,6,7,8,9,10,26))
Comprobacion <- is.na(DFHotel_Limpio)
summary(Comprobacion)

#Reemplazo por valor aleatorio:
rand.valor <- function(x){
  faltantes <- is.na(x)
  tot.faltantes <- sum(faltantes)
  x.obs <- x[!faltantes]
  valorado <- x
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace = TRUE)
  return (valorado)
}

random.df <- function(df, cols){
  nombres <- names(df)
  for (col in cols) {
    nombre <- paste(nombres[col], sep = ".")
    df[nombre] <- rand.valor(df[,col])
  }
  df
}

DFHotel_Limpio <- random.df(DFHotel_Limpio, c(11,12))
Comprobacion_Aleatorio <- is.na(DFHotel_Limpio)
summary(Comprobacion_Aleatorio)

#Identificación de valores atípicos
boxplot(DFHotel_Limpio$lead_time, main = "Número de días entre reserva y llegada por cliente")
boxplot(DFHotel_Limpio$lead_time)$out
boxplot(DFHotel_Limpio$stays_in_weekend_nights, main = "Número de noches hospedadas en fin de semana por cliente")
boxplot(DFHotel_Limpio$stays_in_weekend_nights)$out
boxplot(DFHotel_Limpio$stays_in_week_nights, main = "Número de noches hospedadas en dia de semana por cliente")
boxplot(DFHotel_Limpio$stays_in_week_nights)$out
boxplot(DFHotel_Limpio$adr, main = "Tarifa diaria promedio por cliente")
boxplot(DFHotel_Limpio$adr)$out
boxplot(DFHotel_Limpio$total_of_special_requests, main = "Número de solicitudes especiales por cliente")
boxplot(DFHotel_Limpio$total_of_special_requests)$out

#Cambio por promedio y mediana
outliers.med <- function(x, removeNA = TRUE){
  quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNA)
  x[x>quantiles[2]] <- median(x, na.rm = removeNA)
  x
}

boxplot(DFHotel_Limpio$stays_in_week_nights, main = "Número de noches hospedadas en dia de semana por cliente (outliers)")
boxplot(DFHotel_Limpio$stays_in_week_nights)$out
boxplot(outliers.med(DFHotel_Limpio$stays_in_week_nights), main = "Número de noches hospedadas en dia de semana por cliente (limpio)")
boxplot(outliers.med(DFHotel_Limpio$stays_in_week_nights))$out
summary(outliers.med(DFHotel_Limpio$stays_in_week_nights))
DFHotel_Limpio$stays_in_week_nights <- outliers.med(DFHotel_Limpio$stays_in_week_nights)
summary(DFHotel_Limpio$stays_in_week_nights)

boxplot(DFHotel_Limpio$total_of_special_requests, main = "Número de solicitudes especiales por cliente (outliers)")
boxplot(DFHotel_Limpio$total_of_special_requests)$out
boxplot(outliers.med(DFHotel_Limpio$total_of_special_requests), main = "Número de solicitudes especiales por cliente (limpio)")
boxplot(outliers.med(DFHotel_Limpio$total_of_special_requests))$out
summary(outliers.med(DFHotel_Limpio$total_of_special_requests))
DFHotel_Limpio$total_of_special_requests <- outliers.med(DFHotel_Limpio$total_of_special_requests)
summary(DFHotel_Limpio$total_of_special_requests)

#Cambio por enmascarado (capping)
outliers.cap <- function(x, removeNA = TRUE){
  qrts <- quantile(x, probs = c(0.25, 0.75), na.rm = removeNA)
  caps <- quantile(x, probs = c(.05, 0.95), na.rm = removeNA)
  iqr <- qrts[2]-qrts[1]
  altura <- 1.5*iqr
  x[x<qrts[1]-altura] <- caps[1]
  x[x>qrts[2]+altura] <- caps[2]
  x
}

boxplot(DFHotel_Limpio$lead_time, main = "Número de días entre reserva y llegada por cliente (outliers)")
boxplot(DFHotel_Limpio$lead_time)$out
boxplot(outliers.cap(DFHotel_Limpio$lead_time), main = "Número de días entre reserva y llegada por cliente (limpio)")
boxplot(outliers.cap(DFHotel_Limpio$lead_time))$out
summary(outliers.cap(DFHotel_Limpio$lead_time))
DFHotel_Limpio$lead_time <- outliers.cap(DFHotel_Limpio$lead_time)
summary(DFHotel_Limpio$lead_time)

boxplot(DFHotel_Limpio$stays_in_weekend_nights, main = "Número de noches hospedadas en fin de semana por cliente (outliers)")
boxplot(DFHotel_Limpio$stays_in_weekend_nights)$out
boxplot(outliers.cap(DFHotel_Limpio$stays_in_weekend_nights), main = "Número de noches hospedadas en fin de semana por cliente (limpio)")
boxplot(outliers.cap(DFHotel_Limpio$stays_in_weekend_nights))$out
summary(outliers.cap(DFHotel_Limpio$stays_in_weekend_nights))
DFHotel_Limpio$stays_in_weekend_nights <- outliers.cap(DFHotel_Limpio$stays_in_weekend_nights)
summary(DFHotel_Limpio$stays_in_weekend_nights)

boxplot(DFHotel_Limpio$adr, main = "Tarifa diaria promedio por cliente (outliers)")
boxplot(DFHotel_Limpio$adr)$out
boxplot(outliers.cap(DFHotel_Limpio$adr), main = "Tarifa diaria promedio por cliente (limpio)")
boxplot(outliers.cap(DFHotel_Limpio$adr))$out
summary(outliers.cap(DFHotel_Limpio$adr))
DFHotel_Limpio$adr <- outliers.cap(DFHotel_Limpio$adr)
summary(DFHotel_Limpio$adr)

#Ejemplo de muy poca variacion de valores
boxplot(DFHotel_Limpio$required_car_parking_spaces, main = "Estacionamientos requeridos por cliente (outliers)")
boxplot(DFHotel_Limpio$required_car_parking_spaces)$out
boxplot(outliers.med(DFHotel_Limpio$required_car_parking_spaces), main = "Estacionamientos requeridos por cliente (intento de limpieza con metodo 1)")
boxplot(outliers.med(DFHotel_Limpio$required_car_parking_spaces))$out
summary(outliers.med(DFHotel_Limpio$required_car_parking_spaces))
boxplot(outliers.cap(DFHotel_Limpio$required_car_parking_spaces), main = "Estacionamientos requeridos por cliente (intento de limpieza con metodo 2)")
boxplot(outliers.cap(DFHotel_Limpio$required_car_parking_spaces))$out
summary(outliers.cap(DFHotel_Limpio$required_car_parking_spaces))

#Guardado del dataframe preprocesado
save(DFHotel_Limpio, file = "~/R/EA-Admin-Info/Data/DF_Limpio.RData")
