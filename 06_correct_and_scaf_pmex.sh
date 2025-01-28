#!/bin/bash
#SBATCH --job-name=subset
#SBATCH --account=pi-jkoc
#SBATCH --qos=pi-jkoc
#SBATCH --time=0-24:00:00
#SBATCH --partition=256x44,128x24,lab-colibri
#SBATCH --output=out/subset_%j.out # output file
#SBATCH --error=err/subset_%j.err # error file
#SBATCH --cpus-per-task=2
#SBATCH --mem=6GB

seqtk subseq GCF_000633615.1_Guppy_female_1.0_MT_genomic.fna \ 
pmex_chroms_split_pmex.txt > pmex_3chroms.fa

seqtk subseq bc1020_kraken_filtered.fa \
ptg000001l.txt > bc1020_missassembly.fa

ragtag.py correct --inter -t 2 -o Pmex_chrom1_split pmex_3chroms.fa bc1020_missassembly.fa

ragtag.py scaffold -o Pmex_chrom1_corrected pmex_3chroms.fa Pmex_chrom1_split/ptg01_pmex_split.fa
