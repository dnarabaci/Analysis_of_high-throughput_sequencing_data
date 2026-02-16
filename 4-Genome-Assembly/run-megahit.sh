#!/bin/bash

PATH=/mnt/silo/hts2024/dnarabaci/programs/bin/megahit/.../bin:$PATH

mkdir -p megahit

# Directories containing raw and corrected files
raw_path="/mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/"
corr_path="/mnt/silo/hts2024/dnarabaci/p4/1-2-Data-Preprocessing/subsets-phred33-bfc/"

assemble_megahit() {
    local read_prefix="$1"
    local outdir="$2"
    local threads=8

    megahit \
        -1 "${read_prefix}_1.fq.gz" \
        -2 "${read_prefix}_2.fq.gz" \
        -o "$outdir" \
        -t "$threads"
}

samples=("Cru" "Cgr")

for sample in "${samples[@]}"; do
    for dir in "$raw_path" "$corr_path"; do
        if [[ "$dir" == *"-bfc/" ]]; then
            outfolder="megahit/${sample}-bfc"
        else
            outfolder="megahit/${sample}"
        fi
        echo "Assembling $sample from $dir into $outfolder..."
        assemble_megahit "${dir}${sample}" "$outfolder"
    done
done
