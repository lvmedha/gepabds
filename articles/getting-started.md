# Getting Started with gepabds

Introduction

The gepabds package provides tools for analyzing gene expression data
stored in SummarizedExperiment objects.

This vignette shows how to compute expression statistics for selected
genes.

``` r

#load data
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

``` r
#exploredata
# View gene names
rownames(example_se)
#>   [1] "KBTBD4"         "ZNF423"         "CCDC74A"        "TBX19"         
#>   [5] "ORAI3"          "NOVA1"          "TPSAB1"         "ARHGEF35"      
#>   [9] "OGFR"           "TNPO1"          "DNM1P35"        "PLCB4"         
#>  [13] "USP25"          "POPDC2"         "SRGAP2"         "CDIPT"         
#>  [17] "LOC389332"      "RSPH4A"         "PRMT2"          "SCARNA9L"      
#>  [21] "ALG10"          "ZXDA"           "ABO"            "FAM46A"        
#>  [25] "MOSPD2"         "LRRC37A11P"     "WDR83"          "DHX34"         
#>  [29] "SMO"            "FRMD6-AS1"      "FGF10"          "NDUFV1"        
#>  [33] "AAK1"           "RESP18"         "SNAP25"         "ARL6IP1"       
#>  [37] "STX1B"          "KCNC3"          "LAIR1"          "RWDD2B"        
#>  [41] "RTBDN"          "SPRYD7"         "SMG6"           "CAPSL"         
#>  [45] "ACOT2"          "HPCAL1"         "TGIF2-C20orf24" "CAPZA1"        
#>  [49] "CCDC112"        "ABHD5"          "IFNGR1"         "EMC1"          
#>  [53] "FPGT-TNNI3K"    "SCLY"           "SMIM6"          "SH3BGRL3"      
#>  [57] "HAUS4"          "LINC00693"      "FAM171B"        "IL1R2"         
#>  [61] "TSPAN11"        "KLF13"          "MAGEB5"         "FAM189A1"      
#>  [65] "ZC3H10"         "ZNRF2"          "NLRX1"          "MAN2A2"        
#>  [69] "SCCPDH"         "ZBTB21"         "P2RY6"          "ZSCAN30"       
#>  [73] "PIM1"           "C1S"            "LOC100505679"   "PARP10"        
#>  [77] "CNGB3"          "GTF2H5"         "PRKCDBP"        "CAMKK1"        
#>  [81] "PANK1"          "IRF2BPL"        "PHF12"          "SLC35C2"       
#>  [85] "LOC100506421"   "GALNT9"         "UBXN10"         "TNFSF9"        
#>  [89] "STAG2"          "TAOK3"          "LOC100130348"   "ZNF687"        
#>  [93] "PPP1R12A"       "ZNF350"         "LIME1"          "LIN7B"         
#>  [97] "EIF3B"          "COX16"          "C5orf34"        "IFT46"         
#> [101] "STK32C"         "SLC6A17"        "ASZ1"           "MORN5"         
#> [105] "TIAL1"          "TNS4"           "CDC16"          "MAP6"          
#> [109] "DCTN5"          "EP300"          "CHST3"          "NPHP3"         
#> [113] "CDK11B"         "PGAP1"          "CLCA4"          "SYNDIG1"       
#> [117] "MRPL21"         "ATG3"           "FKBP1AP1"       "CREG1"         
#> [121] "DPT"            "DDX10"          "EEF1E1-MUTED"   "RNF111"        
#> [125] "CLOCK"          "MRPL4"          "MAP3K14-AS1"    "PIWIL2"        
#> [129] "UGT2B15"        "C2orf15"        "BCAS2"          "HSPA7"         
#> [133] "CCNA1"          "EFNA4"          "KCNA2"          "RPS10"         
#> [137] "KIFC1"          "A1BG"           "LOC100289473"   "RALGPS1"       
#> [141] "LOC100506195"   "ZNF490"         "LOC100505695"   "CLTCL1"        
#> [145] "PIGO"           "NOP16"          "ATP6AP2"        "C1orf227"      
#> [149] "SLC8A2"         "FRAS1"          "TMEM39B"        "HAAO"          
#> [153] "LRRC2-AS1"      "C6orf62"        "DCAF17"         "MRPL11"        
#> [157] "HNF4A"          "GBAP1"          "RNF148"         "MEIS3P1"       
#> [161] "LOC641746"      "ZCCHC3"         "DLK1"           "SERINC1"       
#> [165] "TEX21P"         "ACOX3"          "MSH5-SAPCD1"    "OCIAD1"        
#> [169] "CA13"           "FXR1"           "CCT2"           "CD276"         
#> [173] "ESCO1"          "EMID1"          "NACC1"          "SPSB1"         
#> [177] "PGBD3"          "DBNL"           "MED13L"         "ZC3H7B"        
#> [181] "LOC79015"       "FAM86C2P"       "IQCH"           "ZNF702P"       
#> [185] "FUT10"          "TMPRSS11D"      "HDLBP"          "RHPN1-AS1"     
#> [189] "PTPN6"          "HOXA10"         "CRYM"           "FAM228A"       
#> [193] "ZDHHC22"        "GPRASP2"        "GORASP1"        "NFX1"          
#> [197] "FGR"            "BTBD7"          "MMAA"           "SLC31A2"

# View sample metadata
colData(example_se)
#> DataFrame with 30 rows and 4 columns
#>                label       donor    plate sizeFactor
#>          <character> <character> <factor>  <numeric>
#> D31-5_83 mesenchymal         D31        5   1.484996
#> D31-4_92        beta         D31        4   0.760032
#> D31-6_69      acinar         D31        6   1.077424
#> D29-7_30          pp         D29        7   0.590132
#> D30-8_64       alpha         D30        8   1.676675
#> ...              ...         ...      ...        ...
#> D30-8_87 endothelial         D30        8   1.809580
#> D29-2_47          pp         D29        2   0.512505
#> D31-7_47        beta         D31        7   0.688036
#> D31-1_87       alpha         D31        1   1.196185
#> D31-3_64      acinar         D31        3   2.222911
```

``` r
#genesofinterest
genes_to_use <- rownames(example_se)[1:5]
genes_to_use
#> [1] "KBTBD4"  "ZNF423"  "CCDC74A" "TBX19"   "ORAI3"
```

``` r

#computeexpressionstatistics

result <- compute_expr_stats(example_se, genes = genes_to_use)

result
#>       gene   cell_type mean_expr median_expr detection_rate n_cells
#> 1   KBTBD4 mesenchymal 0.0000000   0.0000000      0.0000000       2
#> 2   KBTBD4        beta 0.0000000   0.0000000      0.0000000       3
#> 3   KBTBD4      acinar 0.0000000   0.0000000      0.0000000       6
#> 4   KBTBD4          pp 0.0000000   0.0000000      0.0000000       4
#> 5   KBTBD4       alpha 0.0000000   0.0000000      0.0000000      10
#> 6   KBTBD4 endothelial 0.0000000   0.0000000      0.0000000       2
#> 7   KBTBD4       delta 0.0000000   0.0000000      0.0000000       1
#> 8   KBTBD4        duct 0.0000000   0.0000000      0.0000000       2
#> 9   ZNF423 mesenchymal 0.3719604   0.3719604      0.5000000       2
#> 10  ZNF423        beta 0.0000000   0.0000000      0.0000000       3
#> 11  ZNF423      acinar 0.0000000   0.0000000      0.0000000       6
#> 12  ZNF423          pp 0.0000000   0.0000000      0.0000000       4
#> 13  ZNF423       alpha 0.0000000   0.0000000      0.0000000      10
#> 14  ZNF423 endothelial 1.1493168   1.1493168      1.0000000       2
#> 15  ZNF423       delta 0.0000000   0.0000000      0.0000000       1
#> 16  ZNF423        duct 0.0000000   0.0000000      0.0000000       2
#> 17 CCDC74A mesenchymal 0.6169727   0.6169727      0.5000000       2
#> 18 CCDC74A        beta 0.0000000   0.0000000      0.0000000       3
#> 19 CCDC74A      acinar 0.0000000   0.0000000      0.0000000       6
#> 20 CCDC74A          pp 0.3075665   0.0000000      0.2500000       4
#> 21 CCDC74A       alpha 0.1232688   0.0000000      0.1000000      10
#> 22 CCDC74A endothelial 0.0000000   0.0000000      0.0000000       2
#> 23 CCDC74A       delta 0.0000000   0.0000000      0.0000000       1
#> 24 CCDC74A        duct 0.0000000   0.0000000      0.0000000       2
#> 25   TBX19 mesenchymal 0.3133253   0.3133253      0.5000000       2
#> 26   TBX19        beta 0.0000000   0.0000000      0.0000000       3
#> 27   TBX19      acinar 0.0000000   0.0000000      0.0000000       6
#> 28   TBX19          pp 0.0000000   0.0000000      0.0000000       4
#> 29   TBX19       alpha 0.0000000   0.0000000      0.0000000      10
#> 30   TBX19 endothelial 0.0000000   0.0000000      0.0000000       2
#> 31   TBX19       delta 0.0000000   0.0000000      0.0000000       1
#> 32   TBX19        duct 0.5766949   0.5766949      0.5000000       2
#> 33   ORAI3 mesenchymal 0.0000000   0.0000000      0.0000000       2
#> 34   ORAI3        beta 1.0610933   1.2130741      0.6666667       3
#> 35   ORAI3      acinar 0.2475599   0.0000000      0.3333333       6
#> 36   ORAI3          pp 0.3075665   0.0000000      0.2500000       4
#> 37   ORAI3       alpha 0.5745060   0.0000000      0.4000000      10
#> 38   ORAI3 endothelial 0.3178523   0.3178523      0.5000000       2
#> 39   ORAI3       delta 0.0000000   0.0000000      0.0000000       1
#> 40   ORAI3        duct 0.0000000   0.0000000      0.0000000       2
```
