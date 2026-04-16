library(usethis)

use_git()


library(usethis)
use_github()

usethis::gh_token_help()
usethis::create_github_token()

gitcreds::gitcreds_set()

use_mit_license()

use_package("SingleCellExperiment")
use_package("scRNAseq")
use_package("scuttle")
use_package("ggplot2")
use_package("SummarizedExperiment")

usethis::use_r("data_processing")
usethis::use_r("stats")
usethis::use_r("plotting")

usethis::use_r("raw_data")

use_package("testthat", type = "Suggests")
use_package("knitr", type = "Suggests")
