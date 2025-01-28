#!/bin/bash
#SBATCH --job-name=repeat_mask
#SBATCH --time=4-00:00:00
#SBATCH --output=out/repeat_mask_%j.out # output file
#SBATCH --error=err/repeat_mask_%j.err # error file
#SBATCH --cpus-per-task=24
#SBATCH --mem=20GB

module load repeatmasker/4.1.5 bedtools

RepeatMasker -pa 24 -s \
-lib $1.TE -dir ${1}_rpmask \
-gff ${1}.ragtag.scaffold.fasta

# Covert repeat file to bed file for masking
sed -e '1,3d' ${1}_rpmask.out | \
  awk -v OFS='\t' '{print $5, $6-1, $7}' | \
  sort -k1,1 -k2,2 -V > ${1}_rpmask.out.bed

bedtools maskfasta \
    -soft \
    -fi ${1}.ragtag.scaffold.fasta \
    -bed ${1}_rpmask.out.bed \
    -fo	${1}.ragtag.scaffold.softmasked.fa

bedtools maskfasta \
    -mc X \
     -fi ${1}.ragtag.scaffold.fasta \
    -bed ${1}_rpmask.out.bed \
    -fo	${1}.ragtag.scaffold.Xmasked.fa    
