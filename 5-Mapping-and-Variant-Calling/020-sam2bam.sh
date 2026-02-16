#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/samtools-1.22.1:$PATH

dir="/mnt/silo/hts2024/dnarabaci/p5/"

mkdir -p "/mnt/silo/hts2024/dnarabaci/p5/bam_files"

for cap in Cg926 Cr1504; do
	samtools view -b -h -o $dir/bam_files/$cap.bam $dir/sam_files/$cap.sam
done

