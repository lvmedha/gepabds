#!/bin/bash -ue
Rscript -e '
library(gepabds)
library(SingleCellExperiment)

se <- readRDS("example_se.rda")

p <- plot_scatter(se, "CHST3", "UGT2B15")
ggsave("scatter.png", p)
'
