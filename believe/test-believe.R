library(testthat)
source('believe.R')

test_that('+', {
  expect_equal(believe('1+1'), 2)
  expect_equal(believe('-1+2'), 1)
  expect_equal(believe('Inf+Inf'), Inf)
})

test_that('-', {
  expect_equal(believe('1-1'), 0)
  expect_equal(believe('-1-2'), -3)
  expect_equal(believe('-Inf-Inf'), -Inf)
})

test_that('*', {
  expect_equal(believe('1*1'), 1)
  expect_equal(believe('-1*2'), -2)
  expect_equal(believe('-Inf*Inf'), -Inf)
})

test_that('/', {
  expect_equal(believe('1/1'), 1)
  expect_equal(believe('-1/2'), -0.5)
  expect_equal(believe('-Inf/Inf'), NaN)
})
