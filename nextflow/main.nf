#!/usr/bin/env nextflow

nextflow.enable.dsl=2

/*
 * Pipeline parameters
 */
params.input = "../r-package/data/example_se.rda"
params.outdir = 'results'

/*
 * Import module
 */
include { geneprofile } from "./modules/geneprofile.nf"

workflow {

    main:

        // create input channel (REQUIRED for grading)
        ch_input = Channel.fromPath(params.input, checkIfExists: true)

        // run your module
        geneprofile(ch_input)

    publish:

        // collect outputs
        results = geneprofile.out
}

/*
 * Output definition
 */
output {
    results {
        path "${params.outdir}"
        mode 'copy'
    }
}