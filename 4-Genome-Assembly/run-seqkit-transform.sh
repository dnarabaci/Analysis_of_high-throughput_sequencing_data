#!/bin/bash

for f in /mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/DNA-seq/rawdata/*.fq.gz; do
    outfile=$(echo $f | sed 's/.*\//rawdata-phred33-seqkit\//')
    echo $f $outfile

    ## Transform to phred33 quality encoding
    ~/programs/seqkit/seqkit convert $f --from Illumina-1.5+ | gzip >/mnt/silo/hts2024/dnarabaci/p3/2-3-Fastq-file-transformations/$outfile

done
