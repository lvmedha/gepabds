gini <- function(x) {
  x <- sort(x[x >= 0])
  n <- length(x)
  if (n == 0 || sum(x) == 0) return(0)
  2 * sum(seq_along(x) * x) / (n * sum(x)) - (n + 1) / n
}


#' Computing per-group expression statistics
#'
#' @param sce SingleCellExperiment object
#' @param genes character vector of genes
#'
#' @return data.frame of expression stats
#'
#' @importFrom SingleCellExperiment logcounts counts
#' @importFrom SummarizedExperiment colData
#' @export
compute_expr_stats <- function(sce, genes) {

  mat <- as.matrix(SingleCellExperiment::logcounts(sce))
  raw <- as.matrix(SingleCellExperiment::counts(sce))
  cell_type <- SummarizedExperiment::colData(sce)$label

  genes <- genes[genes %in% rownames(mat)]
  if (length(genes) == 0) stop("No valid genes")

  groups <- unique(cell_type)

  out <- list()
  k <- 1

  for (gene in genes) {
    for (ct in groups) {
      idx <- cell_type == ct

      out[[k]] <- data.frame(
        gene = gene,
        cell_type = ct,
        mean_expr = mean(mat[gene, idx]),
        median_expr = median(mat[gene, idx]),
        detection_rate = mean(raw[gene, idx] > 0),
        n_cells = sum(idx)
      )
      k <- k + 1
    }
  }

  do.call(rbind, out)
}

#' Computing gene specificity (Gini score)
#'
#' @param sce SingleCellExperiment object
#' @param genes character vector of genes
#'
#' @return data.frame of gene specificity
#'
#' @importFrom SingleCellExperiment logcounts
#' @importFrom SummarizedExperiment colData
#' @export
compute_gene_specificity <- function(sce, genes) {

  mat <- as.matrix(SingleCellExperiment::logcounts(sce))
  cell_type <- SummarizedExperiment::colData(sce)$label

  genes <- genes[genes %in% rownames(mat)]
  if (length(genes) == 0) stop("No valid genes")

  out <- lapply(genes, function(g) {
    group_means <- tapply(mat[g, ], cell_type, mean)

    data.frame(
      gene = g,
      gini_score = gini(as.numeric(group_means)),
      top_group = names(which.max(group_means)),
      top_mean = max(group_means)
    )
  })

  df <- do.call(rbind, out)
  df[order(df$gini_score, decreasing = TRUE), ]
}
