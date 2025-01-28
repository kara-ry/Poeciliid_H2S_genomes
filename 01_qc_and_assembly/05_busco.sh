!/bin/bash
#SBATCH --partition=cas,cahnrs,popgenom
#SBATCH --job-name=busco
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err
#SBATCH --time=7-00:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=8GB

module add singularity

singularity exec -B ${PWD} docker://ezlabgva/busco:v5.4.3_cv1 busco \
-i ./kraken/${1}_cleaned.fa \
-m genome \
-l cyprinodontiformes_odb10 \
--out ${1}_cleaned -c 16
