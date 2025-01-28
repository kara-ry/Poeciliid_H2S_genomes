#!/bin/bash
#SBATCH --job-name=scaf
#SBATCH --account=pi-jkoc
#SBATCH --qos=pi-jkoc
#SBATCH --time=0-24:00:00
#SBATCH --partition=256x44,128x24,lab-colibri
#SBATCH --output=out/ragtag_%j.out # output file
#SBATCH --error=err/ragtag_%j.err # error file
#SBATCH --cpus-per-task=4
#SBATCH --mem=12GB
#SBATCH --mail-user=kamaryan@ucsc.edu         ### email address
#SBATCH --mail-type=BEGIN,END,FAIL

module load minimap2/2.17

ragtag.py scaffold -o ${1}_ragtag_gup -t 4 GCF_019740435.1_gambusia23.fa \
${1}_kraken_filtered.fa
