## test-get_data.R

test_1 <- data.frame(kpi = c("N00403"), municipality = c("2584"), period = 2018, values = c(NA),
                     stringsAsFactors = FALSE)
test_2 <- data.frame(kpi = c("N07005"), municipality = c("0580"), period = 2020, values = 596.12674,
                     stringsAsFactors = FALSE)
test_3 <- data.frame(kpi = c("U01411", "U01411"), municipality = c("1440", "1440"),  period = c(2018, 2020),
                     values = c(18, 18), stringsAsFactors = FALSE)

test_4 <- data.frame(kpi = c("N07005"), municipality = c("0580"), period = c(2002), values = c(313),
                     stringsAsFactors = FALSE)
test_5 <- data.frame(kpi = rep("N07403", 24), municipality = rep("0604", 24),
                     period = seq(from = 1998, to = 2021),
                     values = c(293.85836, 294.16090, 508.82969, 284.17588, 437.33976, 375.03750, 754.83091,
                                501.82481, 366.35628, 691.66922, 965.81327, 465.40490, 860.31597, 1013.25019,
                                717.96472, 831.37254, 622.47121, 550.71133, 1226.71512, 1047.81582, 644.02810,
                                1212.03271, 586.42427, 667.44051),
                     stringsAsFactors = FALSE)

test_that("get_data works: ", {
  expect_equal(get_data("N00403", "2018", "2584"), test_1)
  expect_equal(get_data("N07005", "2020", "0580"), test_2)
  expect_equal(get_data("U01411", "2018,2020", "1440"), test_3)
  expect_equal(get_data("N07005", "2002", "0580"), test_4)
  expect_equal(get_data(kpi_id = "N07403", city_id = "0604"), test_5)
})

test_that("get_data, wrong input errors up: ", {
  expect_error(get_data(N00403, "2018", "2584"))
  expect_error(get_data("N00403", 2018, "2584"))
  expect_error(get_data("N00403", "2018", 2584))
  expect_error(get_data(list()))
  expect_error(get_data())
})
