# data-raw/example_se.R

library(SingleCellExperiment)
library(SummarizedExperiment)

set.seed(42)

# Small scRNA-seq dataset


n_genes <- 200
n_cells <- 30

counts <- matrix(
  rpois(n_genes * n_cells, lambda = 5),
  nrow = n_genes,
  ncol = n_cells
)

rownames(counts) <- paste0("gene", seq_len(n_genes))
colnames(counts) <- paste0("cell", seq_len(n_cells))


# Add cell types


cell_type <- rep(c("alpha", "beta", "delta"), length.out = n_cells)

# Add signal
counts[1:30, cell_type == "alpha"] <- counts[1:30, cell_type == "alpha"] * 3


# Cell metadata


col_data <- data.frame(
  label = cell_type,
  batch = rep(c("A", "B"), length.out = n_cells),
  row.names = colnames(counts)
)

# Gene metadata

row_data <- data.frame(
  gene_id = rownames(counts),
  gene_symbol = rownames(counts),
  row.names = rownames(counts)
)

# SingleCellExperiment object


example_se <- SingleCellExperiment(
  assays = list(counts = counts),
  colData = col_data,
  rowData = row_data
)

# Save into package data/

usethis::use_data(example_se, overwrite = TRUE)
