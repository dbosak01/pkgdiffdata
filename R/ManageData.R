

remotes::install_github("https://github.com/dbosak01/pkgdiff")


library(pkgdiff)


pkgs <- c("reporter", "fmtr", "libr", "sassy", "logr")


res <- get_stability_data(pkgs)


stability <- rbind(stability, res)


saveRDS(stability, "c:/packages/pkgdiffdata/data/stability2.rds")

tvers <- tidyverse::tidyverse_packages()


res2 <- get_stability_data(tvers)
