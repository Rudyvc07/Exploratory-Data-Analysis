## Cargar datos
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subconjunto de datos para fip = Baltimore

BALTIMORE_NEI<- NEI[NEI$fips=="24510",]
  
## suma por año

Total_Baltimore <- aggregate(Emissions ~ year, BALTIMORE_NEI,sum)


png(filename = "plot2.png",width=480,height=480,units="px",bg="white")

barplot(Total_Baltimore$Emissions, names.arg = Total_Baltimore$year,
        xlab = "años", ylab = "Emisiones de PM2.5 (toneladas)",
        main = "Emisiones totales de PM2.5 de todas las fuentes de la ciudad de Baltimore")
dev.off()
