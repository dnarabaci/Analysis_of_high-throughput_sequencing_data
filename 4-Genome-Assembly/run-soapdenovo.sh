#!/bin/bash

PATH=/mnt/silo/hts2024/dnarabaci/programs/miniconda/bin:$PATH

k=51

### C. rubella rawdata
mkdir -p ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-raw/K$k

SOAPdenovo-63mer all \
  -s ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-raw.conf \
  -K $k \
  -R \
  -o ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-raw/K$k \
  1>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-raw/K$k-assembly.log \
  2>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-raw/K$k-assembly.err


### C. rubella bfc error corrected
mkdir -p ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-bfc/K$k

SOAPdenovo-63mer all \
  -s ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-bfc.conf \
  -K $k \
  -R \
  -o ~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-bfc/K$k \
  1>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-bfc/K$k-assembly.log \
  2>~/p4/1-3-denovo-genome-assembly-using-short-assembler/soapdenovo/Cru-bfc/K$k-assembly.err
