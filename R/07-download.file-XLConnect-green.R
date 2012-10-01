library(XLConnect)

url = "http://www.fueleconomy.gov/feg/EPAGreenGuide/xls/all_alpha_12.xls"
local.xls.file = 'data/all_alpha_12.xls'

download.file(url, local.xls.file)

wb = loadWorkbook(local.xls.file, create=F)
data = readWorksheet(wb, sheet='all_alpha_12')

View(data)
