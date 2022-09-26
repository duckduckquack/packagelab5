test_that("get_kpi_id works: ", {
  expect_equal(get_kpi_id("Inv\u00e5nare 0-19 \u00e5r i ekonomiskt utsatta hush\u00e5ll, andel (\u0025)"), "N02904")
  expect_equal(get_kpi_id("Inv\u00e5nare 18-64 \u00e5r med l\u00e5g inkomst, andel (\u0025)"), "U01803")
  expect_equal(get_kpi_id("Vattenf\u00f6rbrukning lokaler, kbm/kvm BRA"), "U60471")
  expect_equal(get_kpi_id("Brukarbed\u00f6mning s\u00e4rskilt boende \u00e4ldreomsorg -  helhetssyn, andel (\u0025)"), "U23471")
  expect_equal(get_kpi_id("Ekologiskt odlad \u00e5kermark, andel (\u0025)"), "N00403")
})

test_that("get_kpi_id, wrong input errors up: ", {
  expect_error(get_kpi_id("N07005"))
  expect_error(get_kpi_id(33))
  expect_error(get_kpi_id(list()))
  expect_error(get_kpi_id("ciao"))
  expect_error(get_kpi_id(c(1, 2)))
})
