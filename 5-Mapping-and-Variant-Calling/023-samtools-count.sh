#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/samtools-1.22.1:$PATH

dir="/mnt/silo/hts2024/dnarabaci/p5/"

mkdir -p "/mnt/silo/hts2024/dnarabaci/p5/bam_files"

for cap in Cg926 Cr1504; do
        samtools idxstats $dir/bam_files/$cap.sorted.bam | awk '{print $1"\t"$3}' > "${cap%.sorted.bam}.mapping_counts.txt"
done
