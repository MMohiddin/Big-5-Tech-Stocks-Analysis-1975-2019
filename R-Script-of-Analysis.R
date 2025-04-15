## Installing and loading the tidyverse packages
install.packages("tidyverse")
library(tidyverse)

##Loading the big 5 stock data (Google, Apple, Microsoft, Facebook, Amazon)
file_path <- file.choose()
stocks_data <- read_csv(file_path)

##Inspecting the data
head(stocks_data)
str(stocks_data)
summary(stocks_data)

# Checking the data for missing values
colSums(is.na(stocks_data))

# Checking for duplicates
duplicated_rows <- stocks_data[duplicated(stocks_data), ]
duplicated_rows

# Naming the date, formatting and checking for inconsistencies
colnames(stocks_data)[1] <- "Date"
library(lubridate)
stocks_data$Date <- dmy(stocks_data$Date)
stocks_data[is.na(stocks_data$Date), ]
head(stocks_data$Date)
unique(stocks_data$Date)

# Renaming remaining columns for easier use
stocks_data <- stocks_data %>%
  rename(
    Open = open,
    High = high,
    Low = low,
    Close = close,
    Volume = volume,
    Ticker = name
  )

# Check the updated column names
colnames(stocks_data)

# Adding a name column
stocks_data <- stocks_data %>%
  mutate(Name = case_when(
    Ticker == "AAPL" ~ "Apple",
    Ticker == "GOOGL" ~ "Google",
    Ticker == "MSFT" ~ "Microsoft",
    Ticker == "FB"   ~ "Facebook",
    Ticker == "AMZN" ~ "Amazon",
    Ticker == "^IXIC" ~ "NASDAQ Composite",
    TRUE ~ "Other"
  ))
head(stocks_data)
# --- Create a 'Year' column for trend analysis ---
stocks_data <- stocks_data %>%
  mutate(Year = year(Date))

# --- Summary statistics by company ---
stocks_data %>%
  group_by(Name) %>%
  summarise(
    First_Date = min(Date),
    Last_Date = max(Date),
    Avg_Close = mean(Close, na.rm = TRUE),
    Max_Close = max(Close, na.rm = TRUE),
    Min_Close = min(Close, na.rm = TRUE),
    Count = n()
  )

# --- Average close per year per company ---
yearly_avg <- stocks_data %>%
  group_by(Name, Year) %>%
  summarise(Avg_Close = mean(Close, na.rm = TRUE)) %>%
  arrange(Name, Year)

# Preview yearly averages
head(yearly_avg)

# --- Visualize closing price over time ---
ggplot(stocks_data, aes(x = Date, y = Close, color = Name)) +
  geom_line() +
  labs(title = "Stock Closing Price Over Time",
       x = "Date", y = "Closing Price (USD)") +
  theme_minimal()

# --- Load zoo package to create 30-day moving average ---
install.packages("zoo")
library(zoo)

# Add 30-day moving average
stocks_data <- stocks_data %>%
  arrange(Name, Date) %>%
  group_by(Name) %>%
  mutate(MA_30 = rollmean(Close, k = 30, fill = NA))

# --- Plot closing price with moving average ---
ggplot(stocks_data, aes(x = Date)) +
  geom_line(aes(y = Close, color = Name), alpha = 0.4) +
  geom_line(aes(y = MA_30, color = Name), size = 1) +
  labs(title = "30-Day Moving Average vs Closing Price",
       x = "Date", y = "Price (USD)") +
  theme_light()

# --- Calculate % Growth from first recorded close price ---
stocks_data <- stocks_data %>%
  group_by(Name) %>%
  arrange(Date) %>%
  mutate(
    First_Close = first(Close),
    Growth_Percent = ((Close - First_Close) / First_Close) * 100
  )

# --- Plot percent growth over time ---
ggplot(stocks_data, aes(x = Date, y = Growth_Percent, color = Name)) +
  geom_line() +
  labs(title = "Stock Price Growth (%) Since First Record",
       x = "Date", y = "Growth (%)") +
  theme_classic()
