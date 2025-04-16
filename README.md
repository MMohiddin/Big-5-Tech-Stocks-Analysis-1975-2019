# Big 5 Tech Stocks Analysis (1975–2019)

**Author**: Mohammed Mohiddin  
**Date**: 2025-04-15  

Welcome to the **Big 5 Tech Stocks Analysis** project. This analysis explores historical stock data for the five largest technology companies (Apple, Google, Microsoft, Facebook, and Amazon) from 1975 to 2019. In this project, we analyse stock price trends, moving averages, and growth patterns to understand the performance and growth trajectories of these tech giants over time.

The data used in this project was obtained from Kaggle. The dataset contains daily stock prices for the five companies from **1975 to 2019**.
View the full [Data Dictionary](data_dictionary.md)

---
## Project Overview

In this analysis, the primary goal is to analyse the historical stock prices of the five major tech companies: **Apple (AAPL)**, **Google (GOOGL)**, **Microsoft (MSFT)**, **Facebook (FB)**, and **Amazon (AMZN)**. We aim to uncover key insights into:

- The **overall performance** of these companies based on stock prices.
- **Growth trajectories** of each company over the years.
- **Price volatility** and long-term trends.

The analysis includes the following key steps:
- **Data Collection**: Acquiring and cleaning stock price data.
- **Exploratory Data Analysis (EDA)**: Summarising the data and checking for patterns.
- **Visualisation**: Displaying the data using various charts and graphs.
- **Conclusions**: Drawing insights from the analysis.

---

---

## Data Cleaning and Preprocessing

Before diving into analysis, the data underwent several preprocessing steps:
1. **Handling Missing Values**: Identifying and handling any missing values (if present).
2. **Removing Duplicates**: Ensuring no duplicate records were included.
3. **Renaming Columns**: To ensure consistency, the column names were standardised (e.g., renaming `open` to `Open`).
4. **Date Conversion**: The `Date` column was converted to the proper date format to allow time-series analysis.
5. **Filtering Data**: We removed irrelevant data such as market index data (`^IXIC`).

The final cleaned dataset was saved as `cleaned_big_5_stocks.csv` and is ready for analysis.

---

## Exploratory Data Analysis (EDA)

### Summary Statistics

The dataset was first analysed to obtain a general overview of the stock prices for each company. The following key statistics were calculated:
- **First Date** and **Last Date**: The earliest and latest data points for each stock.
- **Average Closing Price**: The mean closing price across all records.
- **Max and Min Closing Price**: The highest and lowest closing prices during the period.
- **Total Number of Records**: The number of available data points for each stock.

### Stock Price Distribution

I explored the distribution of stock prices by calculating summary statistics such as mean, median, and standard deviation for each company's closing prices.

---

## Visualisations

### 1. **Average Closing Price per Year**

The following plot visualises the **average closing price per year** for each stock from 1975 to 2019.

![Stocks price over time](https://github.com/user-attachments/assets/6e873e18-b455-4be4-a1df-0d3386c4962a)


### 2. **30-Day Moving Average vs Closing Price**

To better understand the price trends and smooth out short-term fluctuations, a **30-day moving average** was calculated and compared with the actual closing price for each stock.

![30day average](https://github.com/user-attachments/assets/8d37f1f7-bc89-464c-9716-520900d22229)

 **Note on Moving Averages**  
> The 30-day moving average (`MA_30`) column contains `NA` values at the beginning of each company's dataset.  
> This is expected because there isn’t enough historical data to calculate a 30-day average until the 30th data point.  
> These `NA` values were excluded from relevant visualisations and summaries.

### 3. **Stock Price Growth Since First Record**

I calculated the **growth percentage** since the first recorded data point for each stock. This helps to understand the percentage growth of each company's stock from the beginning of the dataset.

![Stock price growth](https://github.com/user-attachments/assets/fcb60a1b-bb9e-4008-85c8-e4e67b827317)


---

## Results and Conclusions

The analysis of the Big 5 Tech stocks reveals several key insights:

- **Apple** and **Amazon** show the most significant growth over time, with stock prices soaring from the early years to the present.
- **Microsoft** and **Facebook** show relatively steady growth with moderate price volatility.
- The **30-day moving average** is effective in smoothing out short-term price fluctuations and provides a clearer view of long-term trends.
- **Volatility** was observed in the years leading up to major product launches and market events (e.g., Apple's iPhone launch, Amazon's major acquisitions).

The data clearly indicates that the **tech sector** has seen impressive growth, with substantial returns for investors over the long term.

---
