

remotes::install_github("https://github.com/dbosak01/pkgdiff")


library(pkgdiff)


pkgs <- c("reporter", "fmtr", "libr", "sassy", "logr")


res <- get_stability_data(pkgs)


stability <- rbind(stability, res)

fl <- "c:/packages/pkgdiffdata/data/stability3.rds"
save(stability, file = fl)

tvers <- tidyverse::tidyverse_packages()


res2 <- get_stability_data(tvers)


load(fl)

unique(stability$Package)

pkgs <- c("common", "procs", "libr", "defineR", "reporter", "fmtr", "sassy", "logr")

report_stability(pkgs)
