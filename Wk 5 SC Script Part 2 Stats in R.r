##############################################################################
### Descriptive Statistics in R
### Descriptive statistics enable organisations to describe their performance
### by synthesising large volumes of data into specific performance indicators.

### Demonstration of Descriptive Statistics in R


### Prep your workstation
# Import the tidyverse package.
library(tidyverse)  

# Create a new object 'speedy 'and import the CSV (restaurant_sitdown.csv) file.
speedy <- read.csv(file.choose(), header=T) 

# View the new object as a 'tibble'.
as_tibble(speedy)

### Find the mean and median
# Call the function to calculate the mean.
mean(speedy$total_minutes) 
# Call the function to calculate the median.
median(speedy$total_minutes)


### Measure the variability in values
# Determine the minimum and maximum value.
min(speedy$total_minutes)  
max(speedy$total_minutes) 

# Range = Max - Min.
max(speedy$total_minutes)- min(speedy$total_minutes) 

# Calculate Q1 and Q3.
quantile(speedy$total_minutes, 0.25)  
quantile(speedy$total_minutes, 0.75)

# Calculate IQR.
IQR(speedy$total_minutes)  

# Determine the variance.
var(speedy$total_minutes)  

# Return the standard deviation.
sd(speedy$total_minutes)


### Determine normality (plot histogram and boxplot)
# Specify histogram function.
hist(speedy$total_minutes)

# Specify boxplot function.
boxplot(speedy$total_minutes)


### Determine normality (qqplots)
# Specify qqnorm function (draw a qqplot).
qqnorm(speedy$total_minutes)

# Specify qqline function.
qqline(speedy$total_minutes) 


### Determine normality (Shapiro-Wilk Test)
# Specify shapiro.test function (Shapiro Wilk Test)
shapiro.test(speedy$total_minutes)
# High p-value (greater than 5%) shows that there is little evidence that 
# total minutes IS NOT normally distributed.


### Determine normality (skewness & kurtosis)
# Install the moments package and load the library.
install.packages('moments') 
library(moments)

# Specify the skewness and kurtosis functions.
skewness(speedy$total_minutes) 
kurtosis(speedy$total_minutes)

# Skewness slightly more than 0 shows that distribution is slightly right skewed
# and biased toeards higher values
# Kurtosis is less than 3. Suggests data is platyikurtic and will produce less
# extreme outliers than normal distribution

###############################################################################
### Demostration of Inferential Stats in R
### Businesses use inferential statistics to test hypotheses and infer 
### population relationships to make calculated predictions and informed risks

### Prep the workstation
# Import the necessary packages.
library (tidyverse) 
library (moments)

# Import and view the data (drive_thru.csv).
drive1 <- read.csv(file.choose(), header=TRUE) 

View(drive1)  
summary(drive1)
dim(drive1)


### Remove unnecessary column
# Assign data to the object and remove the 'number' column.
drive2 <- select(drive1, -n) 

# Round the values to two decimals places.
drive2 <- round(drive1, digits=2)

# Convert the data set into a tibble.
as_tibble (drive2)


### Quick Descriptive Stats
# Call the function to calculate the mean and median.
mean(drive2$total_seconds) 
median(drive2$total_seconds)

# Call the function to calculate the range, standard deviation,
# minimum and maximum.
# Determine the minimum and maximum value.
min(drive2$total_seconds)  
max(drive2$total_seconds) 

# Range = Max - Min.
max(drive2$total_seconds) - min(drive2$total_seconds) 

# Return the standard deviation.
sd(drive2$total_seconds) 


### Check for Normal Distribution
# Specify the qqnorm function.
# Draw a qqplot using the total_seconds data.
qqnorm(drive2$total_seconds,
       col='blue',
       xlab="z Value",
       ylab='Time')

# Specify the qqline function.
# Add a reference line to the qqplot.
qqline(drive2$total_seconds,
       col='red',
       lwd=2) 

# Run a Shapiro-Wilk test:
shapiro.test(drive2$total_seconds)

### Other tests for normality
# Specify the skewness and kurtosis functions.
skewness(drive2$total_seconds) 
kurtosis(drive2$total_seconds)


### Perform a t-test
# Specify the t.test function.
# Set the data source, the confidence interval (95%),
# and the theoretical mean:  

t.test(drive2$total_seconds,
       conf.level=0.95,
       mu=120)
# Run a Shapiro-Wilk test:
shapiro.test(drive2$car_stop)
shapiro.test(drive2$car_go)
shapiro.test(drive2$take_order)
shapiro.test(drive2$hand_over_order)

### Determine correlation
# Specify the cor function.
# Set the first and second variables

cor(drive2$car_stop, drive2$car_go)
cor(drive2$take_order, drive2$hand_over_order)


### Look at correlation
# Determine the correlation for the whole data frame.
round (cor(drive2),
       digits=2)


###############################################################################
### Conduct a Z Test in R
# 1. Prepare your workstation

# Install the BSDA package, which contains the z-test function.
install.packages('BSDA')


# Import the libraries.
library(BSDA)
library (tidyverse)

# 2. One sample z-test

# Create a data set of package weights from the sorting facility.
weight = c(90.1, 90.3, 89.8, 89.2, 89.1, 89.4, 90.2,
           89.9, 88.6, 89.6, 89.7, 88.8, 90.5, 89.5, 89.5)


# Check normal distribution.
qqnorm(weight)
qqline(weight)


# We know that the population mean should be 90.
# Let's assume the standard deviation is 1.2.

# Run the z-test.
z.test(weight, mu=90, sigma.x=1.2)


# Our p-value is greater than 0.05.
# Therefore, not enough evidence to reject the null hypothesis.

###############################################################################

# 3. Two sample z-test

# We'll try a sample from another sorting facility and compare means.

# Null: mu1 - mu2 = 0 
# Alternate: mu1 - mu2  != 0, where != indicates not equal to.

# Create two data sets.
fac1 = c(90.1, 90.3, 89.8, 89.2, 89.1, 89.4, 90.2,
         89.9, 88.6, 89.6, 89.7, 88.8, 90.5, 89.5, 89.5)

fac2 = c(90.1, 91.0, 90.8, 89.1, 90.1, 88.4, 89.2,
         89.9, 89.6, 88.7, 90.1, 88.5, 90.4, 89.0, 89.5)


# We'll check normal distribution from fac2.
qqnorm(fac2)
qqline(fac2)


# Run our test
z.test(fac1, fac2, mu=90, sigma.x = 1.2, sigma.y =1.1)

# Our p-value is greater than 0.05.
# Therefore, we have not enough evidence to reject the null hypothesis.

###############################################################################

### 5.2.3 Practical activity
# 1. Prepare your workstation

# Import the necessary libraries.
library(tidyverse)


# Import the insurance data set (insurance.csv).
health <- read.csv(file.choose(), header=T)

# View the data frame.
head(health)

str(health)

###############################################################################

# 2. Explore the data set

# Determine descriptive statistics of the data set.
summary(health)
summary(health$bmi)


# Measure central tendencies of BMI with mean and median.
mean(health$bmi)
median(health$bmi)


# Statistics of extreme values (max and min).
min (health$bmi)
max (health$bmi)


# Measure the variability of BMI values.
# Range = Maximum - Minimum.
max(health$bmi)- min(health$bmi)  

# Function to calculate Q1.
quantile(health$bmi, 0.25)  

# Function to calculate Q2.
quantile(health$bmi, 0.75)   

# Function to calculate IQR.
IQR(health$bmi)    

# Function to determine the variance.
var(health$bmi)

# Function to return the standard deviation.
sd(health$bmi) 

###############################################################################

# 3. Determine if data is normally distributed

# Measure normality in BMI values.
# Q-Q plot:
qqnorm(health$bmi)
# Add a reference line:
qqline(health$bmi, col='red')


# Shapiro-Wilk test:
shapiro.test((health$bmi))
# Our p-value is well above 0.05, and we can conclude normal distribution.


# Check for skewness.
# First import the moments package and library.
library(moments)

# Now we can check for skewness.
skewness(health$bmi)
# Our output suggests a positive skewness.


#Check for kurtosis.
kurtosis(health$bmi)
# Our kurtosis value is less than 3, suggesting our data is platykurtic.

###############################################################################

# 4. Determine if there are any correlation(s)

# Check correlation between BMI and client age.
# Let's first check for normality in the client age values.
shapiro.test(health$age)
# Our output is greater than 0.5, and we can assume normality.


# Check correlation between BMI and age using Pearson's correlation.
cor(health$bmi, health$age)

# Our correlation coefficient of 0.11 suggests a weak positive correlation.

################################################################################


### ggplot2 in R

library(ggplot2)

wages <- read.csv(file.choose(), header=T)
head(wages)

### Plotting different types of charts
qplot(marital, data=wages)
qplot(wage, data=wages)
qplot(age, wage, data=wages)
ggplot(wages, aes(x=wage)) + geom_histogram(bins = 50)
ggplot(wages, aes(x=wage)) + geom_density()
ggplot(wages, aes(x=age, y=wage)) + geom_point()
ggplot(wages, aes(x=jitter(age), y=wage)) + geom_point()
ggplot(wages, aes(x = age, y=wage)) + geom_point() + geom_smooth(method = lm)
ggplot(wages, aes(x = age, y=wage, col=job_class)) + geom_point() + geom_smooth(se=FALSE)
ggplot(wages, aes(x = age, y=wage, col=job_class)) + geom_smooth()
ggplot(wages, aes(x = marital, fill=education)) + geom_bar()
ggplot(wages, aes(x = marital, fill=education)) + geom_bar(position="dodge")
ggplot(wages, aes(x = marital, fill=education)) + geom_bar(position="dodge") + 
  ggtitle("Customer Education level by marital status")

ggplot(wages, aes(x = age, y=wage, col=job_class)) + geom_point() + geom_smooth(se=FALSE) +
  theme_minimal()

ggplot(wages, aes(x = age, y=wage, col=job_class)) + geom_point() + geom_smooth(lwd=2, se=FALSE) +
  theme_classic()
ggplot(wages, aes(x = age, y=wage, col=education)) + geom_smooth(se=FALSE)

################################################################################

### 5.2.7 Using ggplot2 to visualise data
# 1. Prepare your workstation

# Import the necessary libraries.
library(tidyverse)


# Import the insurance data set (insurance.csv).
health <- read.csv(file.choose(), header=T)

# View the data frame.
head(health)
str(health)
summary(health)

###############################################################################

# 2. Create visualisations

# Create a scatterplot.
ggplot(health,
       mapping=aes(x=age, y=charges)) +
  geom_point()


# Remove outliers (>50,000).
new_health <- filter(health, charges<50000)

# View result.
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point()



# Change colours, adjust size and alpha of points.
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='purple',
             alpha=0.75,
             size=2.5) +
  # Add labels and change axes marks.
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  # Add a title and subtitle.
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") +
  # Facet by sex.
  facet_wrap(~sex)


# Facet by region
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='blue',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") + 
  facet_wrap(~region)



# Facet by children
ggplot(new_health,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='red',
             alpha=0.75,
             size=2.5) +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") + 
  facet_wrap(~children)

##############################################################################
### 5.2.8 Univariate graphs
# Import tidyverse library and load the wage.csv file.
library(tidyverse) 

wages <- read.csv(file.choose(), header=TRUE)

# Create new data set with individuals with wages of less than 300.
new_wages <- filter(wages, wage<300)  

# View the data set.
head(new_wages)

### Plot the distribution
# Set data source and map the aes function to define x:

ggplot(new_wages, aes(x=maritl)) +  
  # Add a geom layer to specify the plot type.
  geom_histogram(stat='count') 

### Add attributes
# Specify the ggplot function.  

ggplot(new_wages, aes(x=maritl)) +
  # Add fill, colour, and a statistic.
  geom_histogram(fill= 'red', color='black', stat='count') + 
  # Add the labs function for labels.
  labs(x="Marital status",
       y="Frequency",
       title="Individuals by marital status") 

################################################################################
### 5.2.9 Bi-variate & Multi-variate Data

# Import tidyverse library.
library(tidyverse)

# Import the wages.csv file. 
wages <- read.csv(file.choose(), header=TRUE)

# Create a new data frame without outliers.
new_wages <- filter(wages, wage<300)

# View the data frame.
head(new_wages)

# Create a stacked barplot
# Specify the ggplot function.
# Set data source, set x-variable, and pass x. 

ggplot(new_wages, aes(x=education, fill=jobclass)) +  
  # Specify the geom_bar function.
  geom_bar()

# Segmented barplot
# Specify the ggplot function.

ggplot(new_wages, aes(x=education, fill=jobclass)) +  
  # Specify the geom_bar function.
  # Add position.
  geom_bar(position='fill') +  
  # Add a label to y.
  labs(y='Proportion') 

# Grouped barplot
# Specify the ggplot function.

ggplot(new_wages, aes(x=education, fill=jobclass)) +  
  # Specify the geom_bar function.
  # Add position.
  geom_bar(position='dodge') +  
  # Change fill colours.
  scale_fill_manual(values=c('blue', 'dark green'))

# Improving the charts by adding title, labels and improving the y axis

# Possible solution.

ggplot(new_wages, aes(x=education, fill=jobclass)) +  
  geom_bar(position='dodge') +  
  scale_fill_manual(values=c('purple', 'yellow')) +
  scale_y_continuous(breaks=seq(0, 350, 50), "Wage in $1000s") +
  labs(title="Number of individuals per educational level",
       x="EDUCATION")

### Boxplot
# Specify the ggplot function.
# Set the data source, set and pass x. 

ggplot(new_wages, aes(x=education, y=wage)) +
  # Specify the geom_boxplot function.
  geom_boxplot()  

# Improving the plot
# Specify the ggplot function.
# Set the data source, set and pass x. 

ggplot(new_wages, aes(x=education, y=wage)) + 
  geom_boxplot(fill='red', notch=TRUE, outlier.color='red') + 
  labs(title="Wages by education level") +  theme_minimal()

### Violinplot
# Specify the ggplot function.
# set data source, pass x and y variables.

ggplot(new_wages, aes(x=education, y=wage)) +
  # Specify the geom_violin function.
  geom_violin()

# Improving the plot
# Specify the ggplot function.
# set data source, pass x and y variables.

ggplot(new_wages, aes(x=education, y=wage)) + geom_violin(fill='red') +  
  geom_boxplot(fill='green', width=.25, outlier.color='green', outlier.size=1, 
               outlier.shape='square')  
### Colouring the violins blue, adding title and changing labels of the axes to
# capital letters

ggplot(new_wages, aes(x=education, y=wage)) + geom_violin(fill='blue') + 
  geom_boxplot(fill='green', width=.25, outlier.color='green', outlier.size=1, 
               outlier.shape='square') + labs(title="Wage by educational level", 
                                              x="EDUCATION", y="WAGE")

### Example of multivariate plot
## Add 'shape=jobclass' (assigns shapes to data points)
## and remove the line of best fit
ggplot(data=new_wages, mapping=aes(x=age, y=wage, colour=education, shape=jobclass)) + 
  geom_point(alpha=1, size=3) + scale_x_continuous(breaks=seq(0, 90, 5), "Age of the Individual") + 
  scale_y_continuous(breaks=seq(0, 350, 50), "Wage in $1000s") + scale_fill_brewer('set2')

###############################################################################

### 5.2.10 Practical activity: Choosing the right graphic

# 1. Prepare your workstation

# Import the necessary libraries.
library(tidyverse)


# Import the insurance data set (insurance.csv).
health <- read.csv(file.choose(), header=T)

# View the data frame.
head(health)
str(health)
summary(health)

###############################################################################

# 2. Create visualisations

# The plots below are suggestions and other plots may work better for you!
# Remember to motivate your choice of visualisation.
# Feel free to play with colours, labels and titles.

# Plot age on a histogram.
ggplot(health, aes(x=age)) + geom_histogram(stat='count', fill='blue')


# Plot children on a histogram.
ggplot(health, aes(x=children)) + geom_histogram(stat='count', fill='red')


# Plot region and sex on a stacked barplot.
ggplot(health, aes(x=region, fill=sex)) + geom_bar()



# Plot smoker and sex on a grouped barplot.
ggplot(health, aes(x=smoker, fill=sex)) + geom_bar(position='dodge')



# Plot BMI and sex on a side-by-side boxplot.
ggplot(health, aes(x=sex, y=bmi)) + geom_boxplot()



# Plot BMI and region on a side-by-side violinplot.
ggplot(health, aes(x=region, y=bmi)) + geom_violin(fill='orange')



# Plot BMI and smoker on a side-by-side boxplot.
ggplot(health, aes(x=smoker, y=bmi)) + geom_boxplot(fill='purple')

###############################################################################

# 3. Select two plots to add colour, titles, and labels.

# We have chosen the BMI vs smoker plot.
ggplot(health, aes(x=smoker, y=bmi)) +
  geom_boxplot(fill='green',
               notch=TRUE,
               outlier.color='blue')

# We have chosen smoker vs sex.
ggplot(health, aes(x=smoker, fill=sex)) +
  geom_bar(position='dodge') +
  scale_fill_manual(values=c('purple', 'orange')) +
  labs(title="Count of male and female smokers")

###############################################################################

# 4. Select two plots and and add a suitable theme

# For a website:
ggplot(health, aes(x=region, y=bmi)) +
  geom_violin() +
  theme_dark()



# For a publication:
ggplot(health, aes(x=region, fill=sex)) + geom_bar() + theme_classic()

