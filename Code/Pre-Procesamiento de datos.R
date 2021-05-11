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




