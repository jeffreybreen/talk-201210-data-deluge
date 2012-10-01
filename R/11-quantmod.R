library(quantmod)

initial.claims = getSymbols('ICSA', src='FRED', auto.assign=F)

sp500 = getSymbols('^GSPC', src='yahoo', auto.assign=F)

# Convert quotes to weekly and fetch Cl() closing price
sp500.weekly = Cl(to.weekly(sp500))

# prices end on Friday, must bump to Saturday to match BLS release dates
index(sp500.weekly) = index(sp500.weekly) + 1

# set column names:
names(initial.claims) = 'initial.claims'
names(sp500.weekly) = "sp500"

x = merge(initial.claims, sp500.weekly, all=F)
stocks.jobs.df = data.frame(date=index(x), coredata(x))

# create a new, normalized (and scaled) data.frame from the original data

source("R/function-normalize.R")
norm.df = normalize(stocks.jobs.df, sd.scale=1)

# reverse the sense of the initial jobless claims column (since the correlation
# with the S&P is negative)
norm.df$initial.claims = -1 * norm.df$initial.claims

library(ggplot2)
g = ggplot(norm.df) + geom_line(aes(x=date, y=sp500), color='green', size=1, alpha=0.75)
g = g + geom_line(aes(x=date, y=initial.claims), color='red', size=1, alpha=0.75)
g = g + theme_bw() + ylab('sd')

print(g)
