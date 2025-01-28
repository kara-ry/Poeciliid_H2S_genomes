#!/bin/bash
#SBATCH --partition=cas,cahnrs,popgenom
#SBATCH --job-name=hifiasm
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --time=7-00:00:00
#SBATCH --cpus-per-task=24
#SBATCH --mem-per-cpu=2G

module add hifiasm

hifiasm -o ${1}.asm -t 24 ./fastq/${1}.fq
