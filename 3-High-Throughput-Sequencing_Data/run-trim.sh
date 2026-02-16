#!/bin/sh

cat /mnt/silo/hts2024/dnarabaci/programs/Trimmomatic/trim2/Trimmomatic-0.39/adapters/*.fa | sed 's/>/\n>/' | sed '/^$/d' > /mnt/silo/hts2024/dnarabaci/p3/trimmomatic/adapters.fa

for sample in DNA1 DNA2 DNA3 DNA4; do

        java -jar /mnt/silo/hts2024/dnarabaci/programs/Trimmomatic/trim2/Trimmomatic-0.39/trimmomatic-0.39.jar \
		PE \
		-threads 4 \
		-phred64 \
                /mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/DNA-seq/rawdata/$sample\_1.fq.gz \
                /mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/DNA-seq/rawdata/$sample\_2.fq.gz \
                /mnt/silo/hts2024/dnarabaci/p3/trimmomatic/$sample\_1.fq.gz \
                /mnt/silo/hts2024/dnarabaci/p3/trimmomatic/$sample\_forward_unpaired.fq.gz \
                /mnt/silo/hts2024/dnarabaci/p3/trimmomatic/$sample\_2.fq.gz \
                /mnt/silo/hts2024/dnarabaci/p3/trimmomatic/$sample\_reverse_unpaired.fq.gz \
                ILLUMINACLIP:/mnt/silo/hts2024/dnarabaci/p3/trimmomatic/adapters.fa:2:30:10 \
                LEADING:20 \
                TRAILING:20 \
                SLIDINGWINDOW:20:15 \
                MINLEN:36

done
