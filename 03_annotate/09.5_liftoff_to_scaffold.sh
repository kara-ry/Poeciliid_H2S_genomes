#!/bin/bash
#SBATCH --job-name=liftoff
#SBATCH --time=4-00:00:00
#SBATCH --account=pi-jkoc
#SBATCH --qos=pi-jkoc
#SBATCH --partition=lab-colibri
#SBATCH --output=out/liftoff_%j.out # output file
#SBATCH --error=err/liftoff_%j.err # error file
#SBATCH --cpus-per-task=6
#SBATCH --mem=36GB
#SBATCH --mail-user=kamaryan@ucsc.edu         ### email address
#SBATCH --mail-type=BEGIN,END,FAIL

module load minimap
#conda activate liftoff

liftoff -g ./02_annotate_genes/${1}.gtf \
-o ${1}.ragtag.scaffold.braker.gff -u ${1}.unmapped.features.txt \
-dir ${1}_liftoff -p 6 \
-polish \
./20_scaffold/${1}.ragtag.scaffold.fa ./20_scaffold/${2}_kraken_filtered.fa
