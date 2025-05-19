#!/bin/bash
#SBATCH --job-name=consensus # Name the job
#SBATCH --time=2-00:00:00 # Wall clock time limit in Days-Hours:min:seconds
#SBATCH --partition=128x24 # Run on the instruction partition
#SBATCH --mail-user=kamaryan@ucsc.edu # Send updates to email
#SBATCH --mail-type=ALL # send all types of updates
#SBATCH --output=out/consensus_%j.out # output file
#SBATCH --error=err/consensus_%j.err # error file
#SBATCH --ntasks=1 # Run 1 job
#SBATCH --ntasks-per-node=1 # One task per computer
#SBATCH --cpus-per-task=8 # 2 CPUs per job
#SBATCH --mem=20GB # Memory limit 20GB

module load bcftools/bcftools-1.17

# sbatch 03_consenus.sh genome bam output.fq

bcftools mpileup -Q 30 -q 30 -Ou -f $1 \
$2 | bcftools call -c -Ov | /hb/software/apps/bcftools/gnu-1.17/bin/vcfutils.pl vcf2fq \
-d 7 -D 50 -Q 30 > $3
