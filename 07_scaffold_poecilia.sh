#!/bin/bash
#SBATCH --job-name=scaf
#SBATCH --time=0-24:00:00
#SBATCH --output=out/ragtag_%j.out # output file
#SBATCH --error=err/ragtag_%j.err # error file
#SBATCH --cpus-per-task=4
#SBATCH --mem=12GB

module load minimap2/2.17

ragtag.py scaffold -o ${1}_ragtag_gup -u -t 4 GCF_000633615.1_23chrom.fa \
${1}_kraken_filtered.fa
