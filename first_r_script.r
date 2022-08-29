print("Hello World")


# Assign 'a' the numeric value '10' using the 'assigned to' operator,
# Creating an object:
a <- 10

# Print the object
a

number <- 120
fish <- 'goldfish'
distance <- 12.25
shoes <- '4x'
plane <- "Millennium Falcon"

print(number)
print(fish)
print(distance)
print(shoes)
print(plane)

# Check the class of the object ('a' has been assigned the number 10):
class(a) 

# Check the type of object.
typeof(a) 

# Check the length of an object.
length(a)

# Check object attributes.
attributes(a)

# Assign the object name. 
name <- 'Andrew' 

# Specify the typeof() function.
typeof(name) 

# Specify the length() function.
length(name)

# Create a vector and assign it to the object x.
x <- c(1, 2, 3) 

# Determine the attribute of x.
attributes(x)

# Create an object and a vector. 
named.vec <- c('First'=1, 'Second'=2, 'Third'=3) 

# Find the attributes of named.vec.
attributes(named.vec) 

# Create a numeric vector
c(1,2,3,4,5,6,7)

# Create a vector, specify the assign () function and call the c() function
assign('vector1', c(1,2,3,4,5,6,7))

# Print the vector
vector1

numbers <- c(1, 22, 33, 44)
city <- 'London'
sentence <- "How long is this sentence?"
unknown <-'4i+2'

length(numbers)
length(city)
length(sentence)
length(unknown)

# Types of Vectors

# Determine the vector type.
str(1, 5.5, 100) 

# Use the '/' operator to divide zero by zero.
0/0

# Check the vector type of the object 1L.
str(1L) 

# Create the vector and assign it to 'vec'.
vec <- c(FALSE, NA, TRUE, FALSE) 

# Return the elements of the object 'vec'.
vec 

# Create the vector, specify the c() function and pass the characters.
# Assign the vector to object authors:
authors <- c('Andrew', 'Joy')  

# Check the vector type.
str(authors)

# Specify/create a complex vector and assign it to the object 'comp'.
comp <- c(2-4i, 1+3i-2, 55i) 

# Run the typeof() function on the object 'comp' and place it inside 
# the print() function so that the type in the output is returned.
print(typeof(comp)) 

# Recognise the assign operator, where the object x has been assigned the value 10:
x <- 10 

# Assign y the value 5.
y <- 5 

# Add the object x to y.
x + y 

# More complex functions
x + y + 5
typeof(x)
typeof(y)

# Vectors in R: Indexing and coercion
# Indexing a vector
# Assign values to the object 'b'. 
b <- 10:15 

# Print out the value of b.
b 

# Look for the value of index 1. 
b[1]

# Look for the value of index 5.
b[5] 

# Coercion: changing vectors to other types
# Create a vector using the c() function and assign it to the object x: 
x <- c(1, 2, 3, 4, 5)

# Create a vector using the c() function and assign it to the object y: 
y <- c('yes', 'no') 

# Find the types of each vector:
str(x)
str(y)

# Coerce vector x to character.
as.character(x) 

# Coerce vector y to logical.
as.logical(y) 

# Create three vectors.
X1 <- c(TRUE, 'False')
X2 <- c(1.2, 99i)
X3 <- c('One', 1)

# Determine the type of each vector.
typeof(X1)
typeof(X2)
typeof(X3)

# Creating lists in R
# Create an object list_data and a list using the list() function:
list_data  <-  list('Red', 'Green', 'Yellow') 

# Return the objects in the new list.
print(list_data) 

# Manipulating list elements
# Create the list.
# Adding list elements
basket_apples <- list('Red', 'Green', 'Yellow') 

# Add an element 'White' to the 4th index in the list:
basket_apples[4] <- 'White' 

# Print the list.
print(basket_apples)

# Removing list elements
# Assign the 4th element in the index the value NULL.
basket_apples[4] <- NULL 

# Print the list.
print(basket_apples) 

# Replace the 3rd element, Yellow with Pink.
basket_apples[3] <- 'Pink' 

# Print the list.
print(basket_apples) 

# Merging lists
# Create a list with 5, 6, and 7. 
list1  <-  list(5, 6, 7) 

# Create a second list with Thu, Fri, and Sat.
list2  <-  list('Thu', 'Fri', 'Sat') 

# Append the lists together.
merged_list  <-  c(list1, list2) 

# Print the new list.
print(merged_list) 

# Indexing lists
# Create a list named days.week.
days_week  <-  list('Sunday', 'Monday', 'Tuesday', 'Wednesday', 
                    'Thursday', 'Friday', 'Saturday')

# Call the element in the 5th index.
days_week[5] 

# We have already created the list (days_week).
# Call the element in the 3rd index (double brackets).
days_week[[3]] 


# Matrices in R
# Creating a Matrix
# Create a matrix; [2a] specify a sequence of numerals, 
# define the number of rows, and the number of columns.
B <- matrix(1:9, nrow=3, ncol=3) 

# View the matrix.
print(B)

# Matrix B already created.
# Transpose the data in the matrix B.
t(B) 

# Working with a Matrix
# Determine dimensions of matrix B.
dim(B)

# Determine attributes of matrix B.
attributes(B)

# Combining two matrices
# Create matrix A. Matrix B already created.
A = matrix(1:6, nrow = 3, ncol = 2)

# Combine Matrix A & B
cbind(A,B)

# Create matrices C and D.
C = matrix(1:6, nrow = 2, ncol = 3) 
D = matrix(1:9, nrow = 3, ncol = 3) 

# Combine matrices C and D.
rbind(C, D) 

# Extracting elements 
# Create a matrix with the numerals 1-9, 3 rows, 3 columns, and byrow = TRUE.
Z1 <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE)

# Create a matrix with the numerals 1-9, 3 rows and 3 columns.
Z2 <- matrix(1:9, nrow = 3, ncol = 3)

# Print the matrix.
print(Z1) 
print(Z2)

# Extract the element in the 2nd row and 2nd column.
Z1 [2, 2] 

# Extract two columns from Z1, e.g. 1 and 3
# (indicate the 1st and 3rd columns) for extraction.
Z1[, c(1, 3)] 

# Naming Rows & Columns
# Create/specify the rows and columns.
rownames(Z1) <- c('Top', 'Middle', 'Bottom') 
colnames(Z1) <- c('Left', 'Middle', 'Right') 

# Print the matrix Z1.
print(Z1) 

# Worked example: Using R dataframes in context
# Create a list object
# Create a list object containing the numeric values 10, 20, 30, and 40.
a <- c(10, 20, 30, 40) 
b <- c('R_for_Data_Science', 'R_for_Dummies', 
       'The_philosophy_of_R', 'R_in_a_Nutshell')
c <- c(TRUE, FALSE, FALSE, TRUE)
d <- c(11.5, 18, 22.8, 15)

df <- data.frame(a, b, c, d)

df

# Customise the DataFrame
# Change column names
names(df) <- c('ID', 'books', 'loan_status', 'price')

df

# Return Structure of dataFrame
str(df)

# Slice data from DataFrame
# Extract the element in the 1st row of the 2nd column
df[1:2, ]
# First two rows of the first two columns
df[1:2, 1:2]

# Manipulate the dataframe
# Create a new object called age.
age <- c(10, 35, 40, 5) 

# Add The new object to the data frame.
df$age <- age 

# Print the data frame.
df 

# Place the $ operator between the data frame name and the column to extract.
df$ID

# To select a subset of a specific column
subset(df, ID==10)


# 4.1.8 Practical activity: Creating and querying a dataframe
# 2. Create a data frame containing the customer info from the table

# Create a vector/list representing each column.
Name <- c('Donna', 'Anthea', 'Yusuf', 'Bongile', 'Abe', 'Quentin',
          'Tracy', 'Bilal', 'Victoria', 'Indira')

Last_Name <- c('Watusi', 'Smits', 'Zayeed', 'Maleson', 'Dawidowitz',
               'Ng', 'Jacks', 'Ghani', 'LeGrande', 'De Silva')

Gender <- c('F', 'F', 'M', 'F', 'M', 'N', 'F', 'M', 'F', 'F')

Age <- c(38, 29, 44, 24, 66, 34, 55, 40, 38, 29)

Email <- c('donnaw@gotmail.co.uk', 'as@workmail.co.nz', 'yusufzz@glammail.com',
           'bongi1@workmail.co.uk', 'papabe@oldmail.com', 'qng7@mailio.com',
           'tracy@blurredv.co.uk', 'bghani2@mailio.com', 'beachh@glammail.com',
           'indigirl@workmail.com')

Purchases <- c(24, 16, 28, 33, 21, 30, 28, 21, 22, 32)


# Combine vectors into a data frame.
book_df <- data.frame(Name, Last_Name, Gender, Age, Email, Purchases)

# Print data frame.
book_df

# 3. Check the data type of your data frame

# Determine the typeof() of the data frame.
typeof(book_df)

# Determine the class() of the data frame.
class(book_df)

# Check the dimensions of the data frame.
dim(book_df)

###############################################################################

# 4. Change the column names to all caps

# Specify the columns as names and the data frame.
names(book_df) <- c('NAME', 'LAST NAME', 'GENDER', 'AGE',
                    'EMAIL', 'PURCHASES')

# Print the data frame.
book_df

###############################################################################

# 5. Add a column to the data frame containing the customer IDs

# Here an operator was used to create a sequence of numbers. 
ID <- c(2101:2110) 

# add the new column to the current data frame.
book_df$ID <- ID

# Print data frame.
book_df

# Return the structure of the data frame.
str(book_df)

###############################################################################

# 6. Subset the data frame

# Extract only female customers.
subset(book_df, Gender=='F')

# Extract all customers over the age of 50.
subset(book_df, AGE>50)

# Extract all customers with less than 20 purchases in 2021.
subset(book_df, PURCHASES<20)

# Importing data into R
# Determine the working directory.
getwd()

# 2. Import the data set


# Install the tidyverse library.
install.packages('tidyverse')


# Import the tidyverse library.
library(tidyverse)


# Import a CSV file.
data <- read.csv(file.choose(), header=T)

# Print the data frame.
data
View(data)


# Sense-check the data set
# Return the structure of the data frame.
str(data)

# Check the type of the data frame.
typeof(data)

# Check the class of the data frame.
class(data)

# Check the dimensions of the data frame
dim(data)


###############################################################################

# 3. Export the data set

# Export the data as a CSV file.
write.csv(data, file='file_name.csv')

###############################################################################

# 4.2.5
# Import the dataset.
# Import tidyverse library.
library(tidyverse) 

# Import the data set (wages.csv).
wages <- read.csv(file.choose(), header=TRUE) 

# Print/return the data frame.
wages 

# View the data frame.
View(wages) 

# Summarise the data
summary(wages)

# Create a scatterplot
# Specify X as age, y as wage, and wages as the data source 
# (the x-axis variable is passed first, followed by the y-axis,
#  and then the source of the data is specified).
qplot(age, wage, data=wages)

# Create a histogram with an x variable
# First pass the x-variable, then specify the data source. 
qplot(age, data=wages)

# Adjust histogram bins
# Pass the x-variable, set the number of bins, and pass the data source. 
qplot(age, bins=5, data=wages)

# Create a scatterplot with a y-variable
# Assign wage to the y variable, followed by the data source.
qplot(y=wage, data=wages)

# 4.2.6
# Import tidyverse library.
library(tidyverse) 

# Import the data set (wages.csv).
wages <- read.csv(file.choose(), header=TRUE) 

# Print/return the data frame.
wages 

# Plot Bargraphs
# Plot a bar chart by passing the x-variable and data source, then set the geom type:
qplot(age, data=wages, geom='bar')

# Stacked bar chart
qplot(age, fill=education, data=wages, geom='bar')

# Boxplot
qplot(wage, race, data=wages, geom='boxplot')

# Changing aesthetics in qplot
qplot(wage,race, data=wages, colour=I('red'), geom='boxplot')

# Smoothing curve
qplot(age, wage, data=wages, geom=c('point', 'smooth'))

# Mapping education across wage and age
qplot(age, wage, colour=education, data=wages)

# Mapping race and education on wage
qplot(race, education, colour=wage, data=wages)

# Not greate output
# Adding jitter which adds a small amount of variation at the location of each point
# This helps account for discrete variables in a plot.
qplot(race, education, colour=wage, data=wages, geom=c('point', 'jitter'))

# Heatmaps
qplot(race, education, fill=wage, data=wages, geom='raster')

# Facets
# Useful to compare variable
qplot(age, wage, data=wages, facets=education~race)

# Other visualisation tasks

qplot(age, jobclass, colour=education, data=wages)

qplot(age, education, colour=race, data=wages, geom='col')

qplot(education, wage, shape=race, data=wages, geom='boxplot')

# Transforming data in R using dplyr package
install.packages('tidyverse')
library(tidyverse)

# Import the data set (wages.csv).
wages <- read.csv(file.choose(), header=TRUE) 
as.tibble(wages)
glimpse(wages)
summary(wages)
table(wages$sex)
table(wages$region)

# Get rid of 'sex' and 'region' both appear fixed
wages2 <- select(wages, -sex, -region)

# check why 'age' is not numeric
wages4 <- mutate (wages3, ageNum = as.numeric(age))
wages5 <- filter(wages4, !is.na(ageNum))
# Or alternative correcting the value 5o to 50
wages4$ageNum[which(is.na(wages4$ageNum))] <- 50

# convert 'race' to a factor (categorical value)
wages3 <- mutate (wages2, race = as.factor(race))

## Convert cms to inches
wagesCm <- filter(wages4, height > 100)
wagesCm <- mutate(wagesCm, height = round(height/2.54))

# Combine the two data sets

WagesInches <- filter(wages4, height <=100)
WagesClean <- rbind(WagesInches, wagesCm)

# Save the new file
write.csv(WagesClean ,"wages_clean.csv")

# Transforming dataset continued
# Filter a column and specify a criteria
filter(WagesClean, age==25, daily_wage>110)

# Order observations (arrange)
# Use the arrange() function and specify the columns to be ordered.
arrange(WagesClean, race, job_class, education)
arrange(WagesClean, desc(age))
arrange(WagesClean, age)

# Adding a new column
# To create a new element by dividing wage by lowage
mutate(WagesClean, new_var=ageNum/daily_wage)
