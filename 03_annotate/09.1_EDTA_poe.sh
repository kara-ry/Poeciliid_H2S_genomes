#!/bin/bash
#SBATCH --job-name=EDTA
#SBATCH --time=4-00:00:00
#SBATCH --output=out/EDTA_poe_%j.out # output file
#SBATCH --error=err/EDTA_poe_%j.err # error file
#SBATCH --cpus-per-task=20
#SBATCH --mem=36GB

# conda activate EDTA
EDTA.pl \
  --genome ${1} \
  --cds GCF_001443325.1_P_mexicana-1.0_cds_from_genomic.fna \
  --overwrite 1 \
  --sensitive 1 \
  --anno 1 \
  --threads 20
