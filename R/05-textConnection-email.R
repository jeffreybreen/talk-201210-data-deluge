con = textConnection('
# Hi:
#
# Please invite these paid volunteers to the spontaneous rally at 3PM today:
#
Name      Department   "Hourly Rate"  email
Alice     Operations     32           alice@wonderland.org
Billy     Logistics       5           billy.pilgrim@slaugterhouse5.com
Winston   Records        20           winston.smith@truth.gov.oc
#
#Thanks,
#Your Boss
#					 
')

data = read.table(con, header=T, comment.char='#')
close.connection(con)

View(data)
