install.packages("rdbnomics")
library(rdbnomics)
library("ggthemes")

# List all available data providers
providers <- rdb_providers()

# View the first few providers
head(providers)

EU_datasets <- rdb_datasets(query = "EU")

# View the first few datasets
head(EU_datasets)

# Search for trade-related datasets from Eurostat
trade_datasets <- rdb_datasets(query = "Trade", provider_code = "AMECO")

# View the first few datasets related to trade
head(trade_datasets)

# Explore series from a specific dataset
# Here we use Eurostat's international trade dataset as an example
trade_series <- rdb_series(provider_code = "AMECO", dataset_code = "AAGT")

# View the first few series
head(trade_series)

eu_trade <- rdb_datasets(provider_code = "AMECO", dataset_code = "AAGT", 
                       series_code = "EU27.1.0.0.0.AAGT")

head(eu_trade)
??series_code


df <- rdb("AMECO/AAGT/EU27.1.0.0.0.AAGT")
df <- df[!is.na(value)]
df

ggplot(df, aes(x = original_period, y = original_value,fill = value)) +
  geom_bar(stat = "identity")+
  labs(title = "Average share of imports and exports of goods in world trade including intra EU trade", x = "Year", y = "Average Share") +
  theme_few()+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) 
  

df_2 <-rdb("AMECO/AXGT/EU27.1.0.0.0.AXGT")
df_2 <- df_2[!is.na(value)]
df_2

ggplot(df_2, aes(x = original_period, y = original_value,fill = value)) +
  geom_bar(stat="identity")+
  labs(title = "Share of exports of goods in world exports including intra EU exports", x = "Year", y = "Share in world exports",fill = 'value') +
  theme_few() +
  theme(axis.text.x = element_text(angle=90 ,vjust =0.5, hjust =1))

df_3 <-rdb("AMECO/UXGS/EU27.1.0.0.0.UXGS")
df_3 <- df_3[!is.na(value)]
df_3

ggplot(df_3, aes(x = original_period, y= original_value,group = 1)) +
  geom_line() +
  geom_point() +
  labs(title = "Exports of goods and services at current prices (National accounts)", x = "Year", y = "GDP at Current Prices") +
  theme_few() +
  theme(axis.text.x = element_text(angle=90,vjust = 0.5, hjust=1))


df_4 <-rdb("AMECO/UTVT/EU27.1.0.0.0.UTVT")
df_4 <- df_4[!is.na(value)]
df_4

ggplot(df_4, aes(x = original_period, y= original_value,group =1)) +
  geom_line()+
  geom_point() +
  labs(title = "Taxes linked to imports and production: total economy", x = "Year", y = "Taxes:Total Economy") +
  theme_few()+
  theme(axis.text.x = element_text(angle=90,vjust=0.5, hjust=1))

df_5 <-rdb("AMECO/UTVN/EU27.1.0.0.0.UTVN")
df_5 <- df_5[!is.na(value)]
df_5

ggplot(df_5, aes(x = original_period, y= original_value,group =1)) +
  geom_line()+
  geom_point() +
  labs(title = "Taxes linked to imports and production minus subsidies: total economy", x = "Year", y = "Taxes:Total economy") +
  theme_few() +
  theme(axis.text.x = element_text(angle=90,vjust=0.5, hjust=1))


df_6 <-rdb("AMECO/UBSN/EU27.1.0.0.0.UBSN")
df_6 <- df_6[!is.na(value)]
df_6

ggplot(df_6, aes(x = original_period, y= original_value)) +
  geom_point() +
  labs(title = "Net exports of services at current prices (National accounts)", x = "Year", y = "GDP in Current USD") +
  theme_gray()

df_7 <-rdb("AMECO/PXGSQ-4/EU27.1.0.0.0.PXGSQ-4")
df_7 <- df_7[!is.na(value)]
df_7

ggplot(df_7, aes(x = original_period, y= original_value)) +
  geom_point() +
  labs(title = "Net exports of services at current prices (National accounts)", x = "Year", y = "GDP in Current USD") +
  theme_gray()

