#!/bin/bash
#SBATCH --job-name=hifi_qc
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --time=1-00:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=12GB

module load fastqc

for file in ./pmex_hifi_genomes/bams/*.bam
do
fastqc -t 2 -o ${output} ${file}
done
