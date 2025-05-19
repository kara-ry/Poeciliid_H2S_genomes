# Gsex NS
awk -v ids="ptg000180l,ptg000232l,NC_004388.1_RagTag" 'BEGIN{split(ids,rm,",")} /^>/ {h=substr($0,2); keep=1; for(i in rm) if(h==rm[i]) keep=0} keep' ../20_scaffold/Gsex_NS.ragtag.scaffold.fasta > Gsex_NS_filtered_plus_mito.fasta

cat ../25_mitohifi_contigs/gsex_ns/final_mitogenome.fasta >> Gsex_NS_filtered_plus_mito.fasta

# Gsex S
awk -v ids="ptg000240c,NC_004388.1_RagTag" 'BEGIN{split(ids,rm,",")} /^>/ {h=substr($0,2); keep=1; for(i in rm) if(h==rm[i]) keep=0} keep' ../20_scaffold/Gsex_S.ragtag.scaffold.fasta > Gsex_S_filtered_plus_mito.fasta

cat ../25_mitohifi_contigs/gsex_s/final_mitogenome.fasta >> Gsex_S_filtered_plus_mito.fasta

# Geury
awk -v ids="ptg000629l,ptg000626l,ptg000722l,ptg000716l,ptg000622l,ptg000715l,ptg000630l,ptg000623l,ptg000628l,NC_004388.1_RagTag" 'BEGIN{split(ids,rm,",")} /^>/ {h=substr($0,2); keep=1; for(i in rm) if(h==rm[i]) keep=0} keep' ../20_scaffold/Geury.ragtag.scaffold.fasta > Geury_filtered_plus_mito.fasta

cat ../25_mitohifi_contigs/geury/final_mitogenome.fasta >> Geury_filtered_plus_mito.fasta

# Pmex NS
awk -v ids="ptg000145l,NC_024238.1_RagTag" 'BEGIN{split(ids,rm,",")} /^>/ {h=substr($0,2); keep=1; for(i in rm) if(h==rm[i]) keep=0} keep' ../20_scaffold/Pmex_NS.ragtag.scaffold.fasta > Pmex_NS_filtered_plus_mito.fasta

cat ../25_mitohifi_contigs/pmex_ns/final_mitogenome.fasta >> Pmex_NS_filtered_plus_mito.fasta

# Psulph
awk -v ids="ptg000097c,NC_024238.1_RagTag" 'BEGIN{split(ids,rm,",")} /^>/ {h=substr($0,2); keep=1; for(i in rm) if(h==rm[i]) keep=0} keep' ../20_scaffold/Psulph.ragtag.scaffold.fasta > Psulph_filtered_plus_mito.fasta

cat ../25_mitohifi_contigs/psulph/final_mitogenome.fasta >> Psulph_filtered_plus_mito.fasta

# Pmex S - only 1 mito ID'd, no mod needed
