#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/bfc/bfc-master:$PATH

outdir=~/p4/1-2-Data-Preprocessing/subsets-phred33-bfc


for f in /mnt/silo/hts2024/data/Capsella-sequencing/DNA-seq/subsets-phred33/C*.fq.gz; do
    sample=$(echo $f | sed 's/.*\///' | sed 's/.fq.gz//')
    echo $sample $f
    bfc \
        -s 1m \
        -t 4 \
        $f \
        | gzip > $outdir/$sample.fq.gz

done



### Quality control
mkdir -p $outdir/fastqc

/mnt/silo/hts2024/dnarabaci/programs/FastQC/fastqc \
    -o $outdir/fastqc \
    $outdir/*.fq.gz
