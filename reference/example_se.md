# Example SingleCellExperiment dataset from Muraro Subset

A small subset of the Muraro human pancreas dataset that contains a
reduced number of genes and cells for testing.

## Usage

``` r
example_se
```

## Format

A SingleCellExperiment object with:

- assays:

  logcounts and counts matrices

- colData:

  cell metadata including cell type labels

- rowData:

  gene metadata

## Source

scRNAseq::MuraroPancreasData

## Examples

``` r
data(example_se)
example_se
#> class: SingleCellExperiment 
#> dim: 200 30 
#> metadata(0):
#> assays(2): counts logcounts
#> rownames(200): KBTBD4 ZNF423 ... MMAA SLC31A2
#> rowData names(2): symbol chr
#> colnames(30): D31-5_83 D31-4_92 ... D31-1_87 D31-3_64
#> colData names(4): label donor plate sizeFactor
#> reducedDimNames(0):
#> mainExpName: endogenous
#> altExpNames(1): ERCC
```
