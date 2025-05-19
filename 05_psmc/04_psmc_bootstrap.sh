#!/bin/bash
#SBATCH --partition=popgenom,cas
#SBATCH --job-name=psmc
#SBATCH --output=out/psmc_convert_%x_%j.out
#SBATCH --error=err/psmc_convert_%x_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kara.ryan@wsu.edu
#SBATCH --time=7-00:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=10G

# psmc downloaded via conda because it was not on kamiak at the time
# version 0.6.5-r67

# convert to psmc format

fq2psmcfa -q20 ${1}.fq.gz > ${1}.psmcfa

splitfa ${1}.psmcfa > ${1}_split.psmcfa

psmc -N25 -t15 -r5 -p "1+1+1+1+25*2+4+6" -o ${1}.psmc ${1}.psmcfa
	seq 100 | xargs -i echo psmc -N25 -t15 -r5 -b -p "1+1+1+1+25*2+4+6" \
	    -o ${1}-round-{}.psmc ${1}_split.psmcfa | sh
    cat ${1}.psmc ${1}-round-*.psmc > ${1}_combined.psmc
