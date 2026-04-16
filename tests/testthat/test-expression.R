test_that("compute_expr_stats returns correct structure", {
  data(example_se)

  genes <- rownames(example_se)[1:3]
  result <- compute_expr_stats(example_se, genes)

  expect_true(is.data.frame(result))
  expect_true(all(c("gene", "cell_type", "mean_expr", "median_expr", "detection_rate") %in% colnames(result)))
})

test_that("compute_gene_specificity returns data.frame", {
  data(example_se)

  genes <- rownames(example_se)[1:3]
  result <- compute_gene_specificity(example_se, genes)

  expect_true(is.data.frame(result))
  expect_true("gini_score" %in% colnames(result))
})

test_that("build_expr_long returns correct dimensions", {
  data(example_se)

  genes <- rownames(example_se)[1:2]
  result <- build_expr_long(example_se, genes)

  expect_true(is.data.frame(result))
  expect_true(all(c("cell_id", "gene", "expr", "cell_type") %in% colnames(result)))
})

test_that("plot_violin returns ggplot object", {
  data(example_se)

  genes <- rownames(example_se)[1:2]
  expr_long <- build_expr_long(example_se, genes)

  p <- plot_violin(expr_long)

  expect_s3_class(p, "ggplot")
})

test_that("plot_scatter returns ggplot object", {
  data(example_se)

  genes <- rownames(example_se)[1:2]

  p <- plot_scatter(example_se, genes[1], genes[2])

  expect_s3_class(p, "ggplot")
})
