###### Time series modeling

### Installing packages
##TSA
url1 <- "https://cran.r-project.org/src/contrib/Archive/TSA/TSA_1.2.tar.gz"
pkgFile1<- "TSA_1.2.tar.gz"
download.file(url = url1, destfile = pkgFile1)
# Install dependencies
install.packages(c("leaps", "locfit"))
install.packages(pkgs=pkgFile1, type="source", repos=NULL)

## AnalyseTS
url <- "https://cran.r-project.org/src/contrib/Archive/AnalyzeTS/AnalyzeTS_2.3.tar.gz"
pkgFile <- "AnalyzeTS_2.3.tar.gz"
download.file(url = url, destfile = pkgFile)
# Install dependencies
install.packages(c("TTR", "tseries","urca"))
install.packages(pkgs=pkgFile, type="source", repos=NULL)

#### load package
library(AnalyzeTS)

#### load the data - Using R built in data sets
data()  ### check R built in datasets
data("BJsales") ### loading

head(BJsales, 5)  ### checking first 5 rows
?BJsales ### understandig  more about the data types
length(BJsales)


### Transforming to ta time series with freq
guess_period <- function(x) { 
  average_period <- as.double( mean(diff(x)), units="days" )
  difference <- abs(log( average_period / c(
    daily = 1,
    business_days = 7/5,
    weekly = 7,
    monthly = 30,
    quarterly = 365/4,
    annual = 365
  ) ) )
  names( which.min( difference ) )
}

guess_period(BJsales) ### so we have daily data

BJsales.ts=ts(BJsales, start=c(2015,1), frequency=365)

### Plotting the data
par(mfrow=c(1, 1)) 
plot(BJsales.ts)

### Getting fuzzy Parameters

minimal=min(BJsales.ts) 
minimal ### min value
maksimal=max(BJsales.ts)
maksimal ### max value
n=1+3.332*log10(length(BJsales.ts)) ### number of intervals
n 

### Using chen's prediction

chen=Gfuzzy.ts1(BJsales,n=8,type="Chen",plot=TRUE,grid=TRUE)
chen

