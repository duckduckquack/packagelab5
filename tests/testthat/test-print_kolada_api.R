test_that("print() works: ", {
  k_api <- kolada_api("http://api.kolada.se/v2/municipality?title=ale")
  #expect_s3_class(k_api, "kolada_api")
  expect_equal(print(k_api), NULL)
})

