test_that("get_kpi_title works: ", {
  expect_equal(get_kpi_title("N07005"), "Kostnad parker, kr/inv")
  expect_equal(get_kpi_title("U07801"), "Insamlat kommunalt avfall totalt, kg/invånare (justerat)")
  expect_equal(get_kpi_title("n45930"), "Fjärrvärmeproduktion av förnybara energikällor inom det geografiska området, andel (%)")
  expect_equal(get_kpi_title("N07403"), "Anmälda våldsbrott, antal/100 000 inv")
  expect_equal(get_kpi_title("N00401"), "Utsläpp till luft av växthusgaser totalt, ton CO2-ekv/inv.")
})

test_that("get_kpi_title, wrong input errors up: ", {
  expect_error(get_kpi_title("ale"))
  expect_error(get_kpi_id(33))
  expect_error(get_kpi_id(c(1, 2)))
  expect_error(get_kpi_id(list()))
  expect_error(get_kpi_id(TRUE))
})
