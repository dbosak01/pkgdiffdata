
library(cranlogs)
library(pkgdiff)


apkgs <- pkgdiff:::available_packages()
spkgs <- pkgdiff:::github_packages()



# For now, filter by top downloads
# tlst <- cran_top_downloads(count = 100)

lst <- apkgs$Package[!apkgs$Package %in% names(spkgs)]

popularity <- 25000

for (pkg in lst) {

  fl <- file.path("./data", paste0(pkg, ".RData"))

  if (!file.exists(fl)) {

    if (pkgdiff:::is_popular(pkg, popularity)) {

      cat(paste0("Processing ", pkg, "...\n"))

      create_package_data(pkg)
    }
  }
}


