test_that("get_kpi_title works: ", {
  expect_equal(get_kpi_title("N07005"), "Kostnad parker, kr/inv")
  expect_equal(get_kpi_title("U07801"), "Insamlat kommunalt avfall totalt, kg/inv\u00e5nare (justerat)")
  expect_equal(get_kpi_title("n45930"), "Fj\u00e4rrv\u00e4rmeproduktion av förnybara energik\u00e4llor inom det geografiska omr\u00e5det, andel (\u0025)")
  expect_equal(get_kpi_title("N07403"), "Anm\u00e4lda v\u00e5ldsbrott, antal/100 000 inv")
  expect_equal(get_kpi_title("N00401"), "Utsl\u00e4pp till luft av v\u00e4xthusgaser totalt, ton CO2-ekv/inv.")
})

test_that("get_kpi_title, wrong input errors up: ", {
  expect_error(get_kpi_title("ale"))
  expect_error(get_kpi_id(33))
  expect_error(get_kpi_id(c(1, 2)))
  expect_error(get_kpi_id(list()))
  expect_error(get_kpi_id(TRUE))
})
