url = 'http://ichart.finance.yahoo.com/table.csv?s=YHOO&d=8&e=28&f=2012&g=d&a=3&b=12&c=1996&ignore=.csv'

data = read.csv(url)

g = ggplot(data) + geom_point(aes(x=as.Date(Date), y=Close), size = 1) 
g = g + scale_y_log10() + theme_bw()
print(g)
