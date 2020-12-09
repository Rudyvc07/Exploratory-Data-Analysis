## Cargar datos
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Datos de NEI correspondientes al Vehiculo

vehiculos<-grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)

vehiculos_SCC<-SCC[vehiculos,]$SCC

vehiculos_NEI<-NEI[ NEI$SCC %in% vehiculos_SCC,] 

## cruzar los datos de los vehiculos con fip de baltimore y agregar el nombre de la Ciudad

baltimore_vehiculos_INEI<-vehiculos_NEI[ vehiculos_NEI$fips == "24510",]

baltimore_vehiculos_INEI$city<-"Ciudad de Baltimore"

vehiculos_LANEI<-vehiculos_NEI[ vehiculos_NEI$fips=="06037",]
vehiculos_LANEI$city<-"los Angeles"

## combinar los subconjutos con el monre de la ciudad

bothNEI<-rbind(baltimore_vehiculos_INEI,vehiculos_LANEI)

png(filename = "plot6.png",width=480,height=480,units="px",bg="white")

h<-ggplot(bothNEI,aes(x=factor(year),y=Emissions,fill=city))+geom_bar(aes(fill=year),stat = "identity")+
  facet_grid(scales = "free",space = "free",.~city)+guides(fill=FALSE)+theme_bw()+
  labs(x="year",y=expression("Total PM"[2.5]*"Emisiones (KG vs Tons)"))+
  labs(title = expression("PM"[2.5]*"Emisiones de origen de vehículos de motor en Baltimore y Los Ángeles, 1999-2008"))

print(h)

dev.off()
