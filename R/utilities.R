library(pkgdiff)
library(common)

# Create package data from beginning
create_package_data <- function(pkg) {

  ret <- list()

  infos <- pkgdiff:::get_all_infos(pkg)

  if (!is.null(infos)) {

    dat <- pkgdiff:::get_info_data(pkg, infos)


    ret[["stability"]] <- dat
    ret[["infos"]] <- infos

    fl <- file.path("data", paste0(pkg, ".RData"))

    if (file.exists(fl))
      file.remove(fl)

    save(ret, file = fl)
  }

  return(ret)
}

# Updates info with latest release
update_package_data <- function(pkg) {

  #browser()
  ret <- NULL

  verdat <- pkgdiff:::get_all_versions(pkg, skip_size = TRUE)
  ginfos <- pkgdiff:::github_package(pkg)

  gvers <- names(ginfos$infos)

  sq <- seq(nrow(verdat), 1)
  for (idx in sq) {

    # browser()
    tver <- verdat$Version[idx]
    if (!tver %in% gvers) {
      nlst <- list()
      info <- pkgdiff:::get_info_cran(pkg, tver)
      nlst[[tver]] <- info
      ginfos$infos <- c(nlst, ginfos$infos)
      pver <- verdat$Version[idx + 1]
      if (!is.na(pver)) {
        mginfos <- ginfos$infos[c(tver, pver)]
        nrw <- pkgdiff:::get_info_data(pkg, mginfos, skip_first = TRUE)
        if (!is.null(nrw)) {
          if (nrow(nrw) > 1) {
            ginfos$stability <- rbind(nrw[1, ], ginfos$stability)
          } else if (nrow(nrw) == 1) {
            ginfos$stability <- rbind(nrw, ginfos$stability)
          }
          rownames(ginfos$stability) <- NULL
        }
      }
      ret <- ginfos
    }
  }

  # browser()

  if (!is.null(ret)) {

    fl <- file.path("data", paste0(pkg, ".RData"))

    if (file.exists(fl))
      file.remove(fl)

    save(ret, file = fl)
  }

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

# Update the cache package list
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

  uf <- "LastUpdate.RData"
  if (file.exists(uf))
    unlink(uf)

  tm <- now_utc()

  save(tm, file = uf)


  return(pkver)

}

now_utc <- function() {
  now <- Sys.time()
  attr(now, "tzone") <- "UTC"
  now
}



# ml <- update_package_list()
# length(ml)


# mt <- cranlogs::cran_top_downloads(count = 100)
# "scales" %in% mt$package
