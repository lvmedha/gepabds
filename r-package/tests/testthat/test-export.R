test_that("save_expr_stats creates file", {

  data(example_se, package = "gepabds")

  genes <- rownames(example_se)[1:5]
  result <- compute_expr_stats(example_se, genes = genes)

  tmp_file <- tempfile(fileext = ".tsv")

  save_expr_stats(result, tmp_file)

  expect_true(file.exists(tmp_file))

  # Read file and check structure
  df <- read.table(tmp_file, header = TRUE, sep = "\t")

  expect_true(nrow(df) > 0)
})
