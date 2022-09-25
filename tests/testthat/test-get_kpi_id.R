test_that("get_kpi_id works: ", {
  expect_equal(get_kpi_id("Invånare 0-19 år i ekonomiskt utsatta hushåll, andel (%)"), "N02904")
  expect_equal(get_kpi_id("Invånare 18-64 år med låg inkomst, andel (%)"), "U01803")
  expect_equal(get_kpi_id("Vattenförbrukning lokaler, kbm/kvm BRA"), "U60471")
  expect_equal(get_kpi_id("Brukarbedömning särskilt boende äldreomsorg -  helhetssyn, andel (%)"), "U23471")
  expect_equal(get_kpi_id("Ekologiskt odlad åkermark, andel (%)"), "N00403")
})

test_that("get_kpi_id, wrong input errors up: ", {
  expect_error(get_kpi_id("N07005"))
  expect_error(get_kpi_id(33))
  expect_error(get_kpi_id(list()))
  expect_error(get_kpi_id("ciao"))
  expect_error(get_kpi_id(c(1, 2)))
})
