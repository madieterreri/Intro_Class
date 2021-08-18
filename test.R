d <- 1:10

library(car)

car::scatterplot(mpg ~ disp, 
                 data = mtcars)

library(ggplot2)

my_plot <- ggplot(data = mtcars, 
       mapping = aes(x = disp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_minimal()

plotly::ggplotly(my_plot)

st_joe_land <- read.delim(file = "stJoeLand.csv", sep = ",")

st_joe_land <- read.csv(file = "stJoeLand.csv")

st_joe_land_readr <- readr::read_csv(file = "stJoeLand.csv")

st_joe_land_datatable <- data.table::fread(input = "stJoeLand.csv")

names(st_joe_land_datatable)[names(st_joe_land_datatable) == "Zip Code"] <- 
  "Zip_Code"

st_joe_land_excel <- readxl::read_excel(path = "stJoeLand.xlsx")

save(st_joe_land, st_joe_land_datatable, file = "stJoeInfo.RData")

load("stJoeInfo.RData")

summary(as.factor(st_joe_land$school_district))

my_mean <- function(numbers) {
  # The length function gives the length
  # of a vector. Use nrow for number of
  # rows in a data.frame.
  numbers_length <- length(numbers)
  numbers_sum <- sum(numbers)
  numbers_average <- numbers_sum / numbers_length
  # The return function isn't strictly necessary,
  # but it is a safe way of handling this. You could
  # also just put numbers_average at the end and
  # it would print out.
  return(numbers_average)
}

my_mean(st_joe_land$sale_price)

mean_scaler <- function(numbers, center = TRUE) {
  if(center == TRUE) {
    result <- my_mean(numbers - my_mean(numbers))
  } else result <- my_mean(numbers)
  return(result)
}

apply(X = st_joe_land[, c("sale_price", "year_built")], 
      MARGIN = 2, 
      FUN = mean)

colMeans(st_joe_land[, c("sale_price", "year_built")])
