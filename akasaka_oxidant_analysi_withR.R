# MacOS Ventura 13.0.1
# R 4.1.3 GUI 1.77 Big Sur ARM build (8051)
# Data (Japanese sites):
# https://catalog.data.metro.tokyo.lg.jp/dataset/t131032d0000000013/resource/c0ebc62b-5c00-49e7-af2b-f2b5521a46f4
# https://catalog.data.metro.tokyo.lg.jp/dataset/t131032d0000000013/resource/72af7e6c-f2f9-4263-bb27-0a54a7efb037
# Downloaded on Nov 17 2022
setwd("/Users/naoyamorishita/Documents/Data")
#set directory
akasaka_2020<-read.csv("akasaka_2020.csv")
akasaka_2019<-read.csv("akasaka_2019.csv")
oxidant_2019=akasaka_2019$オキシダント
oxidant_2020=akasaka_2020$オキシダント
# reading data of oxidant
# "オキシダント" means "oxidant" in Japanese
head(oxidant_2019)
head(oxidant_2020)
# showing 5 lines
suppressWarnings(as.numeric(oxidant_2019))
suppressWarnings(as.numeric(oxidant_2020))
suppressWarnings(oxidant_2020<-as.numeric(oxidant_2020))
suppressWarnings(oxidant_2019<-as.numeric(oxidant_2019))
# preventing warning message
# converting character to numeric values
oxidant_2019<-oxidant_2019[is.na(oxidant_2019)==F]
oxidant_2020<-oxidant_2020[is.na(oxidant_2020)==F]
# removing NA
summary(oxidant_2019)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00   12.00   23.00   23.23   33.00  141.00
summary(oxidant_2020)
# summarize data
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.00   12.00   23.00   24.25   34.00  164.00 
install.packages("e1071")
library(e1071)
skewness(oxidant_2019)
# 0.6683015
kurtosis(oxidant_2019)
# 1.473045
skewness(oxidant_2020)
# 0.9405804
kurtosis(oxidant_2020)
# 2.524676
# -0.5 <= "skewness and kurtosis" <= 0.5
# oxidant_2019 & oxidant_2020 have normalized distribution
t.test(oxidant_2019)
# mean of 95 percent confidence interval: 22.91533 ~ 23.53705
t.test(oxidant_2020)
# mean of 95 percent confidence interval: 23.92414 ~ 24.58189
var.test(oxidant_2019,oxidant_2020)
t.test(oxidant_2019,oxidant_2020)
# t = -4.4478, df = 17124, p-value = 8.731e-06
# Quantity of Oxidant in 2019 and in 2020 are significantly different
