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

  #| title: Scatter plot
  #| description: Generate scatter plot for two genes
  scatter = {

    #| description: Input RDS file
    input <- ""

    #| description: Output PNG file
    output <- ""

    #| description: First gene
    gene1 <- ""

    #| description: Second gene
    gene2 <- ""

    # validation
    if (input == "" || output == "" || gene1 == "" || gene2 == "") {
      stop("All arguments --input, --output, --gene1, --gene2 are required", call. = FALSE)
    }

    if (!file.exists(input)) {
      stop("Input file not found: ", input, call. = FALSE)
    }

    # load data
    se <- readRDS(input)

    # run your package function
    p <- t_scatter(se, gene1, gene2)

    # save plot
    ggsave(output, p)

    message("Saved: ", output)
  }
)
