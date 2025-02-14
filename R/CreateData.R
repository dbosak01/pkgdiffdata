

remotes::install_github("https://github.com/dbosak01/pkgdiff")



library(pkgdiff)






# Test
res <- create_package_data("crayon")


# Test vector
pkgs <- c("common", "procs", "libr", "defineR", "reporter", "fmtr", "sassy", "logr")

for (pkg in pkgs) {

  res <- create_package_data(pkg)

}


# More test packages
tverse <- tidyverse::tidyverse_packages()

for (pkg in tverse) {

  res <- create_package_data(pkg)

}


# Test vector
pverse <- c("admiral", "Tplyr", "rtables", "pkglite", "tfrmt", "tidytlg", "xportr", "gtsummary")

for (pkg in pverse) {

  res <- create_package_data(pkg)

}


# Test vector
toppks <- c("lifecycle", "vctrs", "glue", "stringi", "tidyselect", "knitr", "scales", "fansi")

for (pkg in toppks) {

  res <- create_package_data(pkg)

}

# Test vector
morepks <- c("rmarkdown", "fs", "tinytex", "fontawesome",
             "openssl", "askpass", "curl")

mpks <- c("openssl", "askpass", "curl")

for (pkg in mpks) {

  res <- create_package_data(pkg)

}


# Test vector
elipks <- c("drake", "targets")

for (pkg in elipks) {

  res <- create_package_data(pkg)

}


# Stats vector
statspks <- c("survival", "car", "emmeans", "mmrm", "lme4", "lmerTest",
              "VGAM", "MASS")

for (pkg in statspks) {

  res <- create_package_data(pkg)

}



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
"gh",                    "gitcreds",                         "gtools" ,
"here",                  "highr",                                    "htmltools",
"htmlwidgets",           "httpuv",                                "httr2" ,
"ini",                   "jquerylib",
"later",                 "lazyeval",
"memoise",               "mime",                  "miniUI",                "odbc"     ,
                               "pkgbuild",              "pkgconfig",
"pkgdown",               "pkgload",               "png",                   "praise"     ,
"prettyunits",           "processx",              "profvis",               "promises"    ,
"ps",                                    "rJava",                        ,
"rappdirs",              "rcmdcheck",             "rematch2",              "remotes"       ,
"renv",                  "reticulate",            "rex",
            "roxygen2",              "rprojroot",
"rversions",             "sass",                  "sessioninfo",           "shiny",
"sourcetools",                                        "styler",
                   "systemfonts",           "testthat",              "textshaping",
                                       "urlchecker",
"usethis",               "utf8",                                 "waldo",
"whisker",               "withr",
"xopen",                 "xtable", "xfun", "sys")


tmp <- c(  "selectr", "yaml",                  "zip")
for (pkg in apkgs) {

  res <- create_package_data(pkg)

}


 allpkgs <- c(pkgs, tverse, pverse, toppks, morepks, elipks, statspks, apkgs)

mpkgs <- c(pkgs,  "crayon", "admiral", tverse, pverse, toppks, morepks)

pkvect <- pkgdiff:::get_latest_version(mpkgs)


save(pkvect, file = "packages.rds")


