#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/samtools-1.22.1:$PATH
PATH=/mnt/silo/hts2024/dnarabaci/programs/bowtie2-2.5.4-linux-x86_64/:$PATH

ref_dir="/mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/ref"
output_dir="/mnt/silo/hts2024/dnarabaci/p5/"
read_dir="/mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/"

mkdir -p $ref_dir/bowtie-index
cd $output_dir/bowtie-index

bowtie2-build $ref_dir/GCF_000375325.1_Caprub1_0_genomic.fna ref

for cap in Cg926 Cr1504; do
    bowtie2 -x $output_dir/ref -1 $read_dir/${cap}_1.fq.gz -2 $read_dir/${cap}_2.fq.gz
done 
