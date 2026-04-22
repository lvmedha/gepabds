#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

# ONLY run CLI if executed directly
if (length(args) > 0 && !interactive()) {

  if (length(args) < 4) {
    stop("Usage: run_gepabds.R <input.rds> <output.png> <gene1> <gene2>")
  }

  input_file <- args[1]
  output_file <- args[2]
  gene1 <- args[3]
  gene2 <- args[4]

  library(gepabds)

  example_se <- readRDS(input_file)

  png(output_file, width = 800, height = 600)

  t_scatter(example_se, gene1, gene2)

  dev.off()

  message("Saved plot to: ", output_file)
}
