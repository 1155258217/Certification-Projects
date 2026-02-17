library(stringr)
library(testthat)

test_that('handles non-alphabetical characters', {
  expect_equal(str_length(' '), 1)
  expect_equal(str_length('_'), 1)
})

test_that('handles special values', {
  expect_equal(str_length('NA'), NA)
  expect_equal(str_length(NaN), 3)
  expect_equal(str_length(Inf), 3)
  expect_equal(str_length(-Inf), 4)
})

test_that('handles vector inputs', {
  expect_equal(str_length(c(1,2,3)), c(1,1,1))
})


sales_data <- data.frame(
  Month = c("Jan", "Feb", "Mar", "Apr", "May"),
  Revenue = c(15000, 18000, 22000, 19000, 24000),
  Expenses = c(8000, 8500, 9000, 8200, 9500),
  Profit = c(7000, 9500, 13000, 10800, 14500)
)
test_that('handles dataframe inputs', {
  expect_equal(str_length(sales_data), c(36,36,31,34))
})
