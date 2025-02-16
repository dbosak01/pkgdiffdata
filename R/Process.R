
library(cranlogs)
library(pkgdiff)


apkgs <- pkgdiff:::available_packages()
spkgs <- pkgdiff:::github_packages()


apkgs[apkgs$Package == 'Matrix', ]
apkgs <- apkgs[seq(10747, nrow(apkgs)), ]

# For now, filter by top downloads
# tlst <- cran_top_downloads(count = 100)

lst <- apkgs$Package[!apkgs$Package %in% names(spkgs)]

popularity <- 25000
brks <- c()

for (pkg in lst) {

  fl <- file.path("./data", paste0(pkg, ".RData"))

  if (!file.exists(fl)) {

    if (pkgdiff:::is_popular(pkg, popularity)) {

      cat(paste0("Processing ", pkg, "...\n"))

      res <- tryCatch({create_package_data(pkg)},
               error = function(er){NULL})

      if (is.null(res)) {
        brks[length(brks) + 1] <- pkg
      }

    }
  }
}


