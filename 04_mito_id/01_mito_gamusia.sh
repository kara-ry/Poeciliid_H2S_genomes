#!/bin/bash
#SBATCH --job-name=mitohifi
#SBATCH --output=out/mitohifi.out
#SBATCH --error=err/mitohifi.err
#SBATCH --time=08:00:00
#SBATCH --mem=12G
#SBATCH --cpus-per-task=6

module load mitohifi/3.2.2

# Run MitoHiFi
mitohifi.py -r $1 -a animal \
  -f Gaffinis_mito.fa -g Gaffinis_mito.gb \
  -t 6
