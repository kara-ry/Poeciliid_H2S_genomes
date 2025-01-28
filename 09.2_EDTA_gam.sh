#!/bin/bash
#SBATCH --job-name=EDTA
#SBATCH --time=5-00:00:00
#SBATCH --output=out/EDTA_gam_%j.out # output file
#SBATCH --error=err/EDTA_gam_%j.err # error file
#SBATCH --cpus-per-task=20
#SBATCH --mem=36GB

# conda activate EDTA
EDTA.pl \
  --genome ${1} \
  --cds GCF_019740435.1_SWU_Gaff_1.0_cds_from_genomic.fna \
  --overwrite 1 \
  --sensitive 1 \
  --anno 1 \
  --threads 20
