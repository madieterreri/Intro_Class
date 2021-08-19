
#Problems, Errors, & Things Left Unsaid

#Missing data is always a problem. Some functions will drop those NAs automatically, but others do not!

#use the F1 R Documentation page to look at arguments for mean function
#na.rm removes NA's before it pulls the mean; looks through vector, if NA, removes value
sample(x = c(1:1000, NA), size = 1001) |> mean(na.rm = TRUE)

#Does the same thing 
mean(sample(x = c(1:1000, NA), size = 1001), na.rm = TRUE)

#column names are x,y,z
#Rnorm function - random draw from a normal distribution, draw 10,000 and replace w TRUE
cor_data <- data.frame(x = sample(c(rnorm(n = 100), NA), 10000, replace = TRUE), 
                       y = sample(c(rnorm(n = 100), NA), 10000, replace = TRUE), 
                       z = sample(c(rnorm(n = 100), NA), 10000, replace = TRUE))

View(cor_data)

#use arguement for computing covariances in the presence of missing values.
cor(cor_data, use = "pairwise.complete.obs")

#Uninformative Summary
#Let's read the data in from yesterday:
  
#if you aren't in your R project, you have to do an absolute path
land_value <- read.csv("stJoeLand.csv")

#view to see that they are not numbers
View(land_value)

#full summary is not useful
summary(land_value)

#I'd be curious to know the frequencies of the school_district column:
#will be using summary often 
summary(as.factor(land_value$school_district))

#Garbage Factors

#Statistically, factors are important. From a programming perspective, they are trash. Maybe instead of trash, we could consider them objects that we can upcycle.

factor(seq(from = 1, to = 10, by = .5)) |> 
    as.character() |>   
    as.numeric() |> 
    mean()

factor(seq(from = 1, to = 10, by = .5)) |> as.numeric() |> mean()

# [1] 10

#Adding New Variables

#Often the first tricky thing that people encounter, but it couldn't be easier:
  
land_value$dollar_per_acre <- land_value$sale_price / land_value$acreage

# [] indices that look inside 
# don't need a comma, we are already looking at the column
mean(land_value$dollar_per_acre[land_value$dollar_per_acre != Inf])

#Try to find the mean of that new variable!
  
#Errors

#non-numeric argument to unary/binary operator

#Anytime "math" operation is performed on a character.

#You learned how to select variables a few days ago:
  
land_value[, c("sale_price", "bedrooms")]

#Dropping them should be just as easy:
  
#can't do match on character 
land_value[, -c("sale_price", "bedrooms")]

#But, that minus sign will only work with numbers:
  
#which givs the TRUE indices of a logical object, allowing for array indices.
# %in% is a match operator 
drop_vars <- which(names(land_value) %in% c("sale_price", "bedrooms"))

land_value[, -drop_vars]

#The which, any, all functions will be helpful as you start working with more data.

#object of type "closure" is not subsettable

#Or' be careful what you name objects!

#Or' functions don't behave like objects!

#Let's explore this some more together!
  
