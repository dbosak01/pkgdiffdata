

library(cranlogs)
library(pkgdiff)
library(common)

source("./R/utilities.R")

apkgs <- pkgdiff:::available_packages()
svect <- pkgdiff:::github_packages()


tpkgs <- apkgs[apkgs$Package %in% names(svect), c("Package", "Version")]

avect <- tpkgs$Version
names(avect) <- tpkgs$Package


for (pkg in names(svect)) {

  if (svect[pkg] != avect[pkg]) {

    print(paste0("Updating '", pkg, "' ", svect[pkg], " -> ", avect[pkg]))

    npkg <- update_package_data(pkg)
    print(npkg$stability)

  }

}

ml <- update_package_list()
length(ml)



# update_package_data("zoo")


# [1] "Updating 'Benchmarking' 0.32 -> 0.33"
# [1] "Updating 'bipartite' 2.20 -> 2.21"
# [1] "Updating 'cards' 0.4.0 -> 0.5.0"
# [1] "Updating 'cardx' 0.2.2 -> 0.2.3"
# [1] "Updating 'CDMConnector' 1.7.0 -> 2.0.0"
# [1] "Updating 'cgam' 1.21 -> 1.23"
# [1] "Updating 'chevron' 0.2.7 -> 0.2.10"
# [1] "Updating 'CodelistGenerator' 3.3.2 -> 3.4.0"
# [1] "Updating 'coneproj' 1.19 -> 1.20"
# [1] "Updating 'cpp11armadillo' 0.4.1 -> 0.4.4"
# [1] "Updating 'cTMed' 1.0.5 -> 1.0.6"
# [1] "Updating 'curl' 6.2.0 -> 6.2.1"
# [1] "Updating 'data.table' 1.16.4 -> 1.17.0"
# [1] "Updating 'duckdb' 1.1.3-2 -> 1.2.0"
# [1] "Updating 'EpiNow2' 1.7.0 -> 1.7.1"
# [1] "Updating 'esquisse' 2.0.1 -> 2.1.0"
# [1] "Updating 'ftsa' 6.5 -> 6.6"
# [1] "Updating 'gausscov' 1.1.4 -> 1.1.5"
# [1] "Updating 'geometa' 0.9 -> 0.9.1"
# [1] "Updating 'GGIR' 3.1-5 -> 3.2-0"
# [1] "Updating 'gpboost' 1.5.5.1 -> 1.5.6"
# [1] "Updating 'gtsummary' 2.0.4 -> 2.1.0"
# [1] "Updating 'IncidencePrevalence' 1.0.0 -> 1.1.0"
# [1] "Updating 'indicspecies' 1.7.15 -> 1.8.0"
# [1] "Updating 'jsmodule' 1.6.1 -> 1.6.3"
# [1] "Updating 'jsonlite' 1.8.9 -> 1.9.0"
# [1] "Updating 'lares' 5.2.11 -> 5.2.13"
# [1] "Updating 'Luminescence' 0.9.26 -> 1.0.0"
# [1] "Updating 'modEvA' 3.29 -> 3.30"
# [1] "Updating 'nanoparquet' 0.4.1 -> 0.4.2"
# [1] "Updating 'nlmixr2' 3.0.1 -> 3.0.2"
# [1] "Updating 'nlmixr2est' 3.0.3 -> 3.0.4"
# [1] "Updating 'NNS' 11.0 -> 11.1"
# [1] "Updating 'plumber' 1.2.2 -> 1.3.0"
# [1] "Updating 'processx' 3.8.5 -> 3.8.6"
# [1] "Updating 'ProtE' 1.0.1 -> 1.0.3"
# [1] "Updating 'ps' 1.8.1 -> 1.9.0"
# [1] "Updating 'QuickJSR' 1.5.1 -> 1.5.2"
# [1] "Updating 'r2dii.plot' 0.5.0 -> 0.5.1"
# [1] "Updating 'r2rtf' 1.1.1 -> 1.1.2"
# [1] "Updating 'relations' 0.6-14 -> 0.6-15"
# [1] "Updating 'RNifti' 1.7.0 -> 1.8.0"
# [1] "Updating 'RRPP' 2.1.1 -> 2.1.2"
# [1] "Updating 'shinyWidgets' 0.8.7 -> 0.9.0"
# [1] "Updating 'ssdtools' 2.2.0 -> 2.3.0"
# [1] "Updating 'summarytools' 1.0.1 -> 1.1.0"
# [1] "Updating 'tclust' 2.0-5 -> 2.1-0"
# [1] "Updating 'tidymodels' 1.2.0 -> 1.3.0"
# [1] "Updating 'tinytex' 0.54 -> 0.55"
# [1] "Updating 'tm' 0.7-15 -> 0.7-16"
# [1] "Updating 'tune' 1.2.1 -> 1.3.0"
# [1] "Updating 'unigd' 0.1.2 -> 0.1.3"
# [1] "Updating 'vegan3d' 1.3-0 -> 1.4-0"
# [1] "Updating 'workflows' 1.1.4 -> 1.2.0"
# [1] "Updating 'xfun' 0.50 -> 0.51"
# [1] "Updating 'XLConnect' 1.1.0 -> 1.2.0"
# [1] "Updating 'zoo' 1.8-12 -> 1.8-13"


