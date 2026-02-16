#!/bin/bash

# ### seqtk example for DNA1_1
# ~/programs/seqtk/seqtk-1.4/seqtk seq -Q64 -V /mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/DNA-seq/rawdata/DNA1_1.fq.gz | gzip >/mnt/silo/hts2024/dnarabaci/p3/2-3-Fastq-file-transformations/DNA1_1.fq.gz

### Loop over all files
for f in /mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/DNA-seq/rawdata/*.fq.gz; do
	outfile=$(echo $f | sed 's/.*\//rawdata-phred33\//')
	~/programs/seqtk/seqtk-1.4/seqtk seq -Q64 -V $f \
	| gzip >/mnt/silo/hts2024/dnarabaci/p3/2-3-Fastq-file-transformations/$outfile
done
