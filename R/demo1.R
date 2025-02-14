
remotes::install_github("https://github.com/dbosak01/pkgdiff")

# New package: pkgdiff

# Goals:
# 1. Package information.
# 2. Package differences.
# 3. Stability rating.
# 4. Breaking changes report for entire repository/list of packages.
# 5. Drill-down reports on packages with breaking changes.
# 6. Ease portability with compatible versions instead of exact versions.
# 7. Scan code for known breaking changes.
# 8. Minimum compatible version.
# 9. Badge and web site for public display and promoting backward compatibility.

library(pkgdiff)

# Get package information
pkg_info("logr")

# Get package information
pkg_info("dplyr")

# View package stability
pkg_stability("fansi")

# View package stability
pkg_stability("dplyr")

# Compare versions
pkg_diff("dplyr", "1.0.10", "1.1.0")

# View package stability
pkg_stability("admiral")

# Compare versions
pkg_diff("admiral", "0.12.3", "1.0.0")

# Upgrade list
pkgs <- c("admiral", "curl", "dplyr", "common", "openssl", "pillar", "purrr")

# Get installed versions
res1 <- pkg_repo(pkgs, ver = "current")

res1

# Get latest versions
res2 <- pkg_repo(pkgs, ver = "latest")

res2

# Get Upgrade Report
res3 <- repo_breakages(res1, res2)

res3

# Repo Stability
res4 <- repo_stability(pkgs)

res4

# To do: Improve accuracy

# To do: Increase performance

# To do: Finish documentation

# To do: Code scan

# To do: Create badge for stability score

# To do: Create website to publish package stability ratings


