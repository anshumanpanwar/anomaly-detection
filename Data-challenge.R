library(sqldf)
library(ggplot2)

data.dir<-"D:/Work/Data challenge/"
data.file<-"Fraud_Data.csv"
ip.file<-"IpAddress_to_Country.csv"

#Read both the CSV files into data frames
fraud.data<-read.csv(paste(data.dir,data.file, sep=""), header = TRUE)
ip.data<-read.csv(paste(data.dir,ip.file, sep=""), header = TRUE)

#executing a join query on 2 datasets to extract the country based on ip address. Using sqldf package for the same. (Its a heavy query so takes a bit of time)
query.string<-"select 'fraud.data'.*, 'ip.data'.country from 'fraud.data', 'ip.data' where  'fraud.data'.ip_address>='ip.data'.lower_bound_ip_address and 'fraud.data'.ip_address<='ip.data'.upper_bound_ip_address"
fraud.data2<-sqldf(query.string)

#executing a join query on 2 datasets to extract the country based on ip address. Using sqldf package for the same. (Its a heavy query so takes a bit of time)
query.string<-"select 'fraud.data'.*, 'ip.data'.country from 'fraud.data' left join 'ip.data' on  ('fraud.data'.ip_address>='ip.data'.lower_bound_ip_address and 'fraud.data'.ip_address<='ip.data'.upper_bound_ip_address)"
fraud.data3<-sqldf(query.string)
