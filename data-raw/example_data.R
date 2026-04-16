# Example dataset created from a subset of MuraroPancreasData

library(SingleCellExperiment)
library(SummarizedExperiment)
library(scRNAseq)
library(scuttle)

set.seed(42)


# Load full Muraro dataset

sce <- MuraroPancreasData()

# Clean gene names
rownames(sce) <- sub("__chr.*$", "", rownames(sce))

# Keep labeled cells
sce <- sce[, !is.na(colData(sce)$label)]


# subset

# randomly sample cells
cells_keep <- sample(seq_len(ncol(sce)), 30)
sce_small <- sce[, cells_keep]

# subset genes
genes_keep <- sample(seq_len(nrow(sce_small)), 200)
sce_small <- sce_small[genes_keep, ]


# Normalize
sce_small <- logNormCounts(sce_small)


# Final object

example_se <- sce_small

# Save into package data

usethis::use_data(example_se, overwrite = TRUE)
