#!/bin/bash
PATH=/mnt/silo/hts2024/dnarabaci/programs/samtools-1.22.1:$PATH
PATH=/mnt/silo/hts2024/dnarabaci/programs/bcftools-1.22/:$PATH

ref_dir="/mnt/silo/hts2024/dnarabaci/data/Capsella-sequencing/ref"
alignments_dir="/mnt/silo/hts2024/dnarabaci/p5/bam_files"
output_dir="/mnt/silo/hts2024/dnarabaci/p5"

mkdir -p $output_dir/variant_calling
cd $output_dir/variant_calling

# bcftools mpileup -f reference.fa alignments.bam | bcftools call -mv -Ob -o calls.bcf
## -m: alternative model for multiallelic and rare-variant calling
## -v: output variant sites only
## -O b: output compressed bcf format (or v for uncompressed vcf format)
## -o file: output file

echo "Calling bcftools..."

bcftools mpileup -Ou \
    -f $ref_dir/GCF_000375325.1_Caprub1_0_genomic.fna $alignments_dir/Cg926.sorted.bam $alignments_dir/Cr1504.sorted.bam \
    | bcftools call -m -v -Ov -o subsets_calls.vcf

