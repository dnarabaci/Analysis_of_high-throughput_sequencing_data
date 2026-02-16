#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/bfc/bfc-master:$PATH

#mkdir -p rawdata-phred33-bfc-corrected

for f in /mnt/silo/hts2024/dnarabaci/p3/2-3-Fastq-file-transformations/rawdata-phred33/*.fq.gz; do
    sample=$(echo $f | sed 's/.*\///' | sed 's/.fq.gz//')
    echo $sample $f
    bfc \
        -s 250m \
        -t 4 \
        $f \
        | gzip > /mnt/silo/hts2024/dnarabaci/p3/2-4-Error-Correction/rawdata-phred33-bfc-corrected/$sample.fq.gz

done



### Quality control
#mkdir -p rawdata-phred33-bfc-corrected/fastqc
/mnt/silo/hts2024/dnarabaci/programs/FastQC/fastqc \
    -o /mnt/silo/hts2024/dnarabaci/p3/2-4-Error-Correction/rawdata-phred33-bfc-corrected/fastqc \
    /mnt/silo/hts2024/dnarabaci/p3/2-4-Error-Correction/rawdata-phred33-bfc-corrected/*.fq.gz
