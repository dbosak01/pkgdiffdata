

remotes::install_github("https://github.com/dbosak01/pkgdiff")


library(pkgdiff)
library(packageDiff)

pkgs <- c("common", "procs", "libr", "defineR", "reporter", "fmtr", "sassy", "logr")






create_package_data <- function(pkg) {




}





pkgs <- c("common", "procs", "libr", "defineR", "reporter", "fmtr", "sassy", "logr")

pkvect <- pkgdiff:::get_latest_version(pkgs)

save(pkvect, file = "packages.rds")


