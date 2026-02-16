#!/bin/bash

outdir=~/p4/1-2-Data-Preprocessing/subsets-phred33-trimmomatic

mkdir -p $outdir $outdir/unpaired

for sample in Cru Cgr; do

    java -jar \
         /mnt/silo/hts2024/dnarabaci/programs/Trimmomatic/Trimmomatic-0.39/trimmomatic-0.39.jar \
         PE \
         -threads 4 \
         /mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/$sample\_1.fq.gz \
         /mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/$sample\_2.fq.gz \
         $outdir/$sample\_1.fq.gz \
         $outdir/unpaired/$sample\_1_unpaired.fq.gz \
         $outdir/$sample\_2.fq.gz \
         $outdir/unpaired/$sample\_2_unpaired.fq.gz \
         LEADING:20 \
         TRAILING:20 \
         SLIDINGWINDOW:20:15 \
         MINLEN:36

done
