library(readr)

## Cargar datos
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Agregar emisciones por año
Total_agg<-aggregate(Emissions~year, NEI,sum)

## reescalar las emiciones 
Total_agg$Emissions<-(Total_agg$Emissions)/(10^6)

png(filename = "plot1.png",width=480,height=480,units="px",bg="white")

barplot(Total_agg$Emissions, names.arg = Total_agg$year,
        xlab = "Años", ylab = "PM2.5 Emisiones (10^6 Tons)",
        main = " Emisiones totales de PM2.5 de todas las fuentes de EE.UU. ")

dev.off()

