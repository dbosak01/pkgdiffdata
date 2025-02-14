

remotes::install_github("https://github.com/dbosak01/pkgdiff")



library(pkgdiff)



mt <- cranlogs::cran_top_downloads(count = 100)


# Test
res <- create_package_data("survival")


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



# Test vector
elipks <- c("drake", "targets", "r2rtf", "officer", "flextable", "Hmisc")

for (pkg in elipks) {

  res <- create_package_data(pkg)

}

# "survival" has error reading S file
# Stats vector
statspks <- c("car", "emmeans", "mmrm", "lme4", "lmerTest",
              "VGAM", "MASS", "Matrix")
#"survival", "Hmisc",
s2 <- c( "VGAM", "MASS", "Matrix")

for (pkg in s2) {

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
"xopen",                 "xtable", "xfun", "sys",  "selectr", "yaml",                  "zip")


tmp <- apkgs[!apkgs %in% names(ml)]
for (pkg in tmp) {

  res <- create_package_data(pkg)

}


ml <- update_package_list()
length(ml)
