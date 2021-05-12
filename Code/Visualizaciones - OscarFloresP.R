#epoca con menor demande de reservas

barplot(table(DFHotel_Limpio$reservation_status_date),
        main = "Estado de la reservacion de los huespedes",
        xlab = "El tiempo en años",ylab ="cantidad de Huespedes")

#la reserva incluyen niños y/o bebes

barplot(table(DFHotel_Limpio$children, DFHotel_Limpio$babies),
        main = "Los huespedes que tienen niños",
        xlab = "La cantidad de niños con que fueron",ylab ="cantidad reserva de los huespedes")



barplot(table(DFHotel_Limpio$children, DFHotel_Limpio$babies),
        main = "Los huespedes que tienen niños y bebes",
        xlab = "La cantidad de niños y/o bebes con que fueron",
        ylab ="cantidad reserva de los huespedes")



barplot(table(DFHotel_Limpio$babies),
        main = "Los huespedes que tienen bebes",
        xlab = "La cantidad de bebes con que fueron",ylab ="cantidad reserva de los huespedes")

