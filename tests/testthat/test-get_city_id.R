test_that("get_city_id works: ", {
  expect_equal(get_city_id("ale"), "1440")
  expect_equal(get_city_id("Ale"), "1440")
  expect_equal(get_city_id("kiruna"), "2584")
  expect_equal(get_city_id("KIRUNA"), "2584")
})

test_that("get_city_id, wrong input errors up: ", {
  expect_error(get_city_id(5))
  expect_error(get_city_id("helsinki"))
  expect_error(get_city_id("a"))
})
