## Cargar datos
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Datos de NEI correspondientes al Vehiculo

vehiculos<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
  
vehiculos_SCC<-SCC[vehiculos,]$SCC
  
vehiculos_NEI<-NEI[ NEI$SCC %in% vehiculos_SCC,] 

## cruzar los datos de los vehiculos con fip de baltimore

baltimore_vehiculos_INEI<-vehiculos_NEI[ vehiculos_NEI$fips == "24510",]

png(filename = "plot5.png",width=480,height=480,units="px",bg="white")

f<-ggplot(baltimore_vehiculos_INEI, aes(factor(year), Emissions))+
  geom_bar(stat = "identity",fill="light blue", width = 0.75)+ theme_bw()+guides(fill=FALSE)+
  labs(x="Años", y=expression("Total PM"[2.5]*" Emisiones (10^5)")) + 
  labs(title=expression(" PM " [ 2.5 ] * " Emisiones de origen de vehículos de motor en Baltimore entre 1999-2008 "))
print(f)

dev.off()
  