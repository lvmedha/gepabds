#' Example SingleCellExperiment dataset from Muraro Subset
#'
#' A small subset of the Muraro human pancreas dataset that
#' contains a reduced number of genes and cells for testing.
#'
#' @format A SingleCellExperiment object with:
#' \describe{
#'   \item{assays}{logcounts and counts matrices}
#'   \item{colData}{cell metadata including cell type labels}
#'   \item{rowData}{gene metadata}
#' }
#'
#' @source \link{scRNAseq::MuraroPancreasData}
#'
#' @examples
#' data(example_se)
#' example_se
"example_se"
