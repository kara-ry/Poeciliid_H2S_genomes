Remove contaminants with Krakan2

## Database Setup
1. Download data for contaminants of interest, including bacteria, virus, protozoa, fungi, and archea.

```
kraken2-build --download-library archaea --db sulf
kraken2-build --download-library protozoa --db sulf
kraken2-build --download-library bacteria --db sulf
kraken2-build --download-library fungi --db sulf 
kraken2-build --download-library plant --db sulf 
kraken2-build --download-library human --db sulf
```

2. We will also add the current (12/2023) Pmex genome from NCBI. To do this, upload the genome from NCBI. \
Then, add the NCBI TaxID (you will need to look this up for the genome you add). Then add the taxid to \
the header of the fasta file. 

```
bioawk -c fastx '{print ">"$name"|kraken:taxid|48701\n"$seq}' GCF_001443325.1_P_mexicana-1.0_genomic.fna >Pmex.Tax.fa
```
3. Then add the fixed fasta file to the database 

```
kraken2-build --add-to-library Pmex.Tax.fa --db sulf
```

4. Finally, build the database with 
```
kraken2-build --build --db sulf
```

## Classify the sequences

```
kraken2 --db sulf seqs.fa
```
