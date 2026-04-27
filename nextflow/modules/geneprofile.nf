process geneprofile {

    container "hw2-test:0.0.1"   

    input:
    path input_file

    output:
    path "results/*"

    script:
    """
    mkdir -p results

    gepabds scatter \
        --input ${input_file} \
        --output results/scatter.png \
        --gene1 CHST3 \
        --gene2 UGT2B15
    """
}