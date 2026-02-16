#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/samtools-1.22.1:$PATH
PATH=/mnt/silo/hts2024/dnarabaci/programs/bcftools-1.22/:$PATH

VAR_DIR="/mnt/silo/hts2024/dnarabaci/p5/variant_calling"

#For large genome-wide VCFs (like from whole-genome sequencing) it’s better to compress and index.

bcftools view -v snps $VAR_DIR/subsets_calls.vcf -Oz -o snps.vcf

## Select homozygous genotypes
bcftools view -i 'GT="1/1" && GT="0/0"' $VAR_DIR/snps.vcf -Oz -o hom_snps.vcf
