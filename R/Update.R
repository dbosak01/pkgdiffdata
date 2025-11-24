

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
  sver <- svect[pkg]
  aver <- avect[pkg]

  # print(pkg)
  # print(sver)
  # print(aver)
  if (!is.na(sver) && !is.na(aver)) {
    if (sver != aver) {

      print(paste0("Updating '", pkg, "' ", svect[pkg], " -> ", avect[pkg]))

      npkg <- tryCatch({update_package_data(pkg)},
                       error = function(cond){NULL})

      if (!is.null(npkg)) {

        print(npkg$stability)
      }

    }
  }

}

ml <- update_package_list()
length(ml)



# update_package_data("zoo")
