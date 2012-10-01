library(WDI)

# find some indicators:
WDIsearch('fertility .*total')
WDIsearch('life expectancy .*birth.*total')
WDIsearch('GDP per capita .*constant')
WDIsearch('population, total')


data = WDI(country=c('BR', 'CN', 'GB', 'JP', 'IN', 'SE', 'US'), 
 			indicator=c('SP.DYN.TFRT.IN', 'SP.DYN.LE00.IN', 'SP.POP.TOTL',
 						'NY.GDP.PCAP.KD'), 
 		  	start=1900, end=2010)

data$year = as.Date(paste(data$year, '-01-01', sep='') )

colnames(data)[3:6] = c('fertility', 'life expectancy', 
						'population', 'per capita GDP')

g = gvisMotionChart(data, idvar='country',  timevar='year')
plot(g)
