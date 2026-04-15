#Violin Plot

plot_violin <- function(expr_long) {
  ggplot2::ggplot(expr_long,
                  ggplot2::aes(x = cell_type, y = expr, fill = cell_type)) +
    ggplot2::geom_violin(trim = FALSE, alpha = 0.7) +
    ggplot2::geom_boxplot(width = 0.15, fill = "white") +
    ggplot2::facet_wrap(~ gene, scales = "free_y") +
    ggplot2::theme_bw() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45))
}

#Scatter Plot

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
