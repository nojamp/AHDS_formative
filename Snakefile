rule all:
    "The default rule"
    input: "data/original/BMX_D.csv"

rule check_BMX:
    "Check BMX data file"
    input: "data/original/BMX_D.csv"
    shell: """
    bash code/1-code-prep/1-data-check-bm.sh
    """
