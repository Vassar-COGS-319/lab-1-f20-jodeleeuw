#### Setting up the data ####

# This section of the code will create a data frame that describes
# each trial in the experiment. The data frame will have two columns:
#
# stimulus - The ordinal value of the stimulus on the current trial
# last.stimulus - The ordinal value of the stimulus on the last trial
#
# The order of trials is generated in a way that avoids repeats of the
# same stimulus on neighboring trials.

# Parameters to control trial generation
n.trials <- 50 # How many trials for each stimulus?
n.stimuli <- 9 # How many different stimuli?

# Create a random order of trials, with no neighboring repeats.
trials <- sample(1:n.stimuli)
for(i in 2:n.trials){
  next.order <- sample(1:n.stimuli)
  while(next.order[1] == trials[length(trials)]){
    next.order <- sample(1:n.stimuli)
  }
  trials <- c(trials, next.order)
}

# Create the data frame
trial.data <- data.frame(stimulus=trials)

# add a column that contains the value of the previous stimulus
trial.data <- trial.data %>% mutate(last.stimulus = lag(stimulus))

#### Model of responses ####

# Your work starts here. Implement the model described in the readme
# file. You should add a new column to trial.data that indicates whether the
# model guessed correctly (TRUE) or incorrectly (FALSE).

# You may want to start by adding a column to indicate what stimulus the model
# guessed. Then you can create a fourth column to indicate whether the guess
# was correct.

# Don't forget about the better.sample function that you wrote in the tutorial file!

model.data <- trial.data %>% 
  rowwise() %>%
  mutate(guess = ifelse(is.na(last.stimulus), sample(1:n.stimuli, 1),
                        ifelse(last.stimulus > stimulus, better.sample(1:(last.stimulus-1), 1),
                               better.sample((last.stimulus+1):n.stimuli, 1)))) %>%
  mutate(correct = stimulus == guess)

#### Aggregate the data ####

# Now that you have a model that can generate a response for every trial, you need
# to group the data and find the proportion of trials that the model answered correctly
# for each value of the stimulus column. Then you can compare the data your model generated
# to the data generated in the Neath and Brown experiment.

# This is where you will need to use the dplyr group_by + summarize functions. Generate a new data frame
# that has the proportion of correct responses for each value of stimulus. (Note that the proportion
# correct is equivalent to taking the mean of the correct column if you code incorrect responses as 0
# and correct responses as 1).

summary.model.data <- model.data %>% group_by(stimulus) %>%
  summarize(accuracy = mean(correct))


#### Plot the results ####

# Plot the curve with stimulus on the X axis and proportion of correct
# responses on the Y axis.

# Remember that you can extract a column of data with the $ operator, so something like:
# plot(data$stimulus, data$proportion.correct) should get you close to where you want to be.

plot(summary.model.data$stimulus, summary.model.data$accuracy, type="l")


#### Short answer questions (reply using a comment below each number)

# 1. Why does the model's output change slightly each time you run it?

# There's randomness involved. Each simulation creates a new set of data and a new set of 
# model guesses. Because the sample size is relatively small, we see the variations due
# to randomness show up in the data.

# 2. Try increasing and decreasing the number of trials per stimulus. How does
#    this affect the stability of the model's predictions from run to run?
#    Explain why this happens.

# The larger the number of trials per stimulus, the greater the stability of the predictions.
# As we increase the number of attempts that the model makes we even out the effects of randomness.
# This causes the model to tend towards its average expected behavior.

# 3. Explain why the stimuli at the ends have a higher proportion correct than
#    those in the middle under this model.

# For the stimuli at the extremes, there are more trials where that stimulus is one of a few possible
# answers. For example, it's possible to have a 9 trial immediately after an 8 trial. In this trial,
# the model is correct 100% of the time. For the stimulus 5, the best that we can hope for is that it
# comes after a 4 or 6, when there are still 5 alternatives to guess.

# 4. Compare the model's accuracy to the data from Neath and Brown (2005). What
#    is the major difference? What does this suggest about the guessing model?

# The shape of the curves are similar, but the overall accuracy is lower in the model. The model predicts
# maximum accuracy of about 33%, but subjects in the experiment were 70% accurate at the extremes.
# This suggests that people are not just randomly guessing from the set of possible choices. 
# An alternative idea is that people are using the magnitude of the relative difference to
# adjust their guesses. We could model this and see if it can account for the increase in accuracy
# while preserving the shape.

