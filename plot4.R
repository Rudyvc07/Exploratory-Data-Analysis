## Cargar datos
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Datos de la combustion de carbon 


combustion_relat<-grepl("comb",SCC$SCC.Level.One,ignore.case = TRUE)
carbon<-grepl("coal",SCC$SCC.Level.Four, ignore.case = TRUE)
combustion_carbon<-(combustion_relat & carbon)
combustion_SCC<-SCC[combustion_carbon,]$SCC
combustion_NEI<-NEI[ NEI$SCC %in% combustion_SCC,]

png(filename = "plot4.png",width=480,height=480,units="px",bg="white")

g<-ggplot(combustion_NEI,aes(factor(year),Emissions/10^5))+geom_bar( stat="identity",fill="red",width=0.75)+
  theme_bw()+guides(fill=FALSE)+labs(x="year",y=expression("Total PM"[2.5]*"Emisiones (10^6)"))+
  labs(title = expression("PM"[2.5]*"Emisiones por fuentes de combustion de carbon en EE.UU. entre 1999-2008"))

print(g)

dev.off()
