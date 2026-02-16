#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/bwa/bwa:$PATH

ref="/mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/ref/GCF_000375325.1_Caprub1_0_genomic.fna"
read1="/mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/Cr1504_1.fq.gz"
read2="/mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/Cr1504_2.fq.gz"

bwa index $ref

bwa mem $ref $read1 $read2 > /mnt/silo/hts2024/dnarabaci/p5/Cr1504.sam

read1="/mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/Cg926_1.fq.gz"
read2="/mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/Cg926_2.fq.gz"
bwa mem $ref $read1 $read2 > /mnt/silo/hts2024/dnarabaci/p5/Cg926.sam
