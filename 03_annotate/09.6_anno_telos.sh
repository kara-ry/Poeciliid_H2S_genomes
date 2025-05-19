#!/bin/bash
#SBATCH --job-name=telo
#SBATCH --time=4-00:00:00
#SBATCH --partition=128x24
#SBATCH --output=out/telo_poe_%j.out # output file
#SBATCH --error=err/telo_poe_%j.err # error file
#SBATCH --cpus-per-task=4
#SBATCH --mem=16GB
#SBATCH --mail-user=kamaryan@ucsc.edu         ### email address
#SBATCH --mail-type=BEGIN,END,FAIL

#conda activate tidk

tidk build
tidk find --clade Cypriniformes --output ${1}_find_poe --dir ${1}_find_poe ${1}.fasta
tidk find --clade Cypriniformes --output ${1}_find_gam --dir ${1}_find_gam ${1}.fasta

tidk plot --tsv $1 --output ${2}.plot
