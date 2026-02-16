#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/samtools-1.22.1:$PATH
PATH=/mnt/silo/hts2024/dnarabaci/programs/bwa/bwa:$PATH

ref="/mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/ref/GCF_000375325.1_Caprub1_0_genomic.fna"
read1="/mnt/silo/hts2024/dnarabaci/p4/1-2-Data-Preprocessing/subsets-phred33-trimmomatic-bfc/Cgr_1.fq.gz"
read2="/mnt/silo/hts2024/dnarabaci/p4/1-2-Data-Preprocessing/subsets-phred33-trimmomatic-bfc/Cgr_2.fq.gz"

bwa index $ref

bwa mem $ref $read1 $read2 | samtools view -b -h \
    | samtools sort -o /mnt/silo/hts2024/dnarabaci/p5/Cgr.bam
samtools index /mnt/silo/hts2024/dnarabaci/p5/Cgr.bam

read1="/mnt/silo/hts2024/dnarabaci/p4/1-2-Data-Preprocessing/subsets-phred33-trimmomatic-bfc/Cru_1.fq.gz"
read2="/mnt/silo/hts2024/dnarabaci/p4/1-2-Data-Preprocessing/subsets-phred33-trimmomatic-bfc/Cru_2.fq.gz"
bwa mem $ref $read1 $read2 | samtools view -b -h \
    | samtools sort -o /mnt/silo/hts2024/dnarabaci/p5/Cru.bam
samtools index /mnt/silo/hts2024/dnarabaci/p5/Cru.bam
