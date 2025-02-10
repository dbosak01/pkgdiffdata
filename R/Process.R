
library(cranlogs)
library(pkgdiff)


apkgs <- pkgdiff:::available_packages()
spkgs <- pkgdiff:::github_packages()



# For now, filter by top downloads
tlst <- cran_top_downloads(count = 100)

flst <- apkgs[apkgs$Package %in% tlst$package, ]

names(flst)

# For now
tmplst <- lst[1:100, ]
for (idx in seq_len(nrow(tmplst))) {

  pkg <- tmplst[[idx, "Package"]]
  print(pkg)

  tmplst[idx, "Popular"] <- pkgdiff:::is_popular(pkg)
}


