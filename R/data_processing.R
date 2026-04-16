#' Build long-format expression data
#'
#' Converts expression data from a SingleCellExperiment object into
#' long format for downstream analysis and plotting.
#'
#' @param sce A SingleCellExperiment object
#' @param genes Character vector of gene names to extract
#'
#' @return A data.frame with columns: cell_id, gene, expr, and cell_type
#'
#' @importFrom SingleCellExperiment logcounts
#' @importFrom SummarizedExperiment colData
#' @export
build_expr_long <- function(sce, genes) {

  if (!inherits(sce, "SingleCellExperiment")) {
    stop("sce must be a SingleCellExperiment object")
  }

  if (!is.character(genes)) {
    stop("genes must be a character vector")
  }

  mat <- as.matrix(SingleCellExperiment::logcounts(sce))
  cell_type <- SummarizedExperiment::colData(sce)$label

  genes <- genes[genes %in% rownames(mat)]

  if (length(genes) == 0) {
    stop("None of the provided genes were found in the dataset")
  }

  n_cells <- ncol(mat)
  expr_vals <- unlist(lapply(genes, function(g) mat[g, ]))

  data.frame(
    cell_id   = rep(colnames(mat), length(genes)),
    gene      = rep(genes, each = n_cells),
    expr      = expr_vals,
    cell_type = rep(cell_type, length(genes)),
    stringsAsFactors = FALSE
  )
}

