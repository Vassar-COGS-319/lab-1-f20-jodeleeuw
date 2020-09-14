# This is an R script. Any line that starts with # is a comment.
# Comments are ignored by R when you run the script..

#### RUNNING CODE ####

# There are a few ways to run this script in RStudio.
# 1) You can run the entire script by pressing Ctrl+Alt+R, or by pressing the Source
#    button in the top right corner of this window.
# 2) You can run a section of the code by selecting it and pressing the Run button,
#    or by pressing Cmd+Enter on a Mac or Ctrl+Enter on a PC. If you do not select any
#    code, then only the line that your cursor is on will be run.
# 3) There are other shortcuts available in the Code menu at the top of the screen.

# Try putting the cursor on the line below and running it by pressing Ctrl+Enter (Cmd+Enter)

2 + 2

# In the console output window below, you should see that R can do math.

#### BASIC MATH ####

# Try adding some code below to subtract (-), multiply (*), and divide (/).

14 - 9

14 * 9

14 / 9

# Now add some code to create exponentials (^), like 2 raised to the 8th power.

2^8

14^9

#### VARIABLES ####

# What if you want to store the result of 2 + 2 and use it later? You need a variable.

result <- 2 + 2

# The line above assigns (<-) the output of 2+2 to the variable 'result'. Run the line,
# and notice that the top right panel of RStudio has changed. It shows you that the
# variable result is currently set to 4.

# Create a variable below called 'message' and assign it the value "Welcome to R!"

message <- "Welcome to R!" # double quotes
message <- 'Welcome to R!' # single quotes - either works

# Now change 'result' to the output of 6 times 7.

result <- 6 * 7

#### INTERLUDE ####

# You've made a lot of changes to this file. Go ahead and create a new commit in
# GitHub Desktop and sync these changes with the GitHub repository.

#### ARRAYS / VECTORS ####

# Arrays are sets of values that have been grouped together in an order.
# In R, you can create an array using the c() function (short for combine).
# Run the line below.

my.array <- c(1,3,5,7,9)

# You can access the value of an element in the array by using it's location
# in the array.
# Note for experienced programmers: The first element in a R array is indexed at
# location 1, not location 0 like most languages.

my.array[2]

# If you wanted to get the value 7 out of the array, how would you do that?

my.array[4]

# You can get more than one element out of an array at a time. Use an array to specify
# the locations that you want to extract.

my.array[c(1,2,3)]
my.array[c(1,5)]

# How would you get just the second and fourth elements?

my.array[c(2,4)]

# To change the value of an element in an array, just assign it a new value like it is
# a variable

my.array[1] <- 10

# There are some shortcuts for creating arrays. The : operator can be used to create
# sequences of integers

sequence <- 1:10

# Or, more generally, there is a function that you can use called seq()

sequence <- seq(from=1, to=10)

# You can look up information about a function by putting a question mark before the
# name of a function, and then running the line.

?seq

# Notice that the bottom right panel of RStudio changed to show you the documentation
# of the function. R documentation can be a little bit hard to read. You can also
# find an endless supply of examples with Google. Stack Overflow is a particularly
# useful site for finding great examples.

# Try generating a sequence below from 0 to 100 in steps of 10. (e.g., 0, 10, 20, ...)
# Read the documentation on seq or search Stack Overflow to figure out what you need to change.

seq(from=0, to=100, by=10) # you can choose to name the arguments or not

seq(0,100,10) # if you don't name them then they must be in the expected order.

# You can use basic mathematical operators with vectors and scalars.
# (A scalar is a vector with a single element, or, in plain English, just a number).

my.array <- c(1,2,3,4)
my.array <- my.array * 2

# Notice that each element of the array was multiplied by 2.

# You can also use basic mathematical operators with vectors and vectors.

array.a <- c(1,2,3,4)
array.b <- c(5,6,7,8)
array.c <- array.a + array.b

# What happens if array.a and array.b have different numbers of elements?
# Test it out below, and then write a short description of what is happening
# in a comment.

array.d <- c(1,2,3,4)
array.e <- c(1,2)

array.d + array.e

# in this case, array.e gets repeated twice

array.f <- c(1,2,3,4)
array.g <- c(1,2,3)

array.f + array.g

# in this case we get a warning, but the first element
# of array.g is used again to match the length of array.f

#### FINDING HELPFUL FUNCTIONS ####

# A common misconception about experienced programmers is that they can sit down
# and write a program from start-to-finish based on the knowledge in their head.
# The truth is that experienced programmers are constantly using external resources
# (the internet) to figure out how to solve problems. A big difference between
# novice and veteran programmers is that veterans know how to search for the
# specific answers that they need.

# If you are a new programmer, one of the best things you can learn is where to
# look for information. I recommend always starting with stackoverflow.com. It
# is a Q&A site used by programmers of all abilities and you can usually find an
# answer to whatever problem you are trying to solve. The hardest thing to learn
# is how to formulate a good search query so that you get the answer you are looking
# for. 

# I want you to practice. Find a function in R that will do each of the following.
# HINT: There is a built-in R function for each of these.

# 1) Take the square root of 16

sqrt(16)

# 2) Create an array that is 10 repetitions of the number 3
#    e.g., (3, 3, 3, 3, 3, 3, 3, 3, 3, 3).

rep(3,10)

# 3) Add all the numbers in the vector below.

add.me <- c(2,4,6,7,8,5,12) # the answer is 44

sum(add.me)

# 4) Generate a random integer between 0 and 100.

sample(0:100, 1)

# (This might be a good moment to commit and push your code!)

#### CONDITIONAL STATEMENTS ####

# Programs often require conditional execution:
# If this thing is true, do this.
# Otherwise, do this.

# In R, this is done with an if statement.

first.number <- 2
second.number <- 4

if(first.number < second.number){
  message <- "The first number is smaller."
} else {
  message <- "The first number is not smaller."
}
print(message)

# Write code that generates a random integer between 1 and 4, and prints "EVEN"
# or "ODD" to indicate if the number is even or odd. (You may want to search for 
# help about how to determine if a number is even or odd in R.)

random.number <- sample(1:4,1)
if(random.number %% 2 == 0){
  print("EVEN")
} else {
  print("ODD")
}

#### EXTERNAL LIBRARIES ####

# As you search the internet for R code, you'll often find that good solutions
# are available in R packages. R packages are code that is not part of the
# default R installation. R has a package management system that make it really
# easy to install packages. One way to install is with install.packages()

install.packages('dplyr')

# You can also use RStudio to install packages. Go to Tools > Install Packages.

# You only need to install a package ONCE per computer, so I recommend running
# the install.packages command in the R console (lower left window of RStudio)
# and not putting it in your script.

# To load a package, use library()

library(dplyr)

# You must load the package once per R session, so it makes sense to include the
# library() command in your script.

#### BASIC PLOTTING ####

# R has a very powerful set of tools for creating plots.
# We will explore these more throughout the semester. For now, let's look
# at a few really basic plots.

# Scatter plot
# You can create a scatter plot by calling plot() with two arrays of numbers.

x <- 1:10
y <- c(1,3,2,5,3,6,8,5,7,9)
plot(x,y)

# Notice that the plot shows up in RStudio's bottom right panel.

# You can change this to a line plot by setting the type option:

plot(x,y,type='l')

#### YOUR OWN FUNCTIONS ####

# To write a function in R, use the function keyword.

add.two <- function(x) { return(x+2) }
add.two(10) # outputs 12

multiply.numbers <- function(x, y) {
  answer <- x * y
  return(answer)
}
multiply.numbers(2,3) # outputs 6

# Notice that you can have different numbers of parameters, and that the output
# of the function is specified in return()

# Write a function that takes two numbers and returns a random integer that is between
# the two numbers (including both end numbers as possibilities).

random.between <- function(lower, upper){
  sample(lower:upper, 1)
}

random.between(4, 10)

#### DATA FRAMES ####

# Data frames are similar to a spreadsheet. There are a set of columns, which can
# be named, and a set of rows. Each row is a new entry (data point).

# You can create a data frame by using data.frame(), or through many other methods
# that return a data frame as their output.

# Here we define three columns of data as 10-element vectors/arrays.
# Then we use data.frame() to create the data frame.

trial.number <- 1:10
reaction.time <- c(1223, 1158, 975, 824, 528, 477, 489, 434, 465, 487)
correct.response <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE)

subject.data <- data.frame(
  trial = trial.number,
  rt = reaction.time,
  correct = correct.response
)

# You can access values in a data frame as if it is a two-dimensional array

subject.data[1, 'rt'] # Row 1, Column 'rt'
subject.data[1:5, 'rt'] # Rows 1 to 5, Column 'rt'
subject.data[,'rt'] # All rows, Column 'rt'
subject.data[1,] # Row 1, All Columns

# You can use the $ operator to quickly extract a column

subject.data$rt # get the rt column

# You can assign a new column with the $ operator as well.

subject.data$log.rt <- log(subject.data$rt)

# One very useful R package for manipulating data frames is dplyr. If you ran the code
# in the section about R packages, then dplyr should be installed and loaded already.

# dplyr implements a "grammar" of data manipulation. It makes it really easy to do things
# like group data by different variables, find the average of a variable, filter data
# by values in a column, and so on. As we will see in the last part of this lab, you can
# even use dplyr to create a simple model!

# There is a helpful and straightforward tutorial on dplyr here:
# https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html

# For example, here is how you would use dplyr to filter the subject.data data frame
# to look at only CORRECT responses. Note that if you run the line below, the data
# shown in the console is only the correct responses.

subject.data %>% filter(correct.response == T)

# dplyr will take some practice and getting used to. The %>% operator is particularly
# weird. You can think of the %>% operator as specifying a chain of events. Whatever
# is to the left of %>% will be evaluated and then passed as input to whatever is 
# to the right of %>%. 

# Write a filter statement here that keeps only the trials with a response time
# less than 1,000 in the subject.data data frame.

subject.data %>% filter(rt < 1000)

# mutate() is another very useful dplyr function. It allows you to create a new column
# based on the existing columns. For example, suppose that responses larger than 1,000ms
# are too slow in this experiment. We could add a new column to the data called too.slow
# that has a value of TRUE when the response is > 1,000 and FALSE when the response is
# <= 1000. Here's what that would look like.

subject.data <- subject.data %>% mutate(too.slow = rt > 1000)

# Note that we have to use the <- operator to save the result back in our data frame.
# If you run the code without the <- operator, then you'll see the output in the 
# console below, but it won't be saved in the variable.

# Write your own mutate() statement that indicates whether the trial.number is ODD or EVEN
# by adding a column to the data that is called trial.number.odd and has a value of TRUE
# when the trial number is ODD and FALSE when it is EVEN. Save this column in the data frame.

subject.data <- subject.data %>% mutate(odd.trial = trial %% 2 == 1)

# Another key set of functions with dplyr is the combination of group_by() and summarize().
# These functions are useful when you want to create different groups in your data, and then
# calculate some kind of summary metric.
# For example, suppose we want the mean RT for correct and incorrect responses in the
# subject.data data frame. First, we need to group the data by whether the response
# is correct or incorrect. Then, we use summarize to calculate the mean RT.
# Here's how we do that:

summary.data <- subject.data %>% group_by(correct) %>% summarize(mean_rt = mean(rt))

# Write a group_by() + summarize() combo that calculates the proportion of correct
# trials in ODD and EVEN numbered trials.

subject.data %>% group_by(odd.trial) %>% summarize(prop.correct = sum(correct) / n())

#### LAST PIECE: MISC LAB STUFF #####

# Writing a better sample() function.

# R has a built-in function called sample(). You might have already discovered it above when
# trying to generate random integers. The sample function lets you specify a vector and the 
# number of random samples you want to draw from that vector. For example, the code below
# picks a random number from the vector of odd numbers between 1 and 9.

sample(c(1,3,5,7,9), 1)

# This function is going to be crucial for the model that you are about to build, but it has
# one odd-quirk that you need to be careful of. If you sample from a vector of only one element,
# it behaves differently. Run the code below several times to see:

sample(c(10), 1)

# You might (very reasonably!) expect to get the number 10 over and over again, but instead you
# saw numbers between 1 and 10. This is because when sample() gets only a single number in the 
# first argument, it samples from the entire set of integers less than or equal to that number!

# This is going to be a problem for the model you are about to write. We'll want a sample function
# that always returns the single number if given a single number. The good thing is that you have
# all the tools you need to write that function! Implement the code below so that the last line of
# this file always returns the number 10.

# HINT: One way to solve this is to check how many elements are in the input.vector and then
# do different things when the input.vector has one item vs. more than one item, using an if
# statement.
# Search the internet for a function that will tell you how many items are in the vector.

better.sample <- function(input.vector, sample.size){
  if(length(input.vector) == 1){
    return(rep(input.vector[1], sample.size))
  } else {
    return(sample(input.vector, sample.size))
  }
}

better.sample(c(10), 1) # should always return 10!

better.sample(1:10, 1) # should return numbers between 1 and 10.
