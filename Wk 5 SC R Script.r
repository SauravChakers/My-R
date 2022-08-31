# Install necessary package.
install.packages('tidyverse') 
install.packages('skimr')  
install.packages('DataExplorer')    

# Import the necessary libraries.
library(tidyverse)
library(skimr)
library(DataExplorer)

# 3. Import the data set

# Read the CSV file (travelmode.csv).
travelmode <- read.csv(file.choose(), header=TRUE)

# View the first six lines of the data frame.
head(travelmode)

# View the last six lines of the data frame.
tail(travelmode)

# 4. View the data set

# View the data set in a new window in RStudio as an Excel-style sheet.
View(travelmode)

# View the dimensions of the data set i.e. the number of rows and columns.
dim(travelmode)

# View the titles or names of the columns in the data set.
# There are two functions to return column names.
colnames(travelmode)
names(travelmode)

# Determine the structure of the data set.
# You can use three different functions.
str(travelmode)
glimpse(travelmode)
as_tibble(travelmode)

# 5. Explore the data set.

# To search for missing values in a data set.
travelmode[is.na(travelmode)]

# To search for missing values in a specific column of a data set.
is.na(travelmode$size)

# To search for missing values in a data set.
sum(is.na(travelmode))

# To search for missing values in a specific column of a data set.
sum(is.na(travelmode$size))

# 6. Descriptive Statistics
# These functions provide summary statistics of the data set.
summary(travelmode)
skim(travelmode)

# This function creates a downloadable HTML file containing summary stats of
# the data set.
DataExplorer::create_report(travelmode)

# 5.1.2 Data manipulation in R
# Delete columns X and gender
travelmode <- subset(travelmode, select=-c(X, gender))

# View the column names
names(travelmode)

# Change the names of the columns
travelmode <- travelmode %>%
  rename(waiting_time=wait, 
         vehicle_cost=vcost, 
         travel_time=travel, 
         general_cost=gcost, 
         family_size=size)

# View the results
head(travelmode)

# 3. Explore the given tasks

# 3a) Calculate the total costs for car clients only, 
#      and add these values to the initial data set

# Find total costs for car clients only in the data frame.
car_costs <- subset(travelmode, mode=='car')

# Add a column with total costs.
car_costs <- car_costs %>%
  mutate(total_cost = vehicle_cost + general_cost) 

# View the result.
head(car_costs)


# Add total_cost column to the travelmode data frame.
joined_travelmode <- left_join(travelmode, car_costs)

# View the result.
head(joined_travelmode)

# Confirm number of rows.
dim(joined_travelmode)

################

# 3b) Create data frames for each travel mode for members with families

# Subset using the filter() and select() functions from the dplyr package.
# Travelling by air.
# Create new a data frame as travelmode_air.
air_family <- select(filter(travelmode, mode=='air',
                            family_size>='2'), 
                     c(individual, choice:family_size))

# View the result.
head(air_family)


# Travelling by train.
train_family <- select(filter(travelmode, mode=='train',
                              family_size>='2'), 
                       c(individual, choice:family_size))

# View the result.
head(train_family)


# Travelling by bus.
bus_family <- select(filter(travelmode, mode=='bus',
                            family_size>='2'),
                     individual, choice:family_size)

# View the result.
head(bus_family)


# Travelling by car.
car_family <- select(filter(travelmode, mode=='car',
                            family_size>='2'), 
                     individual, choice:family_size)

# View the result.
head(car_family)

################

# 3c) Find the preferred travel mode for families

# Find preferred modes of travel.
air_family %>% 
  count(choice)

train_family %>% 
  count(choice)

bus_family %>% 
  count(choice)

car_family %>% 
  count(choice)


################

# 3d) Calculate the average vehicle cost and general costs for members with
#     families

# Average vehicle cost and general for family's in cars, trains, and buses.
# For cars:
mean_car_costs <- summarise(car_family, mean_VC=mean(vehicle_cost),
                            mean_GC = mean(general_cost))

# View the result.
mean_car_costs


# For bus:
mean_bus_costs <- summarise(bus_family, mean_VC=mean(vehicle_cost),
                            mean_GC = mean(general_cost))

# View the result.
mean_bus_costs


# For train:
mean_train_costs <- summarise(train_family, mean_VC=mean(vehicle_cost),
                              mean_GC = mean(general_cost))

# View the result.
mean_train_costs


################

# 3e) Create a data frame that contains this data for land-based travel modes, 
#      arranged by mean general costs

# Create a data frame to hold these values.
mean_land_costs <- rbind(mean_car_costs, mean_bus_costs,
                         mean_train_costs)

# View the result.
mean_land_costs


# Add a column containing the vehicle type.
vehicle <- c('car', 'bus', 'train')
mean_costs <- cbind(vehicle, mean_land_costs)

# View the result.
mean_costs


# Set in descending order from the highest mean general cost down.
arrange(mean_land_costs, desc(mean_GC))

## 5.1.3 Aggregate Functions
# Import built-in data set based on the CO2 uptake in grasses.
# This is built in data within R Studio
# Because it is a built-in data set, you don't have to import tidyverse.
data('CO2') 

# View the data set. Note the capital V.
View(CO2)

# Dimensions of the data set. 
dim(CO2)

# Determine mean of C02 
# Specify the function as aggregate(), the numeric variable (uptake),
# the grouping variable (conc), the data source (as C02),
# and the mean.
aggregate(uptake~conc, CO2, mean)
aggregate(uptake~conc, CO2, sum)
aggregate(uptake~conc, CO2, sd)

# Determine the mean CO2 uptake across multiple subsets
# Specify the function as aggregate(),  the numeric variable (uptake),
# the grouping variable (conc), the additional grouping variable (treatment),
# the data source, and the mean.

aggregate(uptake~conc+Treatment, CO2, mean)
aggregate(uptake~conc+Treatment, CO2, sum)
aggregate(uptake~conc+Treatment, CO2, sd)

###############################################################################


# Learning Apply Functions in R
# Used to perform repetitive tasks
# Trying out in list first
# Assign a new list and insert values.
sales.number <- list(t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                     t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                     t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                     t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                     t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# View the new list.
sales.number 

# Confirm list creation.
class(sales.number) 

# Interrogate the list
# Specify the data list, the function (mean), 
# and determine the object class.

lapply(sales.number, mean) 

# Now in DataFrame
# Create new DataFrame
# Assign a new data frame to the object and create a data frame:
computers.df <- data.frame(t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                           t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                           t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                           t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                           t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# Print the new data frame. 
computers.df 

# Check data frame.
class(computers.df) 

# Interrogate the data frame
# Calculate the sd for each store (object as data frame, function as sd).

lapply(computers.df, sd)

# sapply function
# This simplifies the output to the most basic data structure 
# apply function output is in list

### Using a list to sapply function
# Calculate the sd for each store (object as list, function as mean).

sapply(sales.number, mean) 

### Using a data frame to sapply function
# Calculate the sd for each store (object as data frame, function as sd).

sapply(computers.df, sd) 

## Revisit apply function to Matrix
# Create a Matrix
# Name and build the matrix:
sales <- matrix(c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 
                  10, 30, 40, 50, 70, 85, 95, 110, 120, 125,
                  15, 20, 25, 35, 45, 55, 65, 70, 85, 95,
                  12, 20, 28, 35, 49, 60, 71, 80, 95, 105,
                  9, 15, 26, 38, 45, 59, 75, 85, 99, 110),
                nrow=10, byrow=FALSE)

# Specify row names:
rownames(sales) <- c('w1', 'w2', 'w3', 'w4', 'w5',
                     'w6', 'w7', 'w8', 'w9', 'w10')

# Specify the column names.
colnames(sales) <- c('t1', 't2', 't3', 't4', 't5') 

# Print the matrix.
sales 

# Verify the data structure.
class(sales)

## Interrogate the matrix
# What is the highest number of computers sold per week?
# Maximum sales per week across 10 weeks:
# Specify data source, set the margin for rows,
# and add max function.

apply(sales, 1, max)

# What were the mean sales per store?
# Calculate mean per store:
# Specify data source, set the margin for columns,
# and add mean function.

apply(sales, 2, mean)

##############
# Apply function to data frame
# Create the data frame
# Create/build a new data frame and assign it to sales.
sales.df <- data.frame (t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                        t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                        t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                        t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                        t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# Print the data frame.
sales.df  

# Confirm creation of data frame.
class(sales.df)

## Interrogate the data frame.
# Find the mean sales per week:
# Specify the data source, set the margin for rows,
# and add mean function.

apply(sales.df, 1, mean)
# Find the min/max/mean sales per store:
# Specify the data source, set the margin for column,
# and add min/max/mean function.

apply(sales.df, 2, min)
apply(sales.df, 2, max)
apply(sales.df, 2, mean)

######## What else can we do with apply function?
## Other examples
# Exclude columns
# Calculate mean sales for all stores except t2:
# Specify data source, specify excluded column,
# set the margin for columns, and  add mean function.

apply(sales.df[,-2], 2, mean)
# Calculate mean sales for all stores except t2 and w10.

apply(sales.df[-10,-2], 2, mean)

# Change Values
# Assign NA to row and column in sales.df.
sales.df [1, 5] <- NA   

# Print the data frame.
sales.df

# Calculate the mean without the NA:
# Specify the data source, the margin for columns,
# the function (min), and indicate to ignore NA values.

apply(sales.df, 2, min, na.rm=TRUE)


############ 5.1.6. Group by in R
### Preparing the workstation
# We need to import tidyverse of dplyr for the group_by function.
library(dplyr)

# Import built-in data set based on the CO2 uptake in grasses.
data('CO2')

# Dimensions of the data set.
dim(CO2)

# Summarise the data frame (one column)
# Summarise the data frame.
# Group by the whole data frame.
group_by(CO2) %>% summarise(mean_concentration=mean(conc),
                            mean_uptake=mean(uptake))

# Summarise the data frame (more than one column)
# Include the different plant types and treatments.
# Specify the column names for grouping the data.
# The order of the column names is extremely important.
df_CO2 <- CO2 %>% group_by(Plant, Type, Treatment) %>%
  summarise(mean_concentration=mean(conc),
            mean_uptake=mean(uptake),
            .groups='drop')

# View the results.
df_CO2

# Descriptive Stats
# What about standard deviation, variance, mean, max, and min?
# Let's exclude the Type column.
# Include the different plant types and treatments.
df_CO2 <- CO2 %>% group_by(Plant, Treatment) %>%
  summarise(sd_concentration=sd(conc),
            sd_uptake=sd(uptake),
            var_concentration=var(conc),
            var_uptake=var(uptake),
            mean_concentration=mean(conc),
            mean_uptake=mean(uptake),
            min_concentration=min(conc),
            min_uptake=min(uptake),
            max_concentration=max(conc),
            max_uptake=max(uptake),
            .groups='drop')

# View the results.
df_CO2


################################################################################

# 5.1.7. Practical Activity: Data Manipulation in R
##############################################################################

# 1. Import the data 
library(readr)
seatbelt <- read.csv(file.choose(), header=TRUE)

# 2. Explore the data set

# Determine the sum of missing values (data frame and seatbelt column). 
sum(is.na(seatbelt))
sum(is.na(seatbelt$seatbelt))


# Replace NA with 0.
seatbelt[is.na(seatbelt)] = 0


# View the result.
head(seatbelt)
sum(is.na(seatbelt$seatbelt))


# Determine the descriptive statistics.
summary(seatbelt)


# Create a data profile report.
DataExplorer::create_report(seatbelt)

###############################################################################

# 3. Manipulate (data wrangling) the data set

install.packages("dplyr")
library("dplyr")

# Drop unnecessary columns (e.g. column X).
seatbelt_df <- subset(seatbelt, select=-c(1))

# Create a subset of the data frame with only numeric columns.
seatbelt1 <- select_if(seatbelt_df, is.numeric)

# View the result.
head(seatbelt1)


# Round all the columns to 2 decimal places.
seatbelt1 <- round(seatbelt1, 2)

# View the result.
head(seatbelt1)

##############################################################################

# 4. Visualise data set

# visualise data with boxplot to determine normal 
# distribution of separate columns.
boxplot(seatbelt1$miles)
boxplot(seatbelt1$fatalities)
boxplot(seatbelt1$income)
boxplot(seatbelt1$age)
boxplot(seatbelt1$seatbelt)


###############################################################################

# 5. Perform data manipulation

# Calculate the sum of all the columns.
aseatbelt1 <- apply(seatbelt1, 2, sum)
aseatbelt1 <- round(aseatbelt1, 2)

# View the results.
head(aseatbelt1)
# It only make sense to use the sum for columns fatalities and income.


# Calculate the min of all the columns.
sseatbelt1 <- sapply(seatbelt1, min)
sseatbelt1 <- round(sseatbelt1, 2)

# View the results.
sseatbelt1
# We can use all the columns to draw conclusions.


# Calculate the max of all the columns.
bseatbelt1 <- sapply(seatbelt1, max)
bseatbelt1 <- round(bseatbelt1, 2)

# View the results.
bseatbelt1
# We can use all the columns to draw conclusions.

##########################################################################

# Advanced exercise

# Focus on specific variables with select() function.
seatbelt_agg <- select(seatbelt, c('state',
                                   'year',
                                   'miles'))

# View the result.
as_tibble(seatbelt_agg)



# Focus on specific variables with the select() function.
seatbelt_agg2 <- select(seatbelt, c('drinkage',
                                    'year',
                                    'miles'))

# View the result.
as_tibble(seatbelt_agg2)


###########################################################################
## Manipulating Strings
#  Import the library.
library (stringr)

# Create four strings. Use "".
string1 <- "R is a statistical programming language."
string2 <- "I like to code in R."
string3 <- "Coding in R is fun!"
string4 <- "Do you like to code in R?"

# Print the strings:
string1
string2
string3
string4

# Determine string length
# Specify the function and pass the function's argument.
# Counts spaces too

str_length(string1) 
str_length(string2) 
str_length(string3) 
str_length(string4)

# Combine strings
# Specify the function and pass the string objects:
# No spaces between strings by default

str_c(string1, string2, string3, string4) 

# Seperate strings
# Specify the function and pass the string objects, 
# indicate spaces for string separation. 

str_c(string1, string2, string3, string4, sep = ' ')

# Subsetting a string
# Means selecting a few cases from a larger data set.
#  Create and print a string.
string5 <- str_c(string1, string2, string3, string4, sep = ' ') 
string5 

# Determine the length of the string.
str_length(string5) 

# Create a second string by subsetting and print it.
string6 <- str_sub(string5, 1, 81)
string6

# Create a third new string by subsetting and print it.
string7 <- str_sub(string5, 83, 107) 
string7  

# Create a fourth new string by subsetting and print it
string8 <- str_sub(string5, 1, 50)
string8

# Truncating a string
# Truncate a string;
# Specify the source/object and 
# the number of characters to display.

str_trunc(string5, 10)

# Change case of a string
# Change the case of a string:
# All characters lowercase.
str_to_lower (string5) 

# All characters uppercase.
str_to_upper (string5)

# First letter in each word capitalised.
str_to_title (string5)  

#  First letter of each sentence capitalised.
str_to_sentence (string5) 

#############################################################################

####5.1.9 Practical activity: Wrangling raw data in R
# 1. Prepare your workstation

# Import the necessary libraries.
library(tidyverse)
# Create insightful summaries of data set.
library(skimr)
# Create insightful reports of data set.
library(DataExplorer)


# Import the police.csv file.
police <- read.csv(file.choose(), header=T)


# View the data frame.
as_tibble(police)
dim(police)

View(police)

##############################################################################

# 2. Explore the data set

# Determine if there are missing values. 
police[is.na(police)] 
sum(is.na(police))


# Delete all the records with missing values.
police_new <-na.omit(police)

# View the result.
head(police_new)
dim(police_new)
sum(is.na (police_new))


# Determine the descriptive statistics.
summary(police_new)

DataExplorer::create_report(police_new)


##############################################################################

# 3. Data manipulation

# Drop unnecessary columns.
police_df <- select(police_new, -c('X', 'idNum', 'date', 'MDC', 'preRace',
                                   'race', 'lat', 'long', 'policePrecinct',
                                   'citationIssued', 'personSearch', 
                                   'vehicleSearch'))

# View the result.
colnames(police_df)
dim(police_df)


# Rename column names with first letter to uppercase.
names(police_df) <- str_to_title(names(police_df))

# View the result.
colnames(police_df)
View(police_df)


# Determine the unique values in each column
unique(police_df$Problem)

unique(police_df$Gender)

unique(police_df$Neighborhood)

###############################################################################

# 4. Visualise data

# Create barplots.
# How many offences were suspicious compared to traffic?
barplot(table(police_df$Problem),
        main='Police reports',
        xlab='Offense',
        ylab='Count',
        col='red')

# How many offences were gender based?
barplot(table(police_df$Gender),
        main='Police reports',
        xlab='Gender',
        ylab='Count',
        col='blue')

# How do the neighbourhoods compare?
barplot(table(police_df$Neighborhood),
        main='Police reports',
        xlab='Neighbourhood',
        ylab='Count',
        col='green')

###############

# Is the number of occurrences (problems and traffic) gender based?
# Determine the number of occurrences for gender and problems.
table(police_df$Gender)            
table(police_df$Problem)
table(police_df$Neighborhood)

###############

# Determine only females with traffic.
nrow(subset(police_df,
            Gender=='Female' & Problem=='traffic'))

# Determine only males with traffic.
nrow(subset(police_df, Gender=='Male' & Problem=='traffic'))

###############

# What is the total number of occurrences per neighbourhood?
# Determine neighbourhoods with occurrences.
police_df %>% count(Neighborhood, sort=T)

