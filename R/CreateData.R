

remotes::install_github("https://github.com/dbosak01/pkgdiff")



library(pkgdiff)
library(cranlogs)

res1 <- cranlogs::cran_downloads("fmtr", when = "last-month")

res1
mt <- cranlogs::cran_top_downloads(count = 100)

pkg <- "bayess"
pkg <- "tidymodels"
pkgdiff:::github_packages(pkg)

pkg_info(pkg)

# Test
res <- create_package_data(pkg)


# Test vector
pkgs <- c("common", "procs", "libr", "defineR", "reporter", "fmtr", "sassy", "logr")

for (pkg in pkgs) {

  res <- create_package_data(pkg)

}


# More test packages
tverse <- tidyverse::tidyverse_packages()

res <- tverse %in% mt$package
tverse2 <- tverse[!res]

for (pkg in tverse2) {

  res <- create_package_data(pkg)

}


# Test vector
pverse <- c("admiral", "Tplyr", "rtables", "pkglite", "tfrmt", "tidytlg", "xportr", "gtsummary")

for (pkg in pverse) {

  res <- create_package_data(pkg)

}

# "aNCA" "cardinal",
# Test vector
pverse2 <- c("admiralonco", "admiralophtha", "admiralpeds",
"admiralvaccine",  "cards", "cardx", "chevron",
"covtracer", "datacutr", "datasetjson", "diffdf", "envsetup", "ggsurvfit",
"logrx", "metacore", "metatools", "pharmaRTF", "pharmaverseadam", "pharmaversesdtm",
"rhino", "riskassessment", "riskmetric", "rlistings", "sdtm.oak", "sdtmchecks",
"teal", "tern", "tfrmtbuilder", "thevalidatoR", "tidyCDISC", "valtools")

p2 <- pverse2[!pverse2 %in% names(ml)]

for (pkg in p2) {

  res <- create_package_data(pkg)

}



pkgdiff:::github_packages(elipks)

# Test vector
elipks <- c("drake", "targets", "r2rtf", "officer", "flextable", "Hmisc")

for (pkg in elipks) {

  res <- create_package_data(pkg)

}

# "survival" has error reading S file
# Stats vector
statspks <- c("survival", "car", "emmeans", "mmrm", "lme4", "lmerTest",
              "VGAM", "MASS", "Matrix")


for (pkg in s2) {

  res <- create_package_data(pkg)

}

#  "gtools"  "xtable",

apkgs <- c("DBI", "R.cache",
"R.methodsS3",           "R.oo",                  "R.utils" ,              "R6",
"RJDBC",                 "Rcpp",                  "RcppTOML",
"base64enc",             "bit",                   "bit64",                 "blob",
"brew",                  "brio",                  "bslib",                 "cachem" ,
"callr",                                   "clipr",                 "commonmark" ,
"config",                "covr",                  "cpp11",                 "crayon",
"credentials",                           "desc",                  "devtools",
"diffobj",                             "downlit",
"ellipsis",              "evaluate",                            "fastmap" ,
                   "generics",              "gert" ,
"gh",                    "gitcreds",
"here",                  "highr",                                    "htmltools",
"htmlwidgets",           "httpuv",                                "httr2" ,
"ini",                   "jquerylib",
"later",                 "lazyeval",
"memoise",               "mime",                  "miniUI",                "odbc"     ,
                               "pkgbuild",              "pkgconfig",
"pkgdown",               "pkgload",               "png",                   "praise"     ,
"prettyunits",           "processx",              "profvis",               "promises"    ,
"ps",                                    "rJava",
"rappdirs",              "rcmdcheck",             "rematch2",              "remotes"       ,
"renv",                  "reticulate",            "rex",
            "roxygen2",              "rprojroot",
"rversions",             "sass",                  "sessioninfo",           "shiny",
"sourcetools",                                        "styler",
                   "systemfonts",           "testthat",              "textshaping",
                                       "urlchecker",
"usethis",               "utf8",                                 "waldo",
"whisker",               "withr",
"xopen",                 "xfun", "sys",  "selectr", "yaml",                  "zip")


tmp <- apkgs[!apkgs %in% names(ml)]
for (pkg in tmp) {

  res <- create_package_data(pkg)

}


ml <- update_package_list()
length(ml)

"huxtable" %in% names(ml)

csp <- pkg_cache()
cvp <- pkg_repo()

ml <- cvp$Package[!cvp$Package %in% csp$data$Package]

for (pkg in ml) {

  res <- create_package_data(pkg)

}



