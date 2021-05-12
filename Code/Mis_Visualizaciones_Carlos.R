#2. ¿Está aumentando la demanda con el timepo?
table(DFHotel_Limpio$arrival_date_year)
table(DFHotel_Limpio$arrival_date_month)
barplot(table(DFHotel_Limpio$arrival_date_year), main = "Llegada de huéspedes por año", xlab = "Año", ylab = "Nro de Huéspedes", col = c("green", "purple", "pink"))
barplot(table(DFHotel_Limpio$arrival_date_month), main = "Llegada de huéspedes por mes", xlab = "Mes", ylab = "Nro de Huéspedes", col = "blue")

#3. ¿Cuando se producen las temporadas de reservas: alta, media y baja?
table(DFHotel_Limpio$reservation_status_date)
fecha.reserva <- as.Date(DFHotel_Limpio$reservation_status_date, "%m/%d/%Y")
View(fecha.reserva)
fecha.reserva <- format(fecha.reserva,"%m")
table(fecha.reserva)
barplot(table(fecha.reserva), main = "Reservas mensuales", xlab = "Mes (Orden numérico)", ylab = "Nro de Reservas", col = "gold3")

#7. ¿En qué meses del año se producen más cancelaciones de reservas?
table(DFHotel_Limpio$reservation_status == "Canceled")
solo.cancelado <- DFHotel_Limpio
solo.cancelado$reservation_status[solo.cancelado$reservation_status != "Canceled"] <- NA
solo.cancelado <- na.omit(solo.cancelado)
table(solo.cancelado$reservation_status == "Canceled")
fecha.reserva.cancelado <- as.Date(solo.cancelado$reservation_status_date, "%m/%d/%Y")
View(fecha.reserva.cancelado)
fecha.reserva.cancelado <- format(fecha.reserva.cancelado,"%m")
table(fecha.reserva.cancelado)
barplot(table(fecha.reserva.cancelado), main = "Reservas mensuales canceladas", xlab = "Mes (Orden numérico)", ylab = "Nro de Reservas canceladas", col = "gold2")
