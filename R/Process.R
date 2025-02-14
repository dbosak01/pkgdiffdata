
library(cranlogs)
library(pkgdiff)


apkgs <- pkgdiff:::available_packages()
spkgs <- pkgdiff:::github_packages()



# For now, filter by top downloads
tlst <- cran_top_downloads(count = 100)



# For now
pkgs <- tlst$package

for (pkg in pkgs) {



  if (pkgdiff:::is_popular(pkg)) {

    cat(paste0("Processing ", pkg, "...\n"))

    create_package_data(pkg)

  }
}


