test_that("get_kpi_desc works: ", {
  expect_equal(get_kpi_desc("Miljöbilar, andel av totalt antal bilar i det geografiska området, (%) (-2020)"),
               "Antal miljöbilar i trafik dividerat med totalt antal bilar i trafik, multiplicerat med 100. Avser den 31/12 och den geografiska kommunen/regionen.  Från 1 juli 2018 avser uppgiften klimatbonusbilar. Avser bilar som vid tiden för registrering uppfyllde kraven för miljöbil.  Detta innebär att bilar registrerade före den 1 januari 2013 ska uppfylla kriterierna för MB2007 och bilar registrerade 1 januari 2013 eller senare ska uppfylla kriterierna för MB2013. Källa: SCB.")
  expect_equal(get_kpi_desc("Anmälda våldsbrott, antal/100 000 inv"),
               "Avser summering av: Försök till mord eller dråp, Misshandel inkl. grov, Våldtäkt inkl. grov, Grov kvinnofridskränkning, Grov fridskränkning, Våld mot tjänsteman och Rån inkl. grovt, antal/100 000 inv. Statistiken redovisas efter den kommun där brottet har begåtts (brottsplats). Fr.o.m. 2015  avser uppgifterna per kommun endast de brott som kunnat härledas till kommunen. Tidigare år fanns det med brott som begåtts i regionen men inte kunnat kopplas till en specifik kommun. För detta nyckeltal räknas bortfall som 0. Källa: BRÅ & SCB")
  expect_equal(get_kpi_desc("Invånare med fetma, andel (%)"),
               "Detta är ett utvecklingsnyckeltal, se frågor och svar på kolada.se för mer information. Två olika undersökningar med jämförbara resultat är inkluderade i statistiken. Uppsala, Sörmland, Västmanland, Värmland och Örebro (den sk. CDUST-regionen) har Liv & Hälsa (LV) som datakälla, med urval av invånare 18-84 år vilket avser år T. Resten av landet som har källa folkhälsomyndigheten (HLV), och med urval på invånare 16-84 år, avser år T-3 till T. BMI beräknas enligt: vikt (i kg) dividerat med längd (m2) i kvadrat. Extremvärden exkluderas i beräkningen så att en person måste vara mellan 101 och 249 cm samt väga mellan 30 och 200 kg för att ingå. Antal som beräknats ha ett BMI 30 eller högre enligt ovan dividerat med antal som besvarat frågan. För kommuner används tilläggsurval vilka förekommer oregelbundet, därför viktas andelarna efter antal svar per år. Källa: Folkhälsomyndigheten, Hälsa på lika villkor (HLV) samt Liv & Hälsa (LH)")
})

test_that("get_kpi_desc, wrong input errors up: ", {
  expect_error(get_kpi_desc("N07005"))
  expect_error(get_kpi_desc(33))
  expect_error(get_kpi_desc("ciao"))
  expect_error(get_kpi_desc(list()))
  expect_error(get_kpi_desc("ale"))
  expect_error(get_kpi_desc(c(2, 3)))
  expect_error(get_kpi_desc(TRUE))
})

