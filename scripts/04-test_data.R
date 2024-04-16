#### Preamble ####
# Purpose: Test simulated data.
# Author: [Your Name]
# Date: [Current Date]
# Contact: [Your Contact Information]
# License: MIT
# Pre-requisites: Create simulated data.
# Additional Information: None

#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data setup ####
# 创建模拟数据
set.seed(123)
simulated_vocab_data <- tibble(
  vocab_word = sample(c("apple", "banana", "cherry"), 100, replace = TRUE),
  child_id = sample(1:50, 100, replace = TRUE),
  age_months = sample(18:60, 100, replace = TRUE),
  production = sample(c("yes", "no"), 100, replace = TRUE)
)

#### Define tests ####
test_that("vocab_word is character", {
  expect_true(class(simulated_vocab_data$vocab_word) == "character")
})

test_that("child_id maximum is 50", {
  expect_true(max(simulated_vocab_data$child_id) == 50)
})

test_that("age_months is integer", {
  expect_true(class(simulated_vocab_data$age_months) == "integer")
})

test_that("production has only two unique values", {
  expect_length(unique(simulated_vocab_data$production), 2)
})

#### Execute tests ####
test_dir("tests/")

