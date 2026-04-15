build_expr_long <- function(sce, genes) {
  mat <- as.matrix(SingleCellExperiment::logcounts(sce))
  cell_type <- SummarizedExperiment::colData(sce)$label

  genes <- genes[genes %in% rownames(mat)]
  n_cells <- ncol(mat)

  expr_vals <- unlist(lapply(genes, function(g) mat[g, ]))

  data.frame(
    cell_id = rep(colnames(mat), length(genes)),
    gene = rep(genes, each = n_cells),
    expr = expr_vals,
    cell_type = rep(cell_type, length(genes))
  )
}

