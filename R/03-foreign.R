library(foreign)

sav.file = file.path(system.file(package='foreign'), 'tests', 'sample100.sav')
spss.data = read.spss(sav.file)
View(spss.data)

xpt.file = file.path(system.file(package='foreign'), 'tests', 'test.xpt')
sas.data = read.xport(xpt.file)
str(sas.data)

dta.file = file.path(system.file(package='foreign'), 'tests', 'auto8.dta')
stata.data = read.dta(dta.file)
View(stata.data)

dbf.file = file.path(system.file(package='foreign'), 'files', 'sids.dbf')
dbf.data = read.dbf(dbf.file)
View(dbf.data)
