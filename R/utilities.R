


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
