

remotes::install_github("https://github.com/dbosak01/pkgdiff")


library(pkgdiff)
#library(packageDiff)

pkgs <- c("common", "procs", "libr", "defineR", "reporter", "fmtr", "sassy", "logr")




github_data <- function(pkg, versions = NULL) {



}

create_package_data <- function(pkg) {

  ret <- list()

  infos <- pkgdiff:::get_all_infos(pkg)


  dat <- pkgdiff:::get_info_data(pkg, infos)


  ret[["stability"]] <- dat
  ret[["infos"]] <- infos

  fl <- file.path("data", paste0(pkg, ".RData"))

  save(ret, file = fl)

  return(ret)
}

# Test
res <- create_package_data("defineR")



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




allpkgs <- c(pkgs, tverse, pverse, toppks)

pkvect <- pkgdiff:::get_latest_version(allpkgs)

save(pkvect, file = "packages.rds")


