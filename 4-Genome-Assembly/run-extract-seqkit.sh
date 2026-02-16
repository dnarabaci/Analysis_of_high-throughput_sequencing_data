#!/bin/bash

# Set the directory containing FASTQ files
input_dir="/mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/rawdata"

# Set the directory for the output FASTA files
output_dir="/mnt/silo/hts2024/dnarabaci/p3/2-3-Fastq-file-transformations"

# Update the PATH variable to include seqkit
PATH=/mnt/silo/hts2024/dnarabaci/programs/seqkit/:$PATH

# Loop through each FASTQ file in the input directory
for fq_file in "$input_dir"/*.fq.gz; do
    # Extract the file name without extension
    filename=$(basename "$fq_file" .fq.gz)

    # Define the output file path
    faout="$output_dir/${filename}.fa"

    # Uncompress the FASTQ file, take the first 4000 lines, convert to FASTA, and save to the output file
    zcat "$fq_file" | head -n 4000 | seqkit fq2fa -o - > "$faout"

    echo "Processed $fq_file, saved as $faout"
done
