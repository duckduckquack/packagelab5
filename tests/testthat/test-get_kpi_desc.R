test_that("get_kpi_desc works: ", {
  expect_equal(get_kpi_desc("Milj\u00f6bilar, andel av totalt antal bilar i det geografiska omr\u00e5det, (\u0025) (-2020)"),
               "Antal milj\u00f6bilar i trafik dividerat med totalt antal bilar i trafik, multiplicerat med 100. Avser den 31/12 och den geografiska kommunen/regionen.  Fr\u00e5n 1 juli 2018 avser uppgiften klimatbonusbilar. Avser bilar som vid tiden f\u00f6r registrering uppfyllde kraven f\u00f6r milj\u00f6bil.  Detta inneb\u00e4r att bilar registrerade f\u00f6re den 1 januari 2013 ska uppfylla kriterierna f\u00f6r MB2007 och bilar registrerade 1 januari 2013 eller senare ska uppfylla kriterierna f\u00f6r MB2013. K\u00e4lla: SCB.")
  expect_equal(get_kpi_desc("Anm\u00e4lda v\u00e5ldsbrott, antal/100 000 inv"),
               "Avser summering av: F\u00f6rs\u00f6k till mord eller dr\u00e5p, Misshandel inkl. grov, V\u00e5ldt\u00e4kt inkl. grov, Grov kvinnofridskr\u00e4nkning, Grov fridskr\u00e4nkning, V\u00e5ld mot tj\u00e4nsteman och R\u00e5n inkl. grovt, antal/100 000 inv. Statistiken redovisas efter den kommun d\u00e4r brottet har beg\u00e5tts (brottsplats). Fr.o.m. 2015  avser uppgifterna per kommun endast de brott som kunnat h\u00e4rledas till kommunen. Tidigare \u00e5r fanns det med brott som beg\u00e5tts i regionen men inte kunnat kopplas till en specifik kommun. F\u00f6r detta nyckeltal r\u00e4knas bortfall som 0. K\u00e4lla: BR\u00c5 & SCB")
  expect_equal(get_kpi_desc("Inv\u00e5nare med fetma, andel (\u0025)"),
               "Detta \u00e4r ett utvecklingsnyckeltal, se fr\u00e5gor och svar p\u00e5 kolada.se f\u00f6r mer information. Tv\u00e5 olika unders\u00f6kningar med j\u00e4mf\u00f6rbara resultat \u00e4r inkluderade i statistiken. Uppsala, S\u00f6rmland, V\u00e4stmanland, V\u00e4rmland och \u00d6rebro (den sk. CDUST-regionen) har Liv & H\u00e4lsa (LV) som datak\u00e4lla, med urval av inv\u00e5nare 18-84 \u00e5r vilket avser \u00e5r T. Resten av landet som har k\u00e4lla folkh\u00e4lsomyndigheten (HLV), och med urval p\u00e5 inv\u00e5nare 16-84 \u00e5r, avser \u00e5r T-3 till T. BMI ber\u00e4knas enligt: vikt (i kg) dividerat med l\u00e4ngd (m2) i kvadrat. Extremv\u00e4rden exkluderas i ber\u00e4kningen s\u00e5 att en person m\u00e5ste vara mellan 101 och 249 cm samt v\u00e4ga mellan 30 och 200 kg f\u00f6r att ing\u00e5. Antal som ber\u00e4knats ha ett BMI 30 eller h\u00f6gre enligt ovan dividerat med antal som besvarat fr\u00e5gan. F\u00f6r kommuner anv\u00e4nds till\u00e4ggsurval vilka f\u00f6rekommer oregelbundet, d\u00e4rf\u00f6r viktas andelarna efter antal svar per \u00e5r. K\u00e4lla: Folkh\u00e4lsomyndigheten, H\u00e4lsa p\u00e5 lika villkor (HLV) samt Liv & H\u00e4lsa (LH)")
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

