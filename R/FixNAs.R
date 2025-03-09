
library(pkgdiff)

source("./R/utilities.R")

svect <- pkgdiff::pkg_cache()


for (pkg in svect$Package) {


  fl <- file.path("./data", paste0(pkg, ".RData"))

  inf <- local_package(fl)

  stb <- inf$stability

  if (any(is.na(stb$AF)) && any(is.na(stb$RF))) {

    print(paste0("Updating '", pkg, "' ..."))

    cat("Before:\n")
    print(stb)

    dat <- pkgdiff:::get_info_data(pkg, inf$infos)

    inf[["stability"]] <- dat

    if (file.exists(fl))
      file.remove(fl)

    save(inf, file = fl)

    cat("After:\n")
    print(dat)
  }

}
