library(XML)

url = 'http://en.wikipedia.org/wiki/List_of_capitals_in_the_United_States'

state.capitals.df = readHTMLTable(url, which=2)

View(state.capitals.df)
