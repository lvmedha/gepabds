process prepare {

    container 'hw2-test'

    input:
    path se_file

    output:
    path "prepared.rda"

    script:
    """
    cp ${se_file} prepared.rda
    """
}