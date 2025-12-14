

library(packageRank)



annualPlot("logr", from = 2025)
countsRanks("logr")


sassyp <- c("logr", "fmtr", "common", "macro", "reporter", "libr", "sassy", "procs")
cranDownloads()


packageDistribution("logr")

packageRank(sassyp)


library(risk.assessr)


options(repos = c(
  RSPM = "http://cran.us.r-project.org",
  INTERNAL_RSPM = "<your_internal_RSPM>"
))


risk_assess_package <- risk_assess_pkg("C:\\packages\\fmtr_1.7.0.tar.gz")



