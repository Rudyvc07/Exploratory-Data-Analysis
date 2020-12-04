# Exploratory-Data-Analysis
Proyect 2

# Introduccion: 
El material particulado fino (PM2.5) es un contaminante del aire ambiente para el cual existe una fuerte evidencia de que es dañino para la salud humana. En los Estados Unidos, la Agencia de Protección Ambiental (EPA) tiene la tarea de establecer estándares nacionales de calidad del aire ambiental para las partículas finas y de rastrear las emisiones de este contaminante a la atmósfera. Aproximadamente cada 3 años, la EPA publica su base de datos sobre emisiones de PM2.5. Esta base de datos se conoce como Inventario Nacional de Emisiones (NEI). Puede leer más información sobre el NEI en el sitio web del Inventario Nacional de Emisiones de la EPA.
Para cada año y para cada tipo de fuente de PM, el NEI registra cuántas toneladas de PM2.5 fueron emitidas por esa fuente durante el transcurso de todo el año. Los datos que utilizará para esta asignación son los de 1999, 2002, 2005 y 2008.

# Criterios de Revision: 
1. ¿La trama parece abordar la pregunta que se hace?
2. ¿El código R presentado es apropiado para la construcción de la parcela presentada?

# Data
Los datos para esta tarea están disponibles en el sitio web del curso como un solo archivo zip:
1. Data for Peer Assessment [29Mb]
El archivo zip contiene dos archivos:
- Datos de emisiones de PM2.5 (summarySCC_PM25.rds): Este archivo contiene un marco de datos con todos los datos de emisiones de PM2.5 para 1999, 2002, 2005 y 2008. Para cada año, la tabla contiene el número de toneladas de PM2.5 emitidas por un tipo específico de fuente durante todo el año. . Aquí están las primeras filas.

1. fips: un número de cinco dígitos (representado como una cadena) que indica el condado de EE. UU.
2. SCC: el nombre de la fuente indicado por una cadena de dígitos (consulte la tabla de clasificación del código fuente)
3. ollutante: una cadena que indica el contaminante
4. Emisiones: Cantidad de PM2.5 emitida, en toneladas
5. type: el tipo de fuente (puntual, no puntual, en carretera o fuera de carretera)
6. año: año de las emisiones registradas

Tabla de códigos de clasificación de fuentes (Source_Classification_Code.rds): esta tabla proporciona un mapeo de las cadenas de dígitos SCC en la tabla de emisiones con el nombre real de la fuente de PM2.5. Las fuentes se clasifican de diferentes formas, desde las más generales a las más específicas, y puede optar por explorar las categorías que considere más útiles. Por ejemplo, la fuente "10100101" se conoce como "Ext Comb / Electric Gen / Anthracite Coal / Pulverized Coal".

Puede leer cada uno de los dos archivos usando la función readRDS () en R. Por ejemplo, la lectura de cada archivo se puede hacer con el siguiente código:
## Es probable que esta primera línea tarde unos segundos. ¡Se paciente!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


siempre que cada uno de esos archivos esté en su directorio de trabajo actual (verifique con dir () y vea si esos archivos están en la lista).

## Asignación
El objetivo general de esta tarea es explorar la base de datos del Inventario Nacional de Emisiones y ver lo que dice sobre la contaminación por partículas finas en los Estados Unidos durante el período de 10 años 1999-2008. Puede utilizar cualquier paquete de R que desee para respaldar su análisis.

# Preguntas:
Debe abordar las siguientes preguntas y tareas en su análisis exploratorio. Para cada pregunta / tarea, necesitará hacer un solo diagrama. A menos que se especifique, puede usar cualquier sistema de trazado en R para hacer su trazado.

1. ¿Han disminuido las emisiones totales de PM2.5 en los Estados Unidos de 1999 a 2008? Utilizando el sistema de trazado base, haga un diagrama que muestre la emisión total de PM2.5 de todas las fuentes para cada uno de los años 1999, 2002, 2005 y 2008.
2. ¿Han disminuido las emisiones totales de PM2.5 en la ciudad de Baltimore, Maryland (fips == "24510") de 1999 a 2008? Utilice el sistema de trazado base para hacer un diagrama que responda a esta pregunta.
3. De los cuatro tipos de fuentes indicadas por la variable de tipo (puntuales, no puntuales, en la carretera, fuera de la carretera), ¿cuáles de estas cuatro fuentes han experimentado disminuciones en las emisiones de 1999 a 2008 en la ciudad de Baltimore? ¿Cuáles han visto aumentos en las emisiones entre 1999 y 2008? Utilice el sistema de trazado ggplot2 para hacer que un diagrama responda a esta pregunta.
4. En todo Estados Unidos, ¿cómo han cambiado las emisiones de fuentes relacionadas con la combustión de carbón entre 1999 y 2008?
5. ¿Cómo han cambiado las emisiones de fuentes de vehículos de motor entre 1999 y 2008 en la ciudad de Baltimore?
6. Compare las emisiones de fuentes de vehículos de motor en la ciudad de Baltimore con las emisiones de fuentes de vehículos de motor en el condado de Los Ángeles, California (fips == "06037"). ¿Qué ciudad ha experimentado mayores cambios a lo largo del tiempo en las emisiones de los vehículos de motor?

## Realización y envío de gráficos.
Para cada parcela debes:
1. Construya el gráfico y guárdelo en un archivo PNG.
2. Cree un archivo de código R separado (plot1.R, plot2.R, etc.) que construya la gráfica correspondiente, es decir, el código en plot1.R construye la gráfica plot1.png. Su archivo de código debe incluir código para leer los datos para que la trama se pueda reproducir por completo. También debe incluir el código que crea el archivo PNG. Solo incluya el código para un solo gráfico (es decir, plot1.R solo debe incluir el código para producir plot1.png).
3. Cargue el archivo PNG en la página de envío de tareas.
4. Copie y pegue el código R del archivo R correspondiente en el cuadro de texto en el punto apropiado de la evaluación por pares.

