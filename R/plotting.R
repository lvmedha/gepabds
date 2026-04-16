#' Violin plot of gene expression
#'
#' @param expr_long data.frame from build_expr_long()
#'
#' @return ggplot object
#'
#' @importFrom ggplot2 ggplot aes geom_violin geom_boxplot facet_wrap theme_bw theme element_text
#' @export
plot_violin <- function(expr_long) {

  ggplot2::ggplot(expr_long,
                  ggplot2::aes(x = cell_type, y = expr, fill = cell_type)) +
    ggplot2::geom_violin(trim = FALSE) +
    ggplot2::geom_boxplot(width = 0.15) +
    ggplot2::facet_wrap(~ gene) +
    ggplot2::theme_bw() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45))
}

#' Scatter plot between two genes
#'
#' @param sce SingleCellExperiment object
#' @param gene_a First gene
#' @param gene_b Second gene
#'
#' @return ggplot object
#'
#' @importFrom SingleCellExperiment logcounts
#' @importFrom SummarizedExperiment colData
#' @importFrom ggplot2 ggplot aes geom_point theme_bw
#' @export
plot_scatter <- function(sce, gene_a, gene_b) {

  mat <- as.matrix(SingleCellExperiment::logcounts(sce))
  cell_type <- SummarizedExperiment::colData(sce)$label

  df <- data.frame(
    x = mat[gene_a, ],
    y = mat[gene_b, ],
    cell_type = cell_type
  )

  ggplot2::ggplot(df, ggplot2::aes(x, y, color = cell_type)) +
    ggplot2::geom_point() +
    ggplot2::theme_bw()
}
