#!/bin/bash
#SBATCH --job-name=synt
#SBATCH --time=0-24:00:00
#SBATCH --output=out/synt_%j.out # output file
#SBATCH --error=err/synt_%j.err # error file
#SBATCH --cpus-per-task=6
#SBATCH --mem=24GB

ntSynt -d 10 -p poecilia_misassembly_fixed GCF_000633615.1_Guppy_female_1.0_MT_23.fa Psulph.ragtag.scaffold.fasta PmexS_fixed_scaffold.fa Pmex_NS.ragtag.scaffold.fasta
export PATH=/hb/groups/kelley_lab/poeciliids/hifi_genomes/21_synteny/ntSynt-viz-1.0.0/bin/:$PATH

ntSynt-viz-1.0.0/bin/ntsynt_viz.py --blocks poecilia_misassembly_fixed.synteny_blocks.tsv --prefix poecilia_fixed_misassembly_500k_tree \
--fai GCF_000633615.1_Guppy_female_1.0_MT_23.fa.fai Psulph.ragtag.scaffold.fasta.fai PmexS_fixed_scaffold.fa.fai Pmex_NS.ragtag.scaffold.fasta.fai \
--normalize --no-arrow --length 500000 --ribbon_adjust 0.20 --scale 50000000 --format pdf --tree poecilia_fixed_misassembly_500k_est-distances.nwk --target-genome GCF_000633615.1_Guppy_female_1.0_MT_23.fa \
--keep GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024331.1 GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024332.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024333.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024334.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024335.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024336.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024337.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024338.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024339.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024340.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024341.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024342.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024343.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024344.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024345.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024346.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024347.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024348.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024349.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024350.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024351.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024352.1 \
GCF_000633615.1_Guppy_female_1.0_MT_23.fa:NC_024353.1
