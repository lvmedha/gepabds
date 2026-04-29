#!/usr/bin/env nextflow

nextflow.enable.dsl=2

/*
 * Pipeline parameters
 */
params.input = "../r-package/data/example_se.rda"
params.outdir = 'results'

/*
 * Import modules
 */
include { prepare } from "./modules/prepare.nf"
include { geneprofile } from "./modules/geneprofile.nf"

workflow {

    main:

        // create input channel
        ch_input = Channel.fromPath(params.input, checkIfExists: true)

        // run prepare step
        ch_prepared = prepare(ch_input)

        // pass output to geneprofile
        geneprofile(ch_prepared)

    publish:

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