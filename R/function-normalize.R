# function-normalize.R
#
# for each column in a data.frame, center around zero and scale min/max 
# to some multiple of the standard deviation
#
# by Jeffrey Breen <jeffrey@jeffreybreen.com>
#

normalize = function(df, sd.scale = 2)
{
	cols = colnames(df)
	
	for (col in cols)
	{
		x = df[,col]
		
		if ( is.numeric(x) )
		{
			# first, compute the mean and subtract from each data point
			x.avg = mean(x)
			x = x - x.avg
			
			# next, scale by the specified number of standard deviations
			x.sd = sd(x)
			x = x / (x.sd * sd.scale)
			
			df[,col] = x
		}		
		
	}
	
	return(df)
}
