#!/bin/bash
#SBATCH --job-name=synt
#SBATCH --time=0-24:00:00
#SBATCH --output=out/synt_%j.out # output file
#SBATCH --error=err/synt_%j.err # error file
#SBATCH --cpus-per-task=6
#SBATCH --mem=24GB

ntSynt -d 10 -p Gam_synt GCF_019740435.1_SWU_Gaff_1.0_genomic_23chroms.fa Geury.ragtag.scaffold.fasta Gsex_NS.ragtag.scaffold.fasta Gsex_S.ragtag.scaffold.fasta

export PATH=/hb/groups/kelley_lab/poeciliids/hifi_genomes/21_synteny/ntSynt-viz-1.0.0/bin/:$PATH
ntSynt-viz-1.0.0/bin/ntsynt_viz.py --blocks Gam_synt.synteny_blocks.tsv \
--fai GCF_019740435.1_SWU_Gaff_1.0_genomic_23chroms.fa.fai Geury.ragtag.scaffold.fasta.fai \
Gsex_NS.ragtag.scaffold.fasta.fai Gsex_S.ragtag.scaffold.fasta.fai \
--prefix Gam_synt_plotting_500k_tree --normalize --no-arrow --ribbon_adjust 0.20 \
--scale 50000000 --format pdf --length 500000 --tree Gam_synt_plotting_est-distances.nwk --target-genome GCF_019740435.1_SWU_Gaff_1.0_genomic_23chroms.fa
