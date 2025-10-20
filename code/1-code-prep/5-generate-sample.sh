#!/bin/bash

# run generate sample R script for our data and store the results in derived data directory
Rscript generate-sample.R ../../data/derived/accel-ids.txt ../../data/original/BMX_data/BMX_D.csv  ../../results
