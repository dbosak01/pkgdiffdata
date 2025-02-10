

remotes::install_github("https://github.com/dbosak01/pkgdiff")



library(pkgdiff)
#library(packageDiff)

pkgs <- c("common", "procs", "libr", "defineR", "reporter", "fmtr", "sassy", "logr")


# pkg_info("common")


pkg <- "procs"
create_package_data <- function(pkg) {

  ret <- list()

  infos <- pkgdiff:::get_all_infos(pkg)


  dat <- pkgdiff:::get_info_data(pkg, infos)


  ret[["stability"]] <- dat
  ret[["infos"]] <- infos

  fl <- file.path("data", paste0(pkg, ".RData"))

  if (file.exists(fl))
    file.remove(fl)

  save(ret, file = fl)

  return(ret)
}

# Test
res <- create_package_data("procs")



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
morepks <- c("rmarkdown", "fs", "tinytex", "fontawesome", "digest", "xfun", "sys",
             "openssl", "askpass", "curl")

for (pkg in morepks) {

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



apkgs <- c("selectr", "DBI", "R.cache",
"R.methodsS3",           "R.oo",                  "R.utils" ,              "R6",
"RJDBC",                 "Rcpp",                  "RcppTOML",
"base64enc",             "bit",                   "bit64",                 "blob",
"brew",                  "brio",                  "bslib",                 "cachem" ,
"callr",                 "cli",                   "clipr",                 "commonmark" ,
"config",                "covr",                  "cpp11",                 "crayon",
"credentials",                           "desc",                  "devtools",
"diffobj",                             "downlit",
"ellipsis",              "evaluate",                            "fastmap" ,
                   "generics",              "gert" ,
"gh",                    "gitcreds",                         "gtools" ,
"here",                  "highr",                 "hms",                   "htmltools",
"htmlwidgets",           "httpuv",                "httr",                  "httr2" ,
"ini",                   "jquerylib",
"later",                 "lazyeval",
"memoise",               "mime",                  "miniUI",                "odbc"     ,
                               "pkgbuild",              "pkgconfig",
"pkgdown",               "pkgload",               "png",                   "praise"     ,
"prettyunits",           "processx",              "profvis",               "promises"    ,
"ps",                                    "rJava",                 "ragg"         ,
"rappdirs",              "rcmdcheck",             "rematch2",              "remotes"       ,
"renv",                  "reticulate",            "rex",
            "roxygen2",              "rprojroot",
"rversions",             "sass",                  "sessioninfo",           "shiny",
"sourcetools",           "stringi",                              "styler",
                   "systemfonts",           "testthat",              "textshaping",
               "tidyselect",                          "urlchecker",
"usethis",               "utf8",                                 "waldo",
"whisker",               "withr",                 "xfun",
"xopen",                 "xtable",                "yaml",                  "zip",
"rlang")

for (pkg in apkgs) {

  res <- create_package_data(pkg)

}


 allpkgs <- c(pkgs, tverse, pverse, toppks, morepks, elipks, statspks, apkgs)

pkvect <- pkgdiff:::get_latest_version(pkgs)


save(pkvect, file = "packages.rds")


