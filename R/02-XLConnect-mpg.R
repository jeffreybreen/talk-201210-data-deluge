
# binary package isn't available on CRAN for Mac OS X (monstrous!), but this works:
# install.packages("XLConnect", type="source")

library(XLConnect)

wb <- loadWorkbook("data/mpg.xlsx", create=F)

data = readWorksheet(wb, sheet='3-7-2012')

str(data)


library(ggplot2)
g = ggplot(subset(data, Eng.Displ > 0), aes(x=Eng.Displ, y=Comb.Unrd.Adj.FE...Conventional.Fuel, color=Air.Aspiration.Method.Desc))
g = g + geom_point(alpha=0.75, position='jitter') + theme_bw()
print(g)
