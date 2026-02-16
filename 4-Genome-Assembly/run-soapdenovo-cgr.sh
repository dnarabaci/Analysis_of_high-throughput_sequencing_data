#!/bin/bash

PATH=/mnt/silo/hts2024/dnarabaci/programs/miniconda/bin:$PATH

k=51

cap="Cgr"

### C. rubella rawdata
mkdir -p ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-raw/K$k

SOAPdenovo-63mer all \
  -s ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-raw.conf \
  -K $k \
  -R \
  -o ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-raw/K$k \
  1>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-raw/K$k-assembly.log \
  2>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-raw/K$k-assembly.err


### C. rubella bfc error corrected
mkdir -p ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-bfc/K$k

SOAPdenovo-63mer all \
  -s ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-bfc.conf \
  -K $k \
  -R \
  -o ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-bfc/K$k \
  1>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-bfc/K$k-assembly.log \
  2>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/$cap-bfc/K$k-assembly.err


