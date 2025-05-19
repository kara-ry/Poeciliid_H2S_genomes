#!/bin/bash
#SBATCH --job-name=convert # Name the job
#SBATCH --time=2-00:00:00 # Wall clock time limit in Days-Hours:min:seconds
#SBATCH --partition=128x24 # Run on the instruction partition
#SBATCH --mail-user=kamaryan@ucsc.edu # Send updates to email
#SBATCH --mail-type=ALL # send all types of updates
#SBATCH --output=out/convert_%j.out # output file
#SBATCH --error=err/convert_%j.err # error file
#SBATCH --ntasks=1 # Run 1 job
#SBATCH --ntasks-per-node=1 # One task per computer
#SBATCH --cpus-per-task=8 # 2 CPUs per job
#SBATCH --mem=20GB # Memory limit 20GB

module load samtools/samtools-1.17

# convert sam to bam file
samtools view -bS ${1}.sam > ${1}.bam

# sort the bam
samtools sort ${1}.bam -o ${1}_sorted.bam

samtools index ${1}_sorted.bam
