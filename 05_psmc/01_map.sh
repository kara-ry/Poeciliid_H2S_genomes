#!/bin/bash
#SBATCH --job-name=map # Name the job
#SBATCH --time=2-00:00:00 # Wall clock time limit in Days-Hours:min:seconds
#SBATCH --partition=128x24 # Run on the instruction partition
#SBATCH --mail-user=kamaryan@ucsc.edu # Send updates to email
#SBATCH --mail-type=ALL # send all types of updates
#SBATCH --output=out/Map_%j.out # output file
#SBATCH --error=err/Map_%j.err # error file
#SBATCH --ntasks=1 # Run 1 job
#SBATCH --ntasks-per-node=1 # One task per computer
#SBATCH --cpus-per-task=8 # 2 CPUs per job
#SBATCH --mem=20GB # Memory limit 20GB

module load minimap2/2.24 hb hb-gnu

# Submit as sbatch 01_map.sh genome reads output_sam
# -ax asm20 is for hifi reads

minimap2 -ax map-hifi $1 $2 > $3
