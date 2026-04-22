#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

if (length(args) < 2) {
  stop("Usage: run_gepabds.R <gene1> <gene2>")
}

gene1 <- args[1]
gene2 <- args[2]

library(gepabds)

data(example_se)

t_scatter(example_se, gene1, gene2)

message("Done: ", gene1, " vs ", gene2)

