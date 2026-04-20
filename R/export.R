#' Save expression statistics to a file
#'
#' @param stats_result Output from `compute_expr_stats()`
#' @param output_file File path to save results
#'
#' @return Invisible NULL; file is written to disk
#' @export
#'
#' @examples
#' \dontrun{
#' data(example_se)
#' genes <- rownames(example_se)[1:5]
#' res <- compute_expr_stats(example_se, genes)
#' save_expr_stats(res, "stats.tsv")
#' }
save_expr_stats <- function(stats_result, output_file) {

  utils::write.table(
    stats_result,
    file = output_file,
    sep = "\t",
    row.names = FALSE,
    quote = FALSE
  )

  message("Saved: ", output_file)

  invisible(NULL)
}
