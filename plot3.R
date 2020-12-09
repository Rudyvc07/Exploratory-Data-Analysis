## Cargar datos
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subconjunto de datos para fip = Baltimore

BALTIMORE_NEI<- NEI[NEI$fips=="24510",]

## suma por año

Total_Baltimore <- aggregate(Emissions ~ year, BALTIMORE_NEI,sum)

png(filename = "plot3.png",width=480,height=480,units="px",bg="white")

library(ggplot2)

p<-ggplot(BALTIMORE_NEI, aes(factor(year),Emissions,fill=type))+geom_bar(stat = "identity")+
  theme_bw()+guides(fill=FALSE)+facet_grid(.~type,scales = "free",space="free")+
  labs(title = expression("PM"[2.5]*"Emisiones, ciudad de Baltimore 1999-2008 por tipo de fuente"))

print(p)
dev.off()
