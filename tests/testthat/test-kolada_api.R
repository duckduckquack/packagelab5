test_that("Class is correct: ", {
  k_api <- kolada_api("http://api.kolada.se/v2/municipality?title=ale")
  #expect_s3_class(k_api, "kolada_api")
  expect_true(class(k_api) == "kolada_api")
})

test_that("kolada_api rejects wrong input: ", {
  expect_error(kolada_api(3))
  expect_error(kolada_api(TRUE))
  expect_error(kolada_api(list()))
  expect_error(kolada_api(c(1, 2)))
  expect_error(kolada_api(NA))
  expect_error(kolada_api("a"))
})
