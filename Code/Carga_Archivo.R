#Carga de Datos
DFHotel_Ruido <- read.csv("hotel_bookings_miss.csv", header = TRUE, stringsAsFactors = FALSE)
View(DFHotel_Ruido)
save(DFHotel_Ruido, file = "~/R/EA-Admin-Info/Data/DF_Ruido.RData")
