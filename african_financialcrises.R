install.packages("ggplot2")
library(ggplot2)


african_economicdata <- read.csv("african_crises.csv")
ALG_ED <- subset(african_economicdata, country == "Algeria")
ggplot(ALG_ED, aes(ALG_ED$year,ALG_ED$exch_usd)) + geom_line() +geom_point() + xlab("Year") + ylab("Exchange Rate in USD") + geom_vline(xintercept = 1968, linetype="dotted", size = 2) + theme_minimal()

#Zimbabwe
ggplot(Z_ED, aes(Z_ED$year,Z_ED$exch_usd)) + geom_line() +geom_point() + xlab("Year") + ylab("Exchange Rate in USD") + geom_vline(xintercept = 1980, linetype="dotted", size = 2) + theme_minimal() + annotate("rect", xmin = 1995, xmax = 2008, ymin = 0, ymax = 400, alpha = .2)
Z_ED2000 <- subset(Z_ED, year > 1999)
ggplot(Z_ED2000, aes(Z_ED2000$year,Z_ED2000$inflation_annual_cpi)) + geom_line() +geom_point() + xlab("Year") + ylab("Exchange Rate in USD") + geom_vline(xintercept = 1980, linetype="dotted", size = 2) + theme_minimal() + annotate("rect", xmin = 1995, xmax = 2008, ymin = 0, ymax = 400, alpha = .2)
Z_ED2001 <- subset(Z_ED, year > 2000)
##2000-2008
Z_ED08 <- subset(Z_ED, year < 2009 & year > 1999)
Z_ED08$log_inf <- log(Z_ED08$inflation_annual_cpi)
##No log scale
ggplot(Z_ED08, aes(Z_ED08$year,Z_ED08$inflation_annual_cpi)) + geom_line() +geom_point() + xlab("Year") + ylab("Inflation") + theme_minimal()+ ggtitle("Zimbabwean Dollar Hyperinflation 2000-2008")
##Log Scale
ggplot(Z_ED08, aes(Z_ED08$year,Z_ED08$inflation_annual_cpi)) + geom_line() +geom_point() + xlab("Year") + ylab("Logarithim of Inflation") + theme_minimal() + scale_y_continuous(trans = "log10") + ggtitle("Zimbabwean Dollar Hyperinflation 2000-2008")
