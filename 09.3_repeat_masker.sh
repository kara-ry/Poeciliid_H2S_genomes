#!/bin/bash
#SBATCH --job-name=repeat_mask
#SBATCH --time=4-00:00:00
#SBATCH --output=out/repeat_mask_%j.out # output file
#SBATCH --error=err/repeat_mask_%j.err # error file
#SBATCH --cpus-per-task=24
#SBATCH --mem=20GB

module load repeatmasker/4.1.5

RepeatMasker -pa 24 -s \
-lib $1 -dir ${2}_rpmask_out \
-gff ${2}.ragtag.scaffold.fasta
