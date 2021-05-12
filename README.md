# AdministracionTP

## Objetivo
El objetivo de este examen es realizar un análisis exploratorio de un conjunto de datos, creando visualizaciones, preparando los datos y obteniendo inferencias básicas utilizando R/RStudio como herramienta de software.

## Participantes
- Natalia Maury Castañeda (u201816996)
- Oscar Flores Palermo (u201716498)
- Carlos Iparraguirre Marujo (u201810601)

## Descripción Dataset
El dataset a analizar es el de Hotel Booking Demanad, la versión original es de kaggle.com pero se ha modificado para agregar ruido en los datos. No obstante, el origen de los datos es el mismo y tiene los mismos creadores. El dataset contiene la información de reserva de hoteles, ya sean en una ciudad o un resort, que hacen los clientes. Incluye los detalles de cuándo se hizo la reserva, por cuánto tiempo se quedó, cantidad de personas que reservaron y el tipo de persona (adulto, niño, bebé, etc.), etc. El Dataset fue creado por Nuno Antonio, Ana Almeida, y Luís Nunes. Lo publicaron en el artículo “Hotel Booking Demand Dataset” para Data in Brief, perteneciendo al volumen 22 de esta página en el 2019 (Mostipak; 2020). 

Para más información del dataset ver el pdf: 

## Conclusiones
A partir de las conclusiones, se pueden obtener diversas conclusiones. La primera es que los estacionamientos no es importante contar con espacios de estacionamiento para el Resort Hotel. La tabla A muestra que 34570 no requieren estacionamiento y sólo 5490 requieren un estacionamiento. Por lo que la gran mayoría de clientes no requiere un estacionamiento, no es importante para la reserva. En el caso del City Hotel, tampoco es importante contar con espacios de estacionamiento. Según la tabla A, 77404 no requieren un estacionamiento y sólo 1926 huéspedes requieren mínimo 1 estacionamiento. Debido a que la gran mayoría no requiere un estacionamiento, se puede concluir que no son importantes para los huéspedes, por lo que no es un requisito para el hotel.

La segunda conclusión es que los huéspedes prefieren el Resort Hotel. Esto se infiere ya que el 72.2% no son canceladas versus el City Hotel que tiene un 58.3% de reservas no canceladas. Como se pueden ver en los gráficos de barras y de pie, el Resort Hotel tiene más reservas que no se cancelan. Otro elemento por el cual se concluyó que los clientes prefieren el Resort Hotel son el los días en la lista de espera. Para ello se hizo una tabla con la frecuencia porcentual de cada día en el que se está en la lista de espera en ambos hoteles. Con esa tabla se pudo determinar que se pasan menos días en la lista de espera del Resort Hotel (0.33%) que en el del City Hotel (0.66%) que puede ser un factor para que los clientes prefieran al Resort Hotel.

La tercera conclusión consiste en que la demanda de hoteles sí ha estado en aumento en los últimos tres años examinados por el data frame, teniendo un auge en el 2016. En cuanto a los resultados mensuales, es un poco más variado, pero hay más aumentos que disminuciones en cuanto a la cantidad de huéspedes, por lo que se puede decir que también hay un aumento general de la demanda.

La cuarta conclusión es que la mayoría de los meses tienen una temporada de reserva media, siendo muy balanceadas las reservas entre cada mes. Las excepciones notables son Noviembre y Diciembre con temporadas bajas y Enero, Julio, Agosto y Octubre, con temporadas altas.

La quinta conclusión es que los meses con mayor cantidad de reservas canceladas son Enero, Julio, Febrero y Octubre. De estos, tres de los cuatro meses también son meses con temporadas altas de reservas, por lo que se puede concluir que mientras más personas reserven en el hotel, es más probable que haya más reservas canceladas.

En la sexta conclusión, las personas usualmente prefieren realizar sus reservas de hotel sin niños y/o bebes. Ya que prefieren salir solos o con otros adultos para no tener preocupaciones mientras que están fuera del hotel.

## Licencia
La licencia utilizada es la del MIT

## Bibliografía
Almeida. A, Antonio. N, Nunes. L (2019). Hotel booking demand datasets. Recuperado de https://www.sciencedirect.com/science/article/pii/S2352340918315191 [Consultado el 2 de mayo del 2021.]

Elsevier B.V, ScienceDirect (S/F). Data in Brief. Recuperado de https://www.sciencedirect.com/journal/data-in-brief [Consultado el 2 de mayo del 2021].

Mostipak. J (2020). Hotel booking demand, From the paper: hotel booking demand datasets. Recuperado de https://www.kaggle.com/jessemostipak/hotel-booking-demand?select=hotel_bookings.csv [Consultado el 2 de mayo del 2021].

ResearchGate (S/F). Ana Maria De Almeida. Recuperado de https://www.researchgate.net/profile/Ana-De-Almeida-6 [Consultado el 2 de mayo del 2021].

ResearchGate (S/F). Nuno Antonio. Recuperado de https://www.researchgate.net/profile/Nuno-Antonio [Consultado el 2 de mayo del 2021].

ResearchGate (S/F). Luís Nunes. Recuperado de https://www.researchgate.net/profile/Luis-Nunes-16 [Consultado el 2 de mayo del 2021].
