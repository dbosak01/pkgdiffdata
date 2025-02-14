library(pkgdiff)
library(common)


create_package_data <- function(pkg) {

  ret <- list()

  infos <- pkgdiff:::get_all_infos(pkg)


  dat <- pkgdiff:::get_info_data(pkg, infos)


  ret[["stability"]] <- dat
  ret[["infos"]] <- infos

  fl <- file.path("data", paste0(pkg, ".RData"))

  if (file.exists(fl))
    file.remove(fl)

  save(ret, file = fl)

  return(ret)
}


local_package <- function(pth) {

  fl <- pth

  info <- tryCatch({
    ret <- get(load(fl))
    ret
  },
  error = function(e){NULL})

  return(info)

}

update_package_list <- function() {

  d <- "./data"

  fls <- file.find(d, "*.RData", up = 0, down = 1)

  pknms <- c()
  pkver <- c()

  idx <- 1
  for (fl in fls) {
    info <- local_package(fl)
    pkver[idx] <- info$stability[1, "Version"]
    pknms[idx] <- info$stability[1, "Package"]
    idx <- idx + 1
  }

  names(pkver) <- pknms

  pf <- "packages.rds"
  if (file.exists(pf))
    unlink(pf)

  save(pkver, file = pf)

  return(pkver)

}

# ml <- update_package_list()
# length(ml)


# mt <- cranlogs::cran_top_downloads(count = 100)
# "scales" %in% mt$package
