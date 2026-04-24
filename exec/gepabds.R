#!/usr/bin/env Rapp
#| name: gepabds
#| title: gepabds CLI
#| description: CLI for gene expression plotting

suppressPackageStartupMessages({
  library(gepabds)
  library(ggplot2)
})

switch(
  "",

  # ---------------------------
  # Scatter plot subcommand
  # ---------------------------
  scatter = {

    #| description: Input file (.rds or .rda)
    input <- ""

    #| description: Output PNG file
    output <- ""

    #| description: First gene
    gene1 <- ""

    #| description: Second gene
    gene2 <- ""

    # ---------------------------
    # validation
    # ---------------------------
    if (input == "" || output == "" || gene1 == "" || gene2 == "") {
      stop("All arguments --input, --output, --gene1, --gene2 are required", call. = FALSE)
    }

    if (!file.exists(input)) {
      stop("Input file not found: ", input, call. = FALSE)
    }

    # ---------------------------
    # load data (.rds or .rda)
    # ---------------------------
    if (grepl("\\.rds$", input)) {

      se <- readRDS(input)

    } else if (grepl("\\.rda$", input) || grepl("\\.RData$", input)) {

      load(input)

      if (!exists("example_se")) {
        stop("No object named 'example_se' found in .rda file", call. = FALSE)
      }

      se <- example_se

    } else {
      stop("Unsupported file format. Use .rds or .rda", call. = FALSE)
    }

    # ---------------------------
    # run plotting function
    # ---------------------------
    p <- plot_scatter(se, gene1, gene2)

    # ---------------------------
    # ensure output directory exists
    # ---------------------------
    out_dir <- dirname(output)
    if (!dir.exists(out_dir)) {
      dir.create(out_dir, recursive = TRUE)
    }

    # ---------------------------
    # save plot
    # ---------------------------
    ggplot2::ggsave(output, p)

    message("Saved: ", output)
  }
)
