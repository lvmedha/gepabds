#!/bin/bash -ue
mkdir -p results

gepabds scatter         --input example_se.rda         --output results/scatter.png         --gene1 CHST3         --gene2 UGT2B15
