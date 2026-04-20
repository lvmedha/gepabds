# Save expression statistics to a file

Save expression statistics to a file

## Usage

``` r
save_expr_stats(stats_result, output_file)
```

## Arguments

- stats_result:

  Output from
  [`compute_expr_stats()`](https://lvmedha.github.io/gepabds/reference/compute_expr_stats.md)

- output_file:

  File path to save results

## Value

Invisible NULL; file is written to disk

## Examples

``` r
if (FALSE) { # \dontrun{
data(example_se)
genes <- rownames(example_se)[1:5]
res <- compute_expr_stats(example_se, genes)
save_expr_stats(res, "stats.tsv")
} # }
```
