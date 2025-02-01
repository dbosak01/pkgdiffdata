

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

  fl <- file.path("data", paste0(pkg, ".Rdata"))

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


pkvect <- pkgdiff:::get_latest_version(pkgs)

save(pkvect, file = "packages.rds")

procs$
