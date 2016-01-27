Develop Data Product with Shiny
========================================================
author: Mohd Azahari b. Yaakub
date: 24-Jan-2016

Introduction
========================================================

- This app helps in my job to visualize Data Warehouse Storage Usage daily
- Data is collected on daily basis and aggregated at Year and Month level.
- For simplication, some data cleaning done at SQL level and then save as csv
 

The Main Page
========================================================

- Consist of Title
- Side Bar Panel to handle 2 user inputs ie Year and Month
- Main Panel with 4 Tabs for Bar, Line and Pie Chart Plots and
- 1 displaying the selected dataset
- Link to (this) Documentation


```
'data.frame':	893 obs. of  4 variables:
 $ YEAR : int  2013 2013 2013 2013 2013 2013 2013 2013 2013 2013 ...
 $ MONTH: Factor w/ 12 levels "Apr","Aug","Dec",..: 6 6 2 2 2 2 2 2 2 2 ...
 $ DAY  : int  30 31 1 2 3 4 5 6 7 8 ...
 $ TOTAL: num  68 68.8 69.5 62.9 64 ...
```

The global.R, ui.R and server.R
========================================================

- global.R to read csv file and perform data cleaning
- The ui.R to handle user inputs each for Year and Month.
- Year="All" indicate all years
- Month="All" indicate all month for that year
- Month in ("Jan" till "Dec") indicate daily usage for that month
- geom_hline(yintercept=120) is the max cap of storage exceed SLA
- Using ggplot2 for Bar, Line and Pie

Data Visualization
========================================================

- Show the data being used for the plot
- Demonstrate the reactive output as input changed 

